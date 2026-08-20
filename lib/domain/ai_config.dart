import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum AIProviderMode { builtIn, custom }

/// 自定义渠道下，请求报文格式跟哪家对齐。
/// - anthropic：x-api-key 请求头 + /v1/messages 端点（Claude 官方格式）
/// - openai：Authorization: Bearer 请求头 + /chat/completions 端点（OpenAI 及绝大多数兼容服务，
///   比如 OpenAI 官方、月之暗面 Kimi、DeepSeek、OpenRouter 等都是这个格式）
enum AIRequestFormat { anthropic, openai }

/// AI 服务配置：用户可以在设置里选择"内置模板"或"自定义 API"两种渠道。
///
/// - builtIn：本地模板拼接，不联网、不需要 Key（Phase 4 的默认行为）
/// - custom：用户自己的 API Key + 接口地址 + 模型名，直接从客户端调用
///   （因为 Key 是用户自己的，泄露风险由用户自己承担，跟 App 内置一个公共 Key 分发给所有人是两回事）
class AIConfig {
  final AIProviderMode mode;
  final AIRequestFormat format;
  final String baseUrl;
  final String model;
  final String apiKey;

  const AIConfig({
    this.mode = AIProviderMode.builtIn,
    this.format = AIRequestFormat.anthropic,
    this.baseUrl = 'https://api.anthropic.com',
    this.model = 'claude-sonnet-4-6',
    this.apiKey = '',
  });

  AIConfig copyWith({
    AIProviderMode? mode,
    AIRequestFormat? format,
    String? baseUrl,
    String? model,
    String? apiKey,
  }) {
    return AIConfig(
      mode: mode ?? this.mode,
      format: format ?? this.format,
      baseUrl: baseUrl ?? this.baseUrl,
      model: model ?? this.model,
      apiKey: apiKey ?? this.apiKey,
    );
  }

  bool get isCustomReady =>
      mode == AIProviderMode.custom && apiKey.trim().isNotEmpty && baseUrl.trim().isNotEmpty && model.trim().isNotEmpty;

  /// 切换请求格式时给个顺手的默认地址，省得用户自己去查
  static String defaultBaseUrlFor(AIRequestFormat format) {
    return format == AIRequestFormat.anthropic ? 'https://api.anthropic.com' : 'https://api.openai.com';
  }

  static String defaultModelFor(AIRequestFormat format) {
    return format == AIRequestFormat.anthropic ? 'claude-sonnet-4-6' : 'gpt-4o';
  }
}

/// 敏感信息（API Key 等）统一走安全存储（Android Keystore / iOS Keychain 加密），
/// 不用 SharedPreferences 明文存，因为这是用户自己付费买的凭证。
class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService({FlutterSecureStorage? storage}) : _storage = storage ?? const FlutterSecureStorage();

  Future<String?> read(String key) => _storage.read(key: key);
  Future<void> write(String key, String value) => _storage.write(key: key, value: value);
  Future<void> delete(String key) => _storage.delete(key: key);
}
