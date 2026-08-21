import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/amap_direction_service.dart';
import 'controllers/amap_config_controller.dart';

final amapDirectionServiceProvider = Provider<AMapDirectionService>((ref) {
  final configuredKey = ref.watch(amapConfigControllerProvider);
  return AMapDirectionService(overrideKey: configuredKey.isEmpty ? null : configuredKey);
});
