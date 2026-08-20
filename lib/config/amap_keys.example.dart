/// 高德地图 Key 配置模板
///
/// ⚠️ 这个文件是模板，会被提交到 Git，不包含真实 Key。
///
/// 使用方法：
/// 1. 复制这个文件，改名为 `amap_keys.dart`（去掉 .example）
/// 2. 把下面两个空字符串换成你申请到的真实 Key
/// 3. 确认 `.gitignore` 里有 `lib/config/amap_keys.dart` 这一行（Phase 2.5 的
///    patch 会自动加上，如果是手动配置记得检查一下）
///
/// 两个 Key 的区别：
/// - androidKey：高德开放平台申请时"服务平台"选 Android平台的那个，
///   用于地图显示、定位（amap_flutter_map / amap_flutter_location 用它）
/// - webServiceKey：申请时"服务平台"选 Web服务的那个，
///   用于路线规划、地理编码等 REST API 调用（AMapDirectionService 用它）
class AMapKeys {
  static const String androidKey = '';
  static const String webServiceKey = '';
}
