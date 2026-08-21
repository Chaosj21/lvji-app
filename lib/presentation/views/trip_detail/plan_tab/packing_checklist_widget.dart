import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../controllers/packing_controller.dart';

class PackingChecklistWidget extends ConsumerWidget {
  final String tripId;
  final PackingState state;

  const PackingChecklistWidget({required this.tripId, required this.state, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(packingControllerProvider(tripId).notifier);
    final theme = Theme.of(context);

    if (state.isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 总进度条
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: theme.dividerColor.withOpacity(.5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('打包进度', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text('${state.packedCount}/${state.totalCount}',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: state.totalCount == 0 ? 0 : state.packedCount / state.totalCount,
                  minHeight: 6,
                  backgroundColor: theme.colorScheme.surfaceVariant,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // 按分类展示（默认收起，节省版面；点标题展开）
        ...state.byCategory.entries.map((entry) {
          final category = entry.key;
          final items = entry.value;
          final packed = items.where((i) => i.isPacked).length;

          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: theme.dividerColor.withOpacity(.5)),
            ),
            child: Theme(
              data: theme.copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                initiallyExpanded: false,
                title: Text(category, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('$packed/${items.length}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    const SizedBox(width: 4),
                    const Icon(Icons.expand_more, size: 20),
                  ],
                ),
                children: [
                  ...items.map((item) {
                    return CheckboxListTile(
                      dense: true,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: item.isPacked,
                      title: Text(
                        item.itemName,
                        style: TextStyle(
                          fontSize: 13.5,
                          decoration: item.isPacked ? TextDecoration.lineThrough : null,
                          color: item.isPacked ? Colors.grey : null,
                        ),
                      ),
                      secondary: InkWell(
                        onTap: () => _confirmDeleteItem(context, controller, item.id, item.itemName),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Icon(Icons.close, size: 16, color: theme.colorScheme.onSurface.withOpacity(.35)),
                        ),
                      ),
                      onChanged: (checked) => controller.togglePacked(item.id, checked ?? false),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: () => _promptAddItem(context, controller, category),
                        icon: const Icon(Icons.add, size: 16),
                        label: const Text('添加物品', style: TextStyle(fontSize: 12.5)),
                        style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: const Size(0, 32)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),

        // 添加新分类（本质就是给一个新分类名添加第一件物品，分类会自动出现）
        OutlinedButton.icon(
          onPressed: () => _promptAddCategory(context, controller),
          icon: const Icon(Icons.create_new_folder_outlined, size: 16),
          label: const Text('添加分类'),
        ),
      ],
    );
  }

  Future<void> _promptAddItem(BuildContext context, PackingController controller, String category) async {
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
    if (name != null && name.isNotEmpty) {
      await controller.addItem(category, name);
    }
  }

  Future<void> _promptAddCategory(BuildContext context, PackingController controller) async {
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
    if (result != null) {
      await controller.addItem(result.$1, result.$2);
    }
  }

  Future<void> _confirmDeleteItem(
      BuildContext context, PackingController controller, String itemId, String itemName) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除物品'),
        content: Text('确定要从清单里删除"$itemName"吗？'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('取消')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('删除', style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ),
        ],
      ),
    );
    if (ok == true) await controller.deleteItem(itemId);
  }
}
