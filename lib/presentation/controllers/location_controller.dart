import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;
import '../../data/datasources/local/app_database.dart';
import '../../core/utils/logger.dart';
import '../providers.dart'; // 复用 Phase 1 已定义的 locationDaoProvider

class LocationsState {
  final Map<int, List<Location>> byDay;
  final bool isLoading;
  final String? error;

  const LocationsState({
    this.byDay = const {},
    this.isLoading = true,
    this.error,
  });

  LocationsState copyWith({
    Map<int, List<Location>>? byDay,
    bool? isLoading,
    String? error,
  }) {
    return LocationsState(
      byDay: byDay ?? this.byDay,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  List<Location> forDay(int day) => byDay[day] ?? const [];
}

class LocationsController extends StateNotifier<LocationsState> {
  final LocationDao dao;
  final String tripId;

  LocationsController(this.dao, this.tripId) : super(const LocationsState()) {
    reload();
  }

  Future<void> reload() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final all = await dao.getLocationsByTrip(tripId);
      final grouped = <int, List<Location>>{};
      for (final loc in all) {
        grouped.putIfAbsent(loc.dayNumber, () => []).add(loc);
      }
      for (final list in grouped.values) {
        list.sort((a, b) => a.sequenceInDay.compareTo(b.sequenceInDay));
      }
      state = state.copyWith(byDay: grouped, isLoading: false);
    } catch (e, st) {
      AppLogger.error('加载地点失败', e, st);
      state = state.copyWith(isLoading: false, error: '$e');
    }
  }

  Future<void> addLocation({
    required int day,
    required String name,
    required String locationType,
    required double latitude,
    required double longitude,
    String? address,
    String? notes,
  }) async {
    final id = 'loc_${DateTime.now().microsecondsSinceEpoch}';
    final seq = state.forDay(day).length;
    await dao.createLocation(LocationsCompanion.insert(
      id: id,
      tripId: tripId,
      name: name,
      locationType: locationType,
      latitude: latitude,
      longitude: longitude,
      address: Value(address),
      notes: Value(notes),
      dayNumber: day,
      sequenceInDay: seq,
    ));
    await reload();
  }

  Future<void> updateNotes(String locationId, String notes) async {
    final loc = await dao.getLocationById(locationId);
    if (loc == null) return;
    await dao.updateLocation(loc.toCompanion(true).copyWith(notes: Value(notes)));
    await reload();
  }

  Future<void> deleteLocation(String locationId) async {
    await dao.deleteLocation(locationId);
    await reload();
  }

  /// 拖拽排序：oldIndex/newIndex 遵循 Flutter ReorderableListView 的语义
  /// （newIndex 是"移除拖拽项之前"的目标下标，需要按官方文档做 -1 修正）
  Future<void> reorderDay(int day, int oldIndex, int newIndex) async {
    final list = List<Location>.from(state.forDay(day));
    if (newIndex > oldIndex) newIndex -= 1;
    final item = list.removeAt(oldIndex);
    list.insert(newIndex, item);

    // 乐观更新：先在内存里改好顺序，界面立即响应，再落库
    final newByDay = Map<int, List<Location>>.from(state.byDay);
    newByDay[day] = list;
    state = state.copyWith(byDay: newByDay);

    try {
      await dao.reorderLocations(tripId, day, list.map((l) => l.id).toList());
    } catch (e, st) {
      AppLogger.error('地点排序保存失败，回滚', e, st);
      await reload(); // 保存失败则重新拉取真实顺序，避免界面和数据库不一致
    }
  }
}

final locationsControllerProvider =
    StateNotifierProvider.family<LocationsController, LocationsState, String>((ref, tripId) {
  final dao = ref.watch(locationDaoProvider);
  return LocationsController(dao, tripId);
});
