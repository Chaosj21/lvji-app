import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;
import '../../data/datasources/local/app_database.dart';
import '../../core/constants/location_types.dart';
import '../providers.dart';
import 'packing_template_controller.dart';

class PackingState {
  final Map<String, List<PackingChecklist>> byCategory;
  final bool isLoading;

  const PackingState({this.byCategory = const {}, this.isLoading = true});

  PackingState copyWith({Map<String, List<PackingChecklist>>? byCategory, bool? isLoading}) {
    return PackingState(
      byCategory: byCategory ?? this.byCategory,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  int get totalCount => byCategory.values.fold(0, (sum, list) => sum + list.length);
  int get packedCount =>
      byCategory.values.fold(0, (sum, list) => sum + list.where((i) => i.isPacked).length);
}

class PackingController extends StateNotifier<PackingState> {
  final PackingDao dao;
  final String tripId;
  final Map<String, List<String>> seedTemplate;

  PackingController(this.dao, this.tripId, this.seedTemplate) : super(const PackingState()) {
    _loadOrSeed();
  }

  Future<void> _loadOrSeed() async {
    state = state.copyWith(isLoading: true);
    var items = await dao.getByTrip(tripId);

    // 首次进入这个旅程的物品清单页时，如果一条记录都没有，
    // 用用户在"设置 → 默认物品清单模板"里配置的模板去填充（不是写死的常量了）
    if (items.isEmpty) {
      int order = 0;
      for (final entry in seedTemplate.entries) {
        for (final itemName in entry.value) {
          await dao.createItem(PackingChecklistsCompanion.insert(
            id: 'pack_${DateTime.now().microsecondsSinceEpoch}_$order',
            tripId: tripId,
            category: entry.key,
            itemName: itemName,
            sortOrder: order,
          ));
          order++;
        }
      }
      items = await dao.getByTrip(tripId);
    }

    final grouped = <String, List<PackingChecklist>>{};
    for (final item in items) {
      grouped.putIfAbsent(item.category, () => []).add(item);
    }
    state = state.copyWith(byCategory: grouped, isLoading: false);
  }

  Future<void> togglePacked(String itemId, bool packed) async {
    await dao.togglePacked(itemId, packed);
    await _reloadQuiet();
  }

  Future<void> addItem(String category, String name) async {
    final order = state.byCategory.values.fold(0, (sum, list) => sum + list.length);
    await dao.createItem(PackingChecklistsCompanion.insert(
      id: 'pack_${DateTime.now().microsecondsSinceEpoch}',
      tripId: tripId,
      category: category,
      itemName: name,
      sortOrder: order,
    ));
    await _reloadQuiet();
  }

  Future<void> deleteItem(String itemId) async {
    await dao.deleteItem(itemId);
    await _reloadQuiet();
  }

  Future<void> _reloadQuiet() async {
    final items = await dao.getByTrip(tripId);
    final grouped = <String, List<PackingChecklist>>{};
    for (final item in items) {
      grouped.putIfAbsent(item.category, () => []).add(item);
    }
    state = state.copyWith(byCategory: grouped);
  }
}

final packingDaoProvider = Provider<PackingDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.packingDao;
});

final packingControllerProvider =
    StateNotifierProvider.family<PackingController, PackingState, String>((ref, tripId) {
  final dao = ref.watch(packingDaoProvider);
  final template = ref.watch(packingTemplateControllerProvider);
  return PackingController(dao, tripId, template);
});
