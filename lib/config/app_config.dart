class AppConfig {
  // TODO: 生产环境应从环境变量或安全存储加载，不要硬编码密钥
  static const String apiBaseUrl = 'https://api.lvji-app.com';
  static const String claudeApiKey = String.fromEnvironment('CLAUDE_API_KEY', defaultValue: '');
  static const String aMapApiKey = String.fromEnvironment('AMAP_API_KEY', defaultValue: '');

  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration apiReceiveTimeout = Duration(seconds: 30);

  static const bool isDebug = bool.fromEnvironment('dart.vm.product') == false;

  static const int maxRetryCount = 3;
  static const Duration syncRetryDelay = Duration(seconds: 5);
}
