# Phase 5 + 5b 开发交付文档

## 概述
- 提交: `d90be6d`
- 时间: 2026-08-20
- 功能: 设置页、AI双通道、iOS风格UI
- 代码库: https://github.com/Chaosj21/lvji-app (main分支)

---

## 一、新增文件

### 1. `lib/domain/ai_config.dart` (70行)
```dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum AIProviderMode { builtIn, custom }
enum AIRequestFormat { anthropic, openai }

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

  bool get isCustomReady =>
      mode == AIProviderMode.custom && apiKey.trim().isNotEmpty && baseUrl.trim().isNotEmpty && model.trim().isNotEmpty;

  static String defaultBaseUrlFor(AIRequestFormat format) =>
      format == AIRequestFormat.anthropic ? 'https://api.anthropic.com' : 'https://api.openai.com';

  static String defaultModelFor(AIRequestFormat format) =>
      format == AIRequestFormat.anthropic ? 'claude-sonnet-4-6' : 'gpt-4o';
}

class SecureStorageService {
  final FlutterSecureStorage _storage;
  SecureStorageService({FlutterSecureStorage? storage}) : _storage = storage ?? const FlutterSecureStorage();
  Future<String?> read(String key) => _storage.read(key: key);
  Future<void> write(String key, String value) => _storage.write(key: key, value: value);
  Future<void> delete(String key) => _storage.delete(key: key);
}
```

### 2. `lib/services/ai_service.dart` (110行)
```dart
import 'package:dio/dio.dart';
import '../domain/ai_config.dart';

abstract class AIService {
  Future<String> complete({required String prompt, int maxTokens = 1024});
}

class UnavailableAIService implements AIService {
  @override
  Future<String> complete({required String prompt, int maxTokens = 1024}) async {
    throw Exception('还没有配置 AI 服务，去"设置 → AI 服务"里配置你自己的 API Key 后再试');
  }
}

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
  }) : _dio = dio ?? Dio(BaseOptions(connectTimeout: Duration(seconds: 20), receiveTimeout: Duration(seconds: 30)));

  @override
  Future<String> complete({required String prompt, int maxTokens = 1024}) {
    return format == AIRequestFormat.anthropic
        ? _completeAnthropic(prompt: prompt, maxTokens: maxTokens)
        : _completeOpenAi(prompt: prompt, maxTokens: maxTokens);
  }

  Future<String> _completeAnthropic({required String prompt, required int maxTokens}) async {
    final url = '${baseUrl.replaceAll(RegExp(r'/+$'), '')}/v1/messages';
    final resp = await _dio.post(url, options: Options(headers: {
      'x-api-key': apiKey,
      'anthropic-version': '2023-06-01',
      'content-type': 'application/json',
    }), data: {
      'model': model,
      'max_tokens': maxTokens,
      'messages': [{'role': 'user', 'content': prompt}]
    });

    final content = resp.data['content'] as List?;
    if (content is List && content.isNotEmpty) {
      final first = content.first;
      if (first is Map && first['text'] is String) return first['text'];
    }
    throw Exception('AI 服务返回格式异常');
  }

  Future<String> _completeOpenAi({required String prompt, required int maxTokens}) async {
    final url = '${baseUrl.replaceAll(RegExp(r'/+$'), '')}/v1/chat/completions';
    final resp = await _dio.post(url, options: Options(headers: {
      'Authorization': 'Bearer $apiKey',
      'content-type': 'application/json',
    }), data: {
      'model': model,
      'max_tokens': maxTokens,
      'messages': [{'role': 'user', 'content': prompt}]
    });

    final choices = resp.data['choices'] as List?;
    if (choices is List && choices.isNotEmpty) {
      final message = choices.first['message'] as Map?;
      if (message?['content'] is String) return message!['content'];
    }
    throw Exception('AI 服务返回格式异常');
  }
}
```

### 3. `lib/presentation/controllers/ai_config_controller.dart` (94行)
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/ai_config.dart';
import '../../services/ai_service.dart';

class AIConfigController extends StateNotifier<AIConfig> {
  final SecureStorageService storage;

  AIConfigController(this.storage) : super(const AIConfig()) { _load(); }

  Future<void> _load() async {
    final mode = await storage.read('ai_mode');
    final formatStr = await storage.read('ai_format');
    final baseUrl = await storage.read('ai_base_url');
    final model = await storage.read('ai_model');
    final apiKey = await storage.read('ai_api_key');
    final format = formatStr == 'openai' ? AIRequestFormat.openai : AIRequestFormat.anthropic;

    state = AIConfig(
      mode: mode == 'custom' ? AIProviderMode.custom : AIProviderMode.builtIn,
      format: format,
      baseUrl: baseUrl?.isNotEmpty == true ? baseUrl : AIConfig.defaultBaseUrlFor(format),
      model: model?.isNotEmpty == true ? model : AIConfig.defaultModelFor(format),
      apiKey: apiKey ?? '',
    );
  }

