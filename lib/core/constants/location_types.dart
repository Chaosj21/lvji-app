import 'package:flutter/material.dart';

/// 地点类型定义：图标 + 主题色，Plan Tab 的地点卡片和新增地点对话框共用
enum LocationType {
  attraction('attraction', '景点', Icons.photo_camera_outlined, Color(0xFF34C759)),
  hotel('hotel', '住宿', Icons.bed_outlined, Color(0xFF5E5CE6)),
  airport('airport', '机场', Icons.flight_outlined, Color(0xFF0A84FF)),
  station('station', '车站', Icons.train_outlined, Color(0xFFFF9500)),
  service('service', '服务区/其他', Icons.local_gas_station_outlined, Color(0xFF8E8E93));

  final String value;
  final String label;
  final IconData icon;
  final Color color;

  const LocationType(this.value, this.label, this.icon, this.color);

  static LocationType fromValue(String value) {
    return LocationType.values.firstWhere(
      (t) => t.value == value,
      orElse: () => LocationType.attraction,
    );
  }
}

/// 交通方式定义：图标 + 平均速度（用于粗略估算耗时，Phase 2 阶段未接入真实路线 API）
enum TransportMode {
  drive('drive', '驾车', Icons.directions_car_outlined, 45.0),
  taxi('taxi', '打车', Icons.local_taxi_outlined, 42.0),
  walk('walk', '步行', Icons.directions_walk_outlined, 4.5),
  transit('transit', '公共交通', Icons.directions_bus_outlined, 28.0);

  final String value;
  final String label;
  final IconData icon;
  final double avgSpeedKmh;

  const TransportMode(this.value, this.label, this.icon, this.avgSpeedKmh);

  static TransportMode fromValue(String value) {
    return TransportMode.values.firstWhere(
      (m) => m.value == value,
      orElse: () => TransportMode.drive,
    );
  }
}

/// 默认物品清单分类（与产品设计文档保持一致）
const Map<String, List<String>> defaultPackingCategories = {
  '出行必备': ['身份证', '现金', '充电宝', '电源和线', '药（发烧、腹泻、感冒、创可贴）', '纸巾和湿纸巾', '雨伞雨衣', '加热水壶'],
  '洗漱睡觉用品': ['毛巾浴巾', '剃须刀', '一次性马桶垫', '隔脏睡袋', '润肤油', '拖鞋'],
  '衣物': ['衣服', '袜子', '内裤', '鞋'],
  '饮食': ['便携咖啡'],
  '其他': ['瑞士军刀', '相机', '登山杖', '驱蚊用品', '防晒衣帽', '衣架'],
};
