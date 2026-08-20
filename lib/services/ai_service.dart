import 'package:dio/dio.dart';
import '../domain/ai_config.dart';

/// 通用 AI 对话补全接口。后记生成、行程建议等所有 AI 相关功能都通过这一个接口调用，
/// 不直接依赖具体是"内置模板"还是"用户自定义 API"，方便以后再加新渠道（比如真上线了官方后端代理）。
abstract class AIService {
  Future<String> complete({required String prompt, int maxTokens = 1024});
}

class AIServiceUnavailableException implements Exception {
  final String message;
  AIServiceUnavailableException(this.message);
  @override
  String toString() => message;
}

/// 没有配置任何可用 AI 渠道时的占位实现，调用会抛出明确的异常提示去设置里配置。
class UnavailableAIService implements AIService {
  @override
  Future<String> complete({required String prompt, int maxTokens = 1024}) async {
    throw AIServiceUnavailableException('还没有配置 AI 服务，去"设置 → AI 服务"里配置你自己的 API Key 后再试');
  }
}

/// 用户自定义渠道：直接从客户端调用用户自己配置的 API Key + 接口地址。
/// 根据 [format] 选择按 Anthropic 还是 OpenAI 兼容格式发请求——
/// 两家的鉴权方式（请求头）和请求/响应体结构不一样，不能用同一套逻辑硬套。
class CustomAIService implements AIService {
  final String baseUrl;
  final String apiKey;
  final String model;
  final AIRequestFormat format;
  final Dio _dio;

  CustomAIService({
    required this.baseUrl,
    required this.apiKey,
    required this.model,
    this.format = AIRequestFormat.anthropic,
    Dio? dio,
  }) : _dio = dio ?? Dio(BaseOptions(connectTimeout: const Duration(seconds: 20), receiveTimeout: const Duration(seconds: 30)));

  @override
  Future<String> complete({required String prompt, int maxTokens = 1024}) {
    return format == AIRequestFormat.anthropic
        ? _completeAnthropic(prompt: prompt, maxTokens: maxTokens)
        : _completeOpenAi(prompt: prompt, maxTokens: maxTokens);
  }

  Future<String> _completeAnthropic({required String prompt, required int maxTokens}) async {
    final url = '${_trimTrailingSlash(baseUrl)}/v1/messages';

    final resp = await _dio.post(
      url,
      options: Options(headers: {
        'x-api-key': apiKey,
        'anthropic-version': '2023-06-01',
        'content-type': 'application/json',
      }),
      data: {
        'model': model,
        'max_tokens': maxTokens,
        'messages': [
          {'role': 'user', 'content': prompt}
        ],
      },
    );

    final data = resp.data;
    final content = data is Map ? data['content'] : null;
    if (content is List && content.isNotEmpty) {
      final first = content.first;
      if (first is Map && first['text'] is String) {
        return first['text'] as String;
      }
    }
    throw Exception('AI 服务返回格式异常，请检查接口地址/模型名是否填对');
  }

  Future<String> _completeOpenAi({required String prompt, required int maxTokens}) async {
    final url = '${_trimTrailingSlash(baseUrl)}/v1/chat/completions';

    final resp = await _dio.post(
      url,
      options: Options(headers: {
        'Authorization': 'Bearer $apiKey',
        'content-type': 'application/json',
      }),
      data: {
        'model': model,
        'max_tokens': maxTokens,
        'messages': [
          {'role': 'user', 'content': prompt}
        ],
      },
    );

    final data = resp.data;
    final choices = data is Map ? data['choices'] : null;
    if (choices is List && choices.isNotEmpty) {
      final message = choices.first is Map ? choices.first['message'] : null;
      if (message is Map && message['content'] is String) {
        return message['content'] as String;
      }
    }
    throw Exception('AI 服务返回格式异常，请检查接口地址/模型名是否填对');
  }

  String _trimTrailingSlash(String url) => url.replaceAll(RegExp(r'/+$'), '');
}