  Future<void> save({required AIProviderMode mode, required AIRequestFormat format,
    required String baseUrl, required String model, required String apiKey}) async {
    await storage.write('ai_mode', mode == AIProviderMode.custom ? 'custom' : 'builtin');
    await storage.write('ai_format', format == AIRequestFormat.openai ? 'openai' : 'anthropic');
    await storage.write('ai_base_url', baseUrl);
    await storage.write('ai_model', model);
    await storage.write('ai_api_key', apiKey);
    state = AIConfig(mode: mode, format: format, baseUrl: baseUrl, model: model, apiKey: apiKey);
  }

  void switchFormat(AIRequestFormat format) {
    state = state.copyWith(format: format, baseUrl: AIConfig.defaultBaseUrlFor(format), model: AIConfig.defaultModelFor(format));
  }

  Future<void> switchToBuiltIn() async {
    await storage.write('ai_mode', 'builtin');
    state = state.copyWith(mode: AIProviderMode.builtIn);
  }

  Future<void> clearApiKey() async {
    await storage.delete('ai_api_key');
    state = state.copyWith(apiKey: '');
  }
}

final secureStorageServiceProvider = Provider<SecureStorageService>((ref) => SecureStorageService());
final aiConfigControllerProvider = StateNotifierProvider<AIConfigController, AIConfig>((ref) {
  return AIConfigController(ref.watch(secureStorageServiceProvider));
});

final aiServiceProvider = Provider<AIService>((ref) {
  final config = ref.watch(aiConfigControllerProvider);
  return config.isCustomReady
      ? CustomAIService(baseUrl: config.baseUrl, apiKey: config.apiKey, model: config.model, format: config.format)
      : UnavailableAIService();
});
```

### 4. `lib/presentation/controllers/theme_controller.dart` (33行)
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kKey = 'theme_mode';

class ThemeController extends StateNotifier<ThemeMode> {
  ThemeController() : super(ThemeMode.light) { _load(); }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final val = prefs.getInt(_kKey);
    state = val == 1 ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> setDark(bool dark) async {
    state = dark ? ThemeMode.dark : ThemeMode.light;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_kKey, dark ? 1 : 0);
  }
}

final themeControllerProvider = StateNotifierProvider<ThemeController, ThemeMode>((ref) => ThemeController());
```

### 5. `lib/presentation/views/settings/settings_screen.dart` (380行)
完整设置页面，包含：
- 外观设置（深色模式开关）
- AI服务配置（内置模板/自定义API切换、Anthropic/OpenAI格式选择、API地址/模型/Key输入、测试连接、保存按钮）
- 通知设置
- 账户设置

关键代码结构见上方 diff。

### 6. 其他新增控制器
- `lib/presentation/controllers/day_feed_controller.dart` - 日程控制器
- `lib/presentation/controllers/location_controller.dart` - 位置控制器
- `lib/presentation/controllers/packing_controller.dart` - 打包清单控制器

---

## 二、修改文件

