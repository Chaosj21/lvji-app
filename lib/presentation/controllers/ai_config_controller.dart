import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/ai_config.dart';
import '../../services/ai_service.dart';

const _kMode = 'ai_mode';
const _kFormat = 'ai_format';
const _kBaseUrl = 'ai_base_url';
const _kModel = 'ai_model';
const _kApiKey = 'ai_api_key';

class AIConfigController extends StateNotifier<AIConfig> {
  final SecureStorageService storage;

  AIConfigController(this.storage) : super(const AIConfig()) {
    _load();
  }

  Future<void> _load() async {
    final mode = await storage.read(_kMode);
    final formatStr = await storage.read(_kFormat);
    final baseUrl = await storage.read(_kBaseUrl);
    final model = await storage.read(_kModel);
    final apiKey = await storage.read(_kApiKey);

    final format = formatStr == 'openai' ? AIRequestFormat.openai : AIRequestFormat.anthropic;

    state = AIConfig(
      mode: mode == 'custom' ? AIProviderMode.custom : AIProviderMode.builtIn,
      format: format,
      baseUrl: (baseUrl != null && baseUrl.isNotEmpty) ? baseUrl : AIConfig.defaultBaseUrlFor(format),
      model: (model != null && model.isNotEmpty) ? model : AIConfig.defaultModelFor(format),
      apiKey: apiKey ?? '',
    );
  }

  Future<void> save({
    required AIProviderMode mode,
    required AIRequestFormat format,
    required String baseUrl,
    required String model,
    required String apiKey,
  }) async {
    await storage.write(_kMode, mode == AIProviderMode.custom ? 'custom' : 'builtin');
    await storage.write(_kFormat, format == AIRequestFormat.openai ? 'openai' : 'anthropic');
    await storage.write(_kBaseUrl, baseUrl);
    await storage.write(_kModel, model);
    await storage.write(_kApiKey, apiKey);
    state = AIConfig(mode: mode, format: format, baseUrl: baseUrl, model: model, apiKey: apiKey);
  }

  /// 切换请求格式时，如果用户还没手动改过地址/模型，顺手换成对应格式的默认值，
  /// 省得用户明明选了 OpenAI 格式，接口地址却还是 anthropic.com 导致请求打不通。
  void switchFormat(AIRequestFormat format) {
    state = state.copyWith(
      format: format,
      baseUrl: AIConfig.defaultBaseUrlFor(format),
      model: AIConfig.defaultModelFor(format),
    );
  }

  Future<void> switchToBuiltIn() async {
    await storage.write(_kMode, 'builtin');
    state = state.copyWith(mode: AIProviderMode.builtIn);
  }

  Future<void> clearApiKey() async {
    await storage.delete(_kApiKey);
    state = state.copyWith(apiKey: '');
  }
}

final secureStorageServiceProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService();
});

final aiConfigControllerProvider = StateNotifierProvider<AIConfigController, AIConfig>((ref) {
  return AIConfigController(ref.watch(secureStorageServiceProvider));
});

/// 根据当前配置，返回真正能用的 AIService 实例。
/// custom 模式且信息填全了才会返回真实可用的 [CustomAIService]，否则返回
/// [UnavailableAIService]（调用会抛异常，调用方要 catch 住给出友好提示）。
final aiServiceProvider = Provider<AIService>((ref) {
  final config = ref.watch(aiConfigControllerProvider);
  if (config.isCustomReady) {
    return CustomAIService(
      baseUrl: config.baseUrl,
      apiKey: config.apiKey,
      model: config.model,
      format: config.format,
    );
  }
  return UnavailableAIService();
});
