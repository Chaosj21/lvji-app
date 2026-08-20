import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/amap_direction_service.dart';

final amapDirectionServiceProvider = Provider<AMapDirectionService>((ref) {
  return AMapDirectionService();
});
