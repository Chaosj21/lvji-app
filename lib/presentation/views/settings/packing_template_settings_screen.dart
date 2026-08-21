import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controllers/packing_template_controller.dart';

/// 设置里的"默认物品清单模板"编辑页。改的是模板，不是某次具体旅程的清单——
/// 只影响以后新建的旅程首次打开物品清单时会填充成什么，已经生成过清单的旅程不受影响。
class PackingTemplateSettingsScreen extends ConsumerWidget {
  const PackingTemplateSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final template = ref.watch(packingTemplateControllerProvider);
    final controller = ref.read(packingTemplateControllerProvider.notifier);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('默认物品清单模板'),
        actions: [
          TextButton(
            onPressed: () => _confirmReset(context, controller),
            child: const Text('恢复默认'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            '这里改的是"模板"，会用在以后新建的旅程上；已经生成过清单的旅程不会被这里的改动影响。',
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 16),

          ...template.entries.map((entry) {
            final category = entry.key;
            final items = entry.value;
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: theme.dividerColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 12, 8, 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(category, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_outline, size: 18),
                          color: theme.colorScheme.error.withOpacity(.7),
                          onPressed: () => _confirmDeleteCategory(context, controller, category),
                          visualDensity: VisualDensity.compact,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 10),
                    child: Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        ...items.map((item) => Chip(
                              label: Text(item, style: const TextStyle(fontSize: 12)),
                              deleteIcon: const Icon(Icons.close, size: 14),
                              onDeleted: () => controller.removeItem(category, item),
                              visualDensity: VisualDensity.compact,
                            )),
                        ActionChip(
                          label: const Text('+ 添加', style: TextStyle(fontSize: 12)),
                          onPressed: () => _promptAddItem(context, controller, category),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),

          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () => _promptAddCategory(context, controller),
            icon: const Icon(Icons.create_new_folder_outlined, size: 16),
            label: const Text('添加新分类'),
          ),
        ],
      ),
    );
  }

  Future<void> _promptAddItem(BuildContext context, PackingTemplateController controller, String category) async {
    final textController = TextEditingController();
    final name = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('添加到"$category"'),
        content: TextField(controller: textController, autofocus: true, decoration: const InputDecoration(hintText: '物品名称')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('取消')),
          TextButton(onPressed: () => Navigator.pop(context, textController.text.trim()), child: const Text('添加')),
        ],
      ),
    );
    if (name != null && name.isNotEmpty) await controller.addItem(category, name);
  }

  Future<void> _promptAddCategory(BuildContext context, PackingTemplateController controller) async {
    final categoryController = TextEditingController();
    final itemController = TextEditingController();
    final result = await showDialog<(String, String)>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('添加新分类'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: categoryController, autofocus: true, decoration: const InputDecoration(labelText: '分类名称')),
            const SizedBox(height: 12),
            TextField(controller: itemController, decoration: const InputDecoration(labelText: '第一件物品')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('取消')),
          TextButton(
            onPressed: () {
              final c = categoryController.text.trim();
              final i = itemController.text.trim();
              if (c.isEmpty || i.isEmpty) return;
              Navigator.pop(context, (c, i));
            },
            child: const Text('添加'),
          ),
        ],
      ),
    );
    if (result != null) await controller.addItem(result.$1, result.$2);
  }

  Future<void> _confirmDeleteCategory(BuildContext context, PackingTemplateController controller, String category) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除分类'),
        content: Text('确定要删除整个"$category"分类吗？'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('取消')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('删除', style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ),
        ],
      ),
    );
    if (ok == true) await controller.removeCategory(category);
  }

  Future<void> _confirmReset(BuildContext context, PackingTemplateController controller) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('恢复默认模板'),
        content: const Text('会丢弃你对模板做的所有修改，恢复成最初的默认清单。'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('取消')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('恢复')),
        ],
      ),
    );
    if (ok == true) await controller.resetToDefault();
  }
}
