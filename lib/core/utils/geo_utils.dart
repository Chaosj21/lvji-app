import 'dart:math';
import '../constants/location_types.dart';

/// Phase 2 阶段的距离/耗时估算工具。
///
/// 说明：真实的驾车/公交路线距离需要调用高德地图方向 API（见架构文档"地图与定位模块设计"），
/// 但那需要 API Key 和网络请求。在拿到 Key 之前，先用两点间的直线距离（Haversine 公式）
/// 乘以一个"绕路系数"来粗略估算，保证路线连接器功能在没有网络/Key 的情况下也能跑起来。
/// 等接入高德 API 后，只需替换 [GeoUtils.estimateDistanceKm] 的调用方，逻辑不受影响。
class GeoUtils {
  GeoUtils._();

  static const double _earthRadiusKm = 6371.0;

  /// 两点间直线距离（km）
  static double haversineKm(double lat1, double lng1, double lat2, double lng2) {
    final dLat = _degToRad(lat2 - lat1);
    final dLng = _degToRad(lng2 - lng1);
    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degToRad(lat1)) * cos(_degToRad(lat2)) * sin(dLng / 2) * sin(dLng / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return _earthRadiusKm * c;
  }

  static double _degToRad(double deg) => deg * pi / 180.0;

  /// 估算实际路网距离：直线距离 × 绕路系数（驾车/公交场景道路不是直线，粗略加成 30%）
  static double estimateRoadDistanceKm(double lat1, double lng1, double lat2, double lng2) {
    final straight = haversineKm(lat1, lng1, lat2, lng2);
    const detourFactor = 1.3;
    return straight * detourFactor;
  }

  /// 根据距离和交通方式估算耗时（分钟）
  static int estimateDurationMinutes(double distanceKm, TransportMode mode) {
    final hours = distanceKm / mode.avgSpeedKmh;
    return (hours * 60).round().clamp(1, 24 * 60);
  }

  /// 格式化耗时为"1小时20分"这种可读文案
  static String formatDuration(int minutes) {
    if (minutes < 60) return '$minutes分钟';
    final h = minutes ~/ 60;
    final m = minutes % 60;
    return m == 0 ? '$h小时' : '$h小时$m分';
  }
}

class ConnectorEstimate {
  final double distanceKm;
  final int durationMinutes;
  final TransportMode mode;

  const ConnectorEstimate({
    required this.distanceKm,
    required this.durationMinutes,
    required this.mode,
  });

  String get distanceLabel => '${distanceKm.toStringAsFixed(1)}km';
  String get durationLabel => GeoUtils.formatDuration(durationMinutes);

  static ConnectorEstimate compute({
    required double fromLat,
    required double fromLng,
    required double toLat,
    required double toLng,
    required TransportMode mode,
  }) {
    final distance = GeoUtils.estimateRoadDistanceKm(fromLat, fromLng, toLat, toLng);
    final duration = GeoUtils.estimateDurationMinutes(distance, mode);
    return ConnectorEstimate(distanceKm: distance, durationMinutes: duration, mode: mode);
  }
}
