import 'package:dio/dio.dart';
import '../../config/amap_keys.dart';
import '../../core/utils/logger.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';

/// 调用高德 Web服务 REST API 进行地点搜索（POI）。
///
/// 支持的功能：
/// - 关键字模糊搜索地点名称
/// - 按城市范围限定搜索区域
/// - 返回地点名称、地址、经纬度、类型等信息
///
/// 任何网络失败、Key 未配置、或 status != '1' 的情况，都会返回空列表，
/// 调用方不应因此崩溃。
class AMapPOIService {
  final Dio _dio;
  final String? overrideKey;

  /// [overrideKey]：用户在设置里手工配置的 Web服务 Key，优先于编译时写死的 [AMapKeys.webServiceKey]。
  AMapPOIService({Dio? dio, this.overrideKey})
      : _dio = dio ?? Dio(
          BaseOptions(
            baseUrl: 'https://restapi.amap.com/v3',
            connectTimeout: const Duration(seconds: 8),
            receiveTimeout: const Duration(seconds: 8),
          ),
        );

  String get _effectiveKey => (overrideKey != null && overrideKey!.isNotEmpty) ? overrideKey! : AMapKeys.webServiceKey;

  bool get isConfigured => _effectiveKey.isNotEmpty;

  /// 模糊搜索 POI 地点。
  ///
  /// [keyword] 搜索关键字，如"故宫"、"星巴克"。
  /// [city] 限定城市（中文城市名或城市区号，留空则不限）。
  /// [types] 地点类型筛选（可选，如 "餐饮服务|购物服务"），详见
  ///   https://lbs.amap.com/api/webservice/download
  ///
  /// 返回最多 [limit] 条结果，默认 10 条。
  Future<List<PoiResultItem>> search({
    required String keyword,
    String city = '',
    String types = '',
    int limit = 10,
  }) async {
    if (!isConfigured) {
      AppLogger.warning('AMap Web服务 Key 未配置，无法搜索 POI');
      return [];
    }
    if (keyword.trim().isEmpty) return [];

    try {
      final resp = await _dio.get('/place/text', queryParameters: {
        'keywords': keyword.trim(),
        'city': city,
        'citylimit': 'true',
        'type': types,
        'key': _effectiveKey,
        'output': 'JSON',
        'offset': limit.toString(),
        'page': '1',
      });

      final data = resp.data;
      if (data == null || data['status'] != '1') {
        AppLogger.warning('AMap POI 搜索返回异常: ${data?['info']}');
        return [];
      }

      final count = int.tryParse('${data['count'] ?? 0}') ?? 0;
      if (count == 0) return [];

      final pois = data['pois'] as List?;
      if (pois == null || pois.isEmpty) return [];

      return pois.map((p) => PoiResultItem._fromMap(p as Map<String, dynamic>)).toList();
    } catch (e, st) {
      AppLogger.error('AMap POI 搜索请求失败', e, st);
      return [];
    }
  }
}

/// POI 搜索结果条目。
class PoiResultItem {
  final String name;
  final String address;
  final String location; // "lng,lat"
  final String type;    // 高德类型编码
  final String adName;  // 所属区县

  const PoiResultItem({
    required this.name,
    required this.address,
    required this.location,
    required this.type,
    required this.adName,
  });

  factory PoiResultItem._fromMap(Map<String, dynamic> m) {
    return PoiResultItem(
      name: '${m['name'] ?? ''}',
      address: '${m['address'] ?? ''}',
      location: '${m['location'] ?? ''}',
      type: '${m['type'] ?? ''}',
      adName: '${m['adname'] ?? ''}',
    );
  }

  /// 解析 location 字符串为 LatLng。
  LatLng get latLng {
    final parts = location.split(',');
    final lng = double.tryParse(parts[0]);
    final lat = double.tryParse(parts[1]);
    return LatLng(lat ?? 0, lng ?? 0);
  }
}