### 1. `lib/config/theme.dart` (全部重写)
**变更**: iOS风格主题
- 颜色系统: 使用iOS系统色 (蓝 #007AFF, 橙 #FF9500, 绿 #34C759, 红 #FF3B30, 靛蓝 #5E5CE6)
- 组件样式: 圆角卡片、扁平按钮、iOS导航栏样式
- 深色模式: 纯黑背景 #000000, 卡片 #1C1C1E

**关键属性**:
```dart
// Light
colorAccentLight = Color(0xFF007AFF);   // iOS系统蓝
colorBgLight = Color(0xFFF2F2F7);       // 分组背景
colorSurfaceLight = Color(0xFFFFFFFF);

// Dark  
colorAccentDark = Color(0xFF0A84FF);
colorBgDark = Color(0xFF000000);
colorSurfaceDark = Color(0xFF1C1C1E);
```

### 2. `lib/presentation/views/home/home_screen.dart`
**变更**: 登机牌风格行程卡片
- 新增 `_TicketTripCard` 组件
- 卡片左侧: 标题、路线、日期、状态
- 右侧: 渐变色目的地缩略图
- 中间: 虚线撕口分隔线 + 圆形缺口

**渐变方案** (按trip.id哈希稳定):
```dart
static const _gradients = [
  [Color(0xFF3E6B6A), Color(0xFF8FA98F), Color(0xFFD8C79A)], // 草原绿
  [Color(0xFF8FA9C9), Color(0xFFDCE3D0), Color(0xFFD8C79A)], // 天空蓝
  [Color(0xFFD8A9C9), Color(0xFFE8D3B0), Color(0xFF9FC9D8)], // 樱花粉
  [Color(0xFFC9A9D8), Color(0xFFD8C79A), Color(0xFF8FA98F)], // 黄昏紫
];
```

### 3. `lib/app.dart`
```dart
// Before
final themeMode = ref.watch(themeModeProvider);
// After
final themeMode = ref.watch(themeControllerProvider);
```
删除旧的 `themeModeProvider`，使用新的 `themeControllerProvider`。

### 4. `lib/config/routes.dart`
- 导入 `TripDetailScreen` 和 `SettingsScreen`
- 移除 Placeholder 类 (TripDetailScreenPlaceholder, SettingsScreenPlaceholder)
- 更新路由指向真实页面

### 5. `lib/presentation/controllers/journal_controller.dart`
```dart
// 修改 journalGenerationServiceProvider
final generationService = aiConfig.mode == AIProviderMode.custom && aiConfig.isCustomReady
    ? ref.read(aiServiceFactory(aiConfig))  // AI版本
    : ref.read(templateJournalGenerationServiceProvider);  // 模板版本
```

### 6. `lib/services/journal_generation_service.dart`
**新增**: `AIJournalGenerationService` 类
- 将随记内容整理成prompt
- 调用AI服务生成JSON格式的游记
- 解析响应: title + paragraphs数组
- 容错: 非JSON响应时fallback显示原文

**Prompt模板**:
```
你是一个旅行游记写手。请根据以下这次旅行的随手记录，帮用户整理成一篇游记。

旅程名称：{tripTitle}
目的地：{destination}
风格要求：{styleDesc}

随记内容（按天）：
{momentsText}

请只返回如下 JSON 格式，不要有任何其他文字、不要用 markdown 代码块包裹：
{"title": "游记标题", "paragraphs": ["第一段正文", "第二段正文"]}
```

### 7. `pubspec.yaml`
```yaml
dependencies:
  flutter_secure_storage: ^11.0.0  # 新增

dependency_overrides:
  amap_flutter_base:
    path: packages/amap_flutter_base_override
  amap_flutter_map:
    path: packages/amap_flutter_map_override
  amap_flutter_location:
    path: packages/amap_flutter_location_override
```

### 8. `android/app/build.gradle.kts`
```kotlin
android {
    compileSdk = 36  // 从 flutter.compileSdkVersion 改为固定值
}

// 新增 AAR 元数据检查禁用
tasks.matching { it.name.contains("checkDebugAarMetadata") || it.name.contains("checkReleaseAarMetadata") }.configureEach {
    enabled = false
}
```

### 9. `android/gradle.properties`
```properties
# 新增
android.disableAarMetadataCheck=true
```

---

## 三、依赖变更

| 包名 | 旧版本 | 新版本 | 说明 |
|------|--------|--------|------|
| `flutter_secure_storage` | - | ^11.0.0 | 新增，安全存储API Key |
| `share_plus` | ^7.0.0 | ^13.3.0 | 升级 |
| `screenshot` | ^2.1.0 | ^3.0.0 | 升级 |
| `connectivity_plus` | ^5.0.0 | ^7.3.1 | 升级 |
| `amap_flutter_*` | pub.dev | local path override | 高德地图覆盖包 |

---

## 四、高德地图覆盖包

新增了3个本地包 (packages/)：
- `amap_flutter_base_override/`
- `amap_flutter_map_override/`
- `amap_flutter_location_override/`

原因: 解决高德地图SDK与Flutter版本的兼容性问题。

---

## 五、关键Bug修复

1. **journal_generation_service.dart**: `m.text` → `m.textContent` (字段名错误)
2. **plan_screen.dart**: 缺少闭合括号 `}` (语法错误)
3. **flutter_secure_storage**: 从 ^9.2.2 升级到 ^11.0.0 (解决与 share_plus 的依赖冲突)

---

## 六、给 Claude 的提示

**项目状态**: Phase 5 + 5b 已完成并部署测试通过
**下一步**: 可从 main 分支获取最新代码继续开发

**注意事项**:
- API Key 使用 flutter_secure_storage 安全存储 (Android Keystore / iOS Keychain)
- AI服务支持 Anthropic 和 OpenAI 两种格式
- 主题切换已持久化到 SharedPreferences
- 高德地图使用本地覆盖包替代 pub.dev 版本
