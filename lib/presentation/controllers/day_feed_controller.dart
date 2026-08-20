import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;
import '../../data/datasources/local/app_database.dart';
import '../../core/utils/logger.dart';
import '../providers.dart';

/// 随记和账单本质上是同一条"时间流"上的两种条目（跟 HTML 原型里的 momentsData 设计一致），
/// 用这个包装类把两种 Drift 生成的类型（Moment / Expense）统一起来，方便按天、按时间排序展示。
class FeedEntry {
  final Moment? moment;
  final Expense? expense;

  const FeedEntry.moment(this.moment) : expense = null;
  const FeedEntry.expense(this.expense) : moment = null;

  bool get isExpense => expense != null;
  int get dayNumber => isExpense ? expense!.dayNumber : moment!.dayNumber;
  DateTime get recordedAt => isExpense ? expense!.recordedAt : moment!.recordedAt;
  String get id => isExpense ? expense!.id : moment!.id;
}

class DayFeedState {
  final Map<int, List<FeedEntry>> byDay;
  final bool isLoading;
  final int totalSpentCents;

  const DayFeedState({
    this.byDay = const {},
    this.isLoading = true,
    this.totalSpentCents = 0,
  });

  DayFeedState copyWith({
    Map<int, List<FeedEntry>>? byDay,
    bool? isLoading,
    int? totalSpentCents,
  }) {
    return DayFeedState(
      byDay: byDay ?? this.byDay,
      isLoading: isLoading ?? this.isLoading,
      totalSpentCents: totalSpentCents ?? this.totalSpentCents,
    );
  }

  List<int> get activeDays {
    final days = byDay.keys.where((d) => byDay[d]!.isNotEmpty).toList();
    days.sort((a, b) => b.compareTo(a)); // 最近的天数在最上面，跟原型一致
    return days;
  }

  /// 元/分转换：数据库里统一存"分"，界面显示用"元"
  double get totalSpentYuan => totalSpentCents / 100.0;
  double get avgPerDayYuan => activeDays.isEmpty ? 0 : totalSpentYuan / activeDays.length;
}

class DayFeedController extends StateNotifier<DayFeedState> {
  final MomentDao momentDao;
  final ExpenseDao expenseDao;
  final String tripId;

  DayFeedController(this.momentDao, this.expenseDao, this.tripId) : super(const DayFeedState()) {
    reload();
  }

  Future<void> reload() async {
    state = state.copyWith(isLoading: true);
    try {
      final moments = await momentDao.getMomentsByTrip(tripId);
      final expenses = await expenseDao.getExpensesByTrip(tripId);

      final entries = <FeedEntry>[
        ...moments.map((m) => FeedEntry.moment(m)),
        ...expenses.map((e) => FeedEntry.expense(e)),
      ];

      final grouped = <int, List<FeedEntry>>{};
      for (final e in entries) {
        grouped.putIfAbsent(e.dayNumber, () => []).add(e);
      }
      for (final list in grouped.values) {
        list.sort((a, b) => b.recordedAt.compareTo(a.recordedAt)); // 每天内部新的在上面
      }

      final total = expenses.fold<int>(0, (sum, e) => sum + e.amount);

      state = state.copyWith(byDay: grouped, isLoading: false, totalSpentCents: total);
    } catch (e, st) {
      AppLogger.error('加载随记/账单失败', e, st);
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> addMoment({
    required int day,
    required String text,
    Uint8List? imageBytes,
    String? locationTag,
    String? weather,
  }) async {
    final id = 'moment_${DateTime.now().microsecondsSinceEpoch}';
    await momentDao.createMoment(MomentsCompanion.insert(
      id: id,
      tripId: tripId,
      dayNumber: day,
      momentType: imageBytes != null ? 'photo' : 'text',
      textContent: text,
      imageBytes: Value(imageBytes),
      locationTag: Value(locationTag),
      weather: Value(weather),
      recordedAt: DateTime.now(),
    ));
    await reload();
  }

  Future<void> updateMomentText(String id, String text) async {
    final moments = state.byDay.values.expand((l) => l).where((e) => e.id == id && !e.isExpense);
    if (moments.isEmpty) return;
    final m = moments.first.moment!;
    await momentDao.updateMoment(m.toCompanion(true).copyWith(textContent: Value(text)));
    await reload();
  }

  Future<void> deleteMoment(String id) async {
    await momentDao.deleteMoment(id);
    await reload();
  }

  Future<void> addExpense({
    required int day,
    required String name,
    required String category,
    required int amountCents,
    String? paymentMethod,
    Uint8List? receiptImageBytes,
    String? receiptOcrResult,
  }) async {
    final id = 'expense_${DateTime.now().microsecondsSinceEpoch}';
    await expenseDao.createExpense(ExpensesCompanion.insert(
      id: id,
      tripId: tripId,
      dayNumber: day,
      name: name,
      category: category,
      amount: amountCents,
      paymentMethod: Value(paymentMethod),
      receiptImageBytes: Value(receiptImageBytes),
      receiptOcrResult: Value(receiptOcrResult),
      recordedAt: DateTime.now(),
    ));
    await reload();
  }

  Future<void> updateExpense(String id, {String? name, int? amountCents}) async {
    final expenses = state.byDay.values.expand((l) => l).where((e) => e.id == id && e.isExpense);
    if (expenses.isEmpty) return;
    final e = expenses.first.expense!;
    await expenseDao.updateExpense(e.toCompanion(true).copyWith(
          name: name != null ? Value(name) : const Value.absent(),
          amount: amountCents != null ? Value(amountCents) : const Value.absent(),
        ));
    await reload();
  }

  Future<void> deleteExpense(String id) async {
    await expenseDao.deleteExpense(id);
    await reload();
  }
}

final dayFeedControllerProvider =
    StateNotifierProvider.family<DayFeedController, DayFeedState, String>((ref, tripId) {
  final momentDao = ref.watch(momentDaoProvider);
  final expenseDao = ref.watch(expenseDaoProvider);
  return DayFeedController(momentDao, expenseDao, tripId);
});
