import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controllers/theme_controller.dart';
import 'packing_template_settings_screen.dart';
import '../../controllers/ai_config_controller.dart';
import '../../../domain/ai_config.dart';
import '../../../services/ai_service.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  late TextEditingController _apiKeyController;
  late TextEditingController _baseUrlController;
  late TextEditingController _modelController;
  bool _obscureKey = true;
  bool _testing = false;
  bool _controllersInited = false;

  @override
  void dispose() {
    if (_controllersInited) {
      _apiKeyController.dispose();
      _baseUrlController.dispose();
      _modelController.dispose();
    }
    super.dispose();
  }

  void _initControllersIfNeeded(AIConfig config) {
    if (_controllersInited) return;
    _apiKeyController = TextEditingController(text: config.apiKey);
    _baseUrlController = TextEditingController(text: config.baseUrl);
    _modelController = TextEditingController(text: config.model);
    _controllersInited = true;
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeControllerProvider);
    final aiConfig = ref.watch(aiConfigControllerProvider);
    final aiConfigController = ref.read(aiConfigControllerProvider.notifier);
    _initControllersIfNeeded(aiConfig);

    return Scaffold(
      appBar: AppBar(title: const Text('设置')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionLabel('外观'),
          _group([
            _switchRow(
              icon: Icons.dark_mode_outlined,
              iconColor: Theme.of(context).colorScheme.onSurface,
              title: '深色模式',
              value: themeMode == ThemeMode.dark,
              onChanged: (v) => ref.read(themeControllerProvider.notifier).setDark(v),
            ),
          ]),

          const SizedBox(height: 24),
          _sectionLabel('AI 服务'),
          _buildAiSection(context, aiConfig, aiConfigController),

          const SizedBox(height: 24),
          _sectionLabel('通知'),
          _group([
            _switchRow(icon: Icons.notifications_outlined, iconColor: const Color(0xFF0A84FF), title: '行程提醒', value: true, onChanged: (_) {}),
            _switchRow(icon: Icons.account_balance_wallet_outlined, iconColor: const Color(0xFFFF9500), title: '消费提醒', value: true, onChanged: (_) {}),
            _switchRow(icon: Icons.menu_book_outlined, iconColor: const Color(0xFF5E5CE6), title: '后记生成推送', value: false, onChanged: (_) {}),
          ]),

          const SizedBox(height: 24),
          _sectionLabel('旅行偏好'),
          _group([
            _navRow(
              icon: Icons.checklist_outlined,
              iconColor: const Color(0xFF0A84FF),
              title: '默认物品清单模板',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PackingTemplateSettingsScreen()),
              ),
            ),
          ]),

          const SizedBox(height: 24),
          _sectionLabel('账户'),
          _group([
            _navRow(icon: Icons.person_outline, iconColor: const Color(0xFF34C759), title: '账号与安全', onTap: () => _todo(context)),
            _navRow(icon: Icons.group_outlined, iconColor: const Color(0xFF34C759), title: '同行人管理', onTap: () => _todo(context)),
            _navRow(icon: Icons.cloud_outlined, iconColor: const Color(0xFF8E8E93), title: '数据与备份', onTap: () => _todo(context)),
          ]),

          const SizedBox(height: 24),
          _group([
            _navRow(title: '关于旅记', onTap: () => _showAbout(context)),
          ]),
        ],
      ),
    );
  }

  Widget _buildAiSection(BuildContext context, AIConfig config, AIConfigController controller) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.dividerColor.withOpacity(.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '后记生成、行程建议这些 AI 功能，可以选用下面两种渠道之一。',
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 12),

          _modeOption(
            selected: config.mode == AIProviderMode.builtIn,
            title: '内置模板',
            subtitle: '本地拼接生成，不联网、不需要 Key，效果比较朴素',
            onTap: () => controller.switchToBuiltIn(),
          ),
          const SizedBox(height: 8),
          _modeOption(
            selected: config.mode == AIProviderMode.custom,
            title: '自定义 API',
            subtitle: '填入你自己的 API Key，直接调用真实 AI 模型',
            onTap: () {
              controller.save(
                mode: AIProviderMode.custom,
                format: config.format,
                baseUrl: _baseUrlController.text.trim(),
                model: _modelController.text.trim(),
                apiKey: _apiKeyController.text.trim(),
              );
            },
          ),

          if (config.mode == AIProviderMode.custom) ...[
            const Divider(height: 28),

            Text('接口格式', style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            SegmentedButton<AIRequestFormat>(
              segments: const [
                ButtonSegment(value: AIRequestFormat.anthropic, label: Text('Anthropic', style: TextStyle(fontSize: 12))),
                ButtonSegment(value: AIRequestFormat.openai, label: Text('OpenAI 兼容', style: TextStyle(fontSize: 12))),
              ],
              selected: {config.format},
              onSelectionChanged: (selection) {
                final format = selection.first;
                controller.switchFormat(format);
                setState(() {
                  _baseUrlController.text = AIConfig.defaultBaseUrlFor(format);
                  _modelController.text = AIConfig.defaultModelFor(format);
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                config.format == AIRequestFormat.anthropic
                    ? 'Claude 官方接口格式'
                    : 'OpenAI 官方及大多数兼容服务（如 DeepSeek、Kimi、OpenRouter 等）都用这个格式',
                style: theme.textTheme.bodySmall?.copyWith(fontSize: 10.5),
              ),
            ),

            const SizedBox(height: 14),
            TextField(
              controller: _baseUrlController,
              decoration: InputDecoration(
                labelText: 'API 地址',
                hintText: AIConfig.defaultBaseUrlFor(config.format),
              ),
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _modelController,
              decoration: InputDecoration(
                labelText: '模型名称',
                hintText: AIConfig.defaultModelFor(config.format),
              ),
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _apiKeyController,
              obscureText: _obscureKey,
              decoration: InputDecoration(
                labelText: 'API Key',
                hintText: config.format == AIRequestFormat.anthropic ? 'sk-ant-...' : 'sk-...',
                suffixIcon: IconButton(
                  icon: Icon(_obscureKey ? Icons.visibility_outlined : Icons.visibility_off_outlined, size: 18),
                  onPressed: () => setState(() => _obscureKey = !_obscureKey),
                ),
              ),
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 4),
            Text(
              'Key 会加密存在手机本地（Android Keystore），不会上传到我们的服务器，也不会打包进 App 分发。',
              style: theme.textTheme.bodySmall?.copyWith(fontSize: 10.5),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _testing ? null : () => _testConnection(context, config.format),
                    child: _testing
                        ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                        : const Text('测试连接'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      await controller.save(
                        mode: AIProviderMode.custom,
                        format: config.format,
                        baseUrl: _baseUrlController.text.trim(),
                        model: _modelController.text.trim(),
                        apiKey: _apiKeyController.text.trim(),
                      );
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('已保存')));
                      }
                    },
                    child: const Text('保存'),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _testConnection(BuildContext context, AIRequestFormat format) async {
    setState(() => _testing = true);
    try {
      final service = CustomAIService(
        baseUrl: _baseUrlController.text.trim(),
        apiKey: _apiKeyController.text.trim(),
        model: _modelController.text.trim(),
        format: format,
      );
      final result = await service.complete(prompt: '请只回复两个字："收到"', maxTokens: 20);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('连接成功，模型回复：$result')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('连接失败：$e'), backgroundColor: Theme.of(context).colorScheme.error),
      );
    } finally {
      if (mounted) setState(() => _testing = false);
    }
  }

  Widget _modeOption({required bool selected, required String title, required String subtitle, required VoidCallback onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: selected ? Theme.of(context).colorScheme.primary.withOpacity(.08) : null,
          border: Border.all(color: selected ? Theme.of(context).colorScheme.primary : Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(selected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                size: 20, color: selected ? Theme.of(context).colorScheme.primary : Colors.grey),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 2),
                  Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 6),
      child: Text(text, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.grey, letterSpacing: .3)),
    );
  }

  Widget _group(List<Widget> children) {
    return Builder(builder: (context) {
      final theme = Theme.of(context);
      return Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: theme.dividerColor.withOpacity(.5)),
        ),
        child: Column(
          children: [
            for (var i = 0; i < children.length; i++) ...[
              if (i > 0) Divider(height: 1, indent: 50, color: theme.dividerColor.withOpacity(.5)),
              children[i],
            ],
          ],
        ),
      );
    });
  }

  Widget _switchRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: [
          Container(
            width: 27, height: 27,
            decoration: BoxDecoration(color: iconColor, borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, size: 15, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 14))),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }

  Widget _navRow({IconData? icon, Color? iconColor, required String title, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
        child: Row(
          children: [
            if (icon != null) ...[
              Container(
                width: 27, height: 27,
                decoration: BoxDecoration(color: iconColor, borderRadius: BorderRadius.circular(8)),
                child: Icon(icon, size: 15, color: Colors.white),
              ),
              const SizedBox(width: 12),
            ],
            Expanded(child: Text(title, style: const TextStyle(fontSize: 14))),
            const Icon(Icons.chevron_right, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  void _todo(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('功能开发中')));
  }

  void _showAbout(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: '旅记',
      applicationVersion: 'v1.0.0',
      applicationLegalese: '计划 · 随记 · 后记 — 一条时间轴走完全程',
    );
  }
}
