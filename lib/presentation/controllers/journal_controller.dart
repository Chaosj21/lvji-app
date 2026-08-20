import 'dart:math' as math;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;
import '../../core/constants/journal_styles.dart';
import '../../data/datasources/local/app_database.dart';
import '../../services/journal_generation_service.dart';
import '../providers.dart';
import 'ai_config_controller.dart';
import '../../domain/ai_config.dart';

class JournalStats {
  final int locationCount; // 打卡地点数
  final int photoCount; // 带图片的随记数
  final int recordCount; // 随记+账单总条数
  final double estimatedDistanceKm; // 估算总里程（基于地点经纬度直线距离，非真实路网距离）

  const JournalStats({
    required this.locationCount,
    required this.photoCount,
    required this.recordCount,
    required this.estimatedDistanceKm,
  });

  static const empty = JournalStats(locationCount: 0, photoCount: 0, recordCount: 0, estimatedDistanceKm: 0);
}

class JournalState {
  final bool isLoading;
  final bool isGenerating;
  final bool isEditing;
  final String title;
  final List<String> paragraphs;
  final JournalStyle style;
  final DateTime? generatedAt;
  final JournalStats stats;
  final Map<String, int> expenseByCategory; // category -> 分
  final int totalExpenseCents;

  const JournalState({
    this.isLoading = true,
    this.isGenerating = false,
    this.isEditing = false,
    this.title = '',
    this.paragraphs = const [],
    this.style = JournalStyle.concise,
    this.generatedAt,
    this.stats = JournalStats.empty,
    this.expenseByCategory = const {},
    this.totalExpenseCents = 0,
  });

  bool get hasContent => paragraphs.isNotEmpty;

  JournalState copyWith({
    bool? isLoading,
    bool? isGenerating,
    bool? isEditing,
    String? title,
    List<String>? paragraphs,
    JournalStyle? style,
    DateTime? generatedAt,
    JournalStats? stats,
    Map<String, int>? expenseByCategory,
    int? totalExpenseCents,
  }) {
    return JournalState(
      isLoading: isLoading ?? this.isLoading,
      isGenerating: isGenerating ?? this.isGenerating,
      isEditing: isEditing ?? this.isEditing,
      title: title ?? this.title,
      paragraphs: paragraphs ?? this.paragraphs,
      style: style ?? this.style,
      generatedAt: generatedAt ?? this.generatedAt,
      stats: stats ?? this.stats,
      expenseByCategory: expenseByCategory ?? this.expenseByCategory,
      totalExpenseCents: totalExpenseCents ?? this.totalExpenseCents,
    );
  }
}

class JournalController extends StateNotifier<JournalState> {
  final JournalDao journalDao;
  final MomentDao momentDao;
  final ExpenseDao expenseDao;
  final LocationDao locationDao;
  final JournalGenerationService generationService;
  final String tripId;
  final String tripTitle;
  final String destination;

  JournalController({
    required this.journalDao,
    required this.momentDao,
    required this.expenseDao,
    required this.locationDao,
    required this.generationService,
    required this.tripId,
    required this.tripTitle,
    required this.destination,
  }) : super(const JournalState()) {
    _load();
  }

  Future<void> _load() async {
    state = state.copyWith(isLoading: true);

    final existing = await journalDao.getByTrip(tripId);
    final stats = await _computeStats();
    final expenseSummary = await _computeExpenseSummary();

    if (existing != null) {
      state = state.copyWith(
        isLoading: false,
        title: existing.title,
        paragraphs: existing.content.split('\n\n'),
        style: JournalStyle.fromValue(existing.style),
        generatedAt: existing.generatedAt,
        stats: stats,
        expenseByCategory: expenseSummary.$1,
        totalExpenseCents: expenseSummary.$2,
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        stats: stats,
        expenseByCategory: expenseSummary.$1,
        totalExpenseCents: expenseSummary.$2,
      );
    }
  }

