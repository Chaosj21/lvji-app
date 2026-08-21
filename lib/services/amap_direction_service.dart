import 'package:dio/dio.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';
import '../../config/amap_keys.dart';
import '../../core/constants/location_types.dart';
import '../../core/utils/geo_utils.dart';
import '../../core/utils/logger.dart';

/// 调用高德 Web服务 REST API 计算真实路线距离/耗时。
///
/// 覆盖范围（Phase 2.5）：
/// - drive / taxi：调用驾车路线规划 API
/// - walk：调用步行路线规划 API
/// - transit：公交路线规划 API 需要额外传城市编码，逻辑更复杂，Phase 2.5 先不做，
///   继续用 GeoUtils 的直线距离估算兜底
///
/// 任何网络失败、Key 未配置、或 status != '1' 的情况，都会返回 null，
/// 调用方应该 fallback 到 [GeoUtils]/[ConnectorEstimate.compute] 的估算值，
/// 保证离线或 Key 出问题时功能不整体挂掉。
class AMapDirectionService {
  final Dio _dio;
  final String? overrideKey;

  /// [overrideKey]：用户在设置里手工配置的 Web服务 Key，优先于编译时写死的 [AMapKeys.webServiceKey]。
  /// 不传就退回原来的 AMapKeys.webServiceKey（开发调试阶段的行为不变）。
  AMapDirectionService({Dio? dio, this.overrideKey})
      : _dio = dio ?? Dio(BaseOptions(baseUrl: 'https://restapi.amap.com/v3', connectTimeout: const Duration(seconds: 8), receiveTimeout: const Duration(seconds: 8)));

  String get _effectiveKey => (overrideKey != null && overrideKey!.isNotEmpty) ? overrideKey! : AMapKeys.webServiceKey;

  bool get isConfigured => _effectiveKey.isNotEmpty;

  Future<ConnectorEstimate?> route({
    required LatLng from,
    required LatLng to,
    required TransportMode mode,
  }) async {
    if (!isConfigured) {
      AppLogger.warning('AMap Web服务 Key 未配置，路线计算走本地估算兜底');
      return null;
    }

    // transit（公交）Phase 2.5 暂不接，直接走估算兜底
    if (mode == TransportMode.transit) return null;

    final endpoint = mode == TransportMode.walk ? '/direction/walking' : '/direction/driving';

    try {
      final resp = await _dio.get(endpoint, queryParameters: {
        'origin': '${from.longitude},${from.latitude}',
        'destination': '${to.longitude},${to.latitude}',
        'key': _effectiveKey,
        'extensions': 'base',
      });

      final data = resp.data;
      if (data == null || data['status'] != '1') {
        AppLogger.warning('AMap 路线规划返回异常: ${data?['info']}');
        return null;
      }

      final route = data['route'];
      final paths = route?['paths'] as List?;
      if (paths == null || paths.isEmpty) return null;

      final path = paths.first;
      final distanceMeters = double.tryParse('${path['distance']}') ?? 0;
      final durationSeconds = double.tryParse('${path['duration']}') ?? 0;

      return ConnectorEstimate(
        distanceKm: distanceMeters / 1000.0,
        durationMinutes: (durationSeconds / 60).round().clamp(1, 24 * 60),
        mode: mode,
      );
    } catch (e, st) {
      AppLogger.error('AMap 路线规划请求失败，走本地估算兜底', e, st);
      return null;
    }
  }
}
