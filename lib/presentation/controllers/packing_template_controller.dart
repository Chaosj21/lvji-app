import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/location_types.dart';

const _kTemplateKey = 'packing_template_v1';

/// 用户自定义的"默认物品清单模板"——新建旅程首次打开物品清单页时，
/// 会拿这份模板去填充，而不是写死的 [defaultPackingCategories]。
/// 存在 SharedPreferences（JSON），只影响以后新建的旅程，不会动已经生成过清单的旧旅程。
class PackingTemplateController extends StateNotifier<Map<String, List<String>>> {
  PackingTemplateController() : super(_cloneDefault()) {
    _load();
  }

  static Map<String, List<String>> _cloneDefault() {
    return defaultPackingCategories.map((k, v) => MapEntry(k, List<String>.from(v)));
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kTemplateKey);
    if (raw == null) return;
    try {
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      state = decoded.map((k, v) => MapEntry(k, (v as List).map((e) => '$e').toList()));
    } catch (_) {
      // 解析失败就保留默认模板，不让用户看到崩溃
    }
  }

  Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kTemplateKey, jsonEncode(state));
  }

  Future<void> addItem(String category, String item) async {
    final trimmedCategory = category.trim();
    final trimmedItem = item.trim();
    if (trimmedCategory.isEmpty || trimmedItem.isEmpty) return;

    final list = List<String>.from(state[trimmedCategory] ?? []);
    if (!list.contains(trimmedItem)) list.add(trimmedItem);
    state = {...state, trimmedCategory: list};
    await _persist();
  }

  Future<void> removeItem(String category, String item) async {
    final list = List<String>.from(state[category] ?? [])..remove(item);
    final next = {...state};
    if (list.isEmpty) {
      next.remove(category);
    } else {
      next[category] = list;
    }
    state = next;
    await _persist();
  }

  Future<void> removeCategory(String category) async {
    final next = {...state}..remove(category);
    state = next;
    await _persist();
  }

  Future<void> resetToDefault() async {
    state = _cloneDefault();
    await _persist();
  }
}

final packingTemplateControllerProvider =
    StateNotifierProvider<PackingTemplateController, Map<String, List<String>>>((ref) {
  return PackingTemplateController();
});
