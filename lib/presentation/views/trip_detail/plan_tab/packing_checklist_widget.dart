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

        // 按分类展示
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
                initiallyExpanded: true,
                title: Text(category, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                trailing: Text('$packed/${items.length}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
                children: items.map((item) {
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
                    onChanged: (checked) => controller.togglePacked(item.id, checked ?? false),
                  );
                }).toList(),
              ),
            ),
          );
        }),
      ],
    );
  }
}