  Future<JournalStats> _computeStats() async {
    final locations = await locationDao.getLocationsByTrip(tripId);
    final moments = await momentDao.getMomentsByTrip(tripId);
    final expenses = await expenseDao.getExpensesByTrip(tripId);

    final photoCount = moments.where((m) => m.imageBytes != null).length;

    // 按天分组算每天连续地点间的直线距离，粗略估算总里程（不是真实路网距离，界面上会标注"约"）
    final byDay = <int, List<Location>>{};
    for (final l in locations) {
      byDay.putIfAbsent(l.dayNumber, () => []).add(l);
    }
    double totalKm = 0;
    for (final list in byDay.values) {
      list.sort((a, b) => a.sequenceInDay.compareTo(b.sequenceInDay));
      for (var i = 0; i < list.length - 1; i++) {
        totalKm += _haversineKm(
          list[i].latitude, list[i].longitude,
          list[i + 1].latitude, list[i + 1].longitude,
        ) * 1.3; // 绕路系数，跟 GeoUtils 里的估算逻辑保持一致
      }
    }

    return JournalStats(
      locationCount: locations.length,
      photoCount: photoCount,
      recordCount: moments.length + expenses.length,
      estimatedDistanceKm: totalKm,
    );
  }

  double _haversineKm(double lat1, double lng1, double lat2, double lng2) {
    const r = 6371.0;
    final dLat = _degToRad(lat2 - lat1);
    final dLng = _degToRad(lng2 - lng1);
    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_degToRad(lat1)) * math.cos(_degToRad(lat2)) * math.sin(dLng / 2) * math.sin(dLng / 2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return r * c;
  }

  double _degToRad(double deg) => deg * math.pi / 180.0;

  Future<(Map<String, int>, int)> _computeExpenseSummary() async {
    final expenses = await expenseDao.getExpensesByTrip(tripId);
    final map = <String, int>{};
    var total = 0;
    for (final e in expenses) {
      map[e.category] = (map[e.category] ?? 0) + e.amount;
      total += e.amount;
    }
    return (map, total);
  }

  Future<void> generate({JournalStyle? style}) async {
    final useStyle = style ?? state.style;
    state = state.copyWith(isGenerating: true, style: useStyle);

    final moments = await momentDao.getMomentsByTrip(tripId);
    final expenses = await expenseDao.getExpensesByTrip(tripId);

    final draft = await generationService.generate(
      tripTitle: tripTitle,
      destination: destination,
      moments: moments,
      expenses: expenses,
      style: useStyle,
    );

    final now = DateTime.now();
    await journalDao.upsert(JournalsCompanion.insert(
      id: 'journal_$tripId',
      tripId: tripId,
      title: draft.title,
      content: draft.paragraphs.join('\n\n'),
      style: Value(useStyle.value),
      generatedAt: now,
      lastEditedAt: now,
    ));

    state = state.copyWith(
      isGenerating: false,
      title: draft.title,
      paragraphs: draft.paragraphs,
      generatedAt: now,
    );
  }

  Future<void> setStyle(JournalStyle style) async {
    if (style == state.style) return;
    if (!state.hasContent) {
      state = state.copyWith(style: style);
      return;
    }
    await generate(style: style);
  }

  void toggleEditing() {
    state = state.copyWith(isEditing: !state.isEditing);
  }

  Future<void> saveEdits({required String title, required List<String> paragraphs}) async {
    final now = DateTime.now();
    await journalDao.upsert(JournalsCompanion.insert(
      id: 'journal_$tripId',
      tripId: tripId,
      title: title,
      content: paragraphs.join('\n\n'),
      style: Value(state.style.value),
      generatedAt: state.generatedAt ?? now,
      lastEditedAt: now,
    ));
    state = state.copyWith(title: title, paragraphs: paragraphs, isEditing: false);
  }
}

final journalGenerationServiceProvider = Provider<JournalGenerationService>((ref) {
  final aiConfig = ref.watch(aiConfigControllerProvider);
  if (aiConfig.mode == AIProviderMode.custom && aiConfig.isCustomReady) {
    return AIJournalGenerationService(ref.watch(aiServiceProvider));
  }
  // 默认渠道：本地模板拼接，不需要用户配置任何东西就能用
  return TemplateJournalGenerationService();
});

final journalControllerProvider =
    StateNotifierProvider.family<JournalController, JournalState, String>((ref, tripId) {
  final trip = ref.watch(tripDetailProvider(tripId)).value;
  return JournalController(
    journalDao: ref.watch(journalDaoProvider),
    momentDao: ref.watch(momentDaoProvider),
    expenseDao: ref.watch(expenseDaoProvider),
    locationDao: ref.watch(locationDaoProvider),
    generationService: ref.watch(journalGenerationServiceProvider),
    tripId: tripId,
    tripTitle: trip?.title ?? '这次旅程',
    destination: trip?.destination ?? '',
  );
});

final journalDaoProvider = Provider<JournalDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.journalDao;
});
