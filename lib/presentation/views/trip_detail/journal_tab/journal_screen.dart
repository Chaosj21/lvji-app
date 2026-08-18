import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import '../../../controllers/journal_controller.dart';
import '../../../../core/constants/journal_styles.dart';
import '../../../../core/constants/expense_categories.dart';
import '../../../../data/datasources/local/app_database.dart';

class JournalScreen extends ConsumerStatefulWidget {
  final String tripId;
  final Trip trip;

  const JournalScreen({required this.tripId, required this.trip, Key? key}) : super(key: key);

  @override
  ConsumerState<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends ConsumerState<JournalScreen> {
  late TextEditingController _titleController;
  late List<TextEditingController> _paragraphControllers;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _paragraphControllers = [];
  }

  void _syncControllers(JournalState state) {
    if (_titleController.text != state.title && !state.isEditing) {
      _titleController.text = state.title;
    }
    if (_paragraphControllers.length != state.paragraphs.length) {
      for (final c in _paragraphControllers) {
        c.dispose();
      }
      _paragraphControllers = state.paragraphs.map((p) => TextEditingController(text: p)).toList();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    for (final c in _paragraphControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(journalControllerProvider(widget.tripId));
    final controller = ref.read(journalControllerProvider(widget.tripId).notifier);
    final theme = Theme.of(context);

    _syncControllers(state);

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
      children: [
        // 生成 / 编辑 工具条
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: state.isGenerating ? null : () => controller.generate(),
                icon: state.isGenerating
                    ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                    : const Icon(Icons.auto_awesome, size: 17),
                label: Text(state.hasContent ? '重新生成后记' : '生成后记'),
              ),
            ),
            const SizedBox(width: 8),
            if (state.hasContent)
              IconButton.filledTonal(
                onPressed: () {
                  if (state.isEditing) {
                    controller.saveEdits(
                      title: _titleController.text,
                      paragraphs: _paragraphControllers.map((c) => c.text).toList(),
                    );
                  } else {
                    controller.toggleEditing();
                  }
                },
                icon: Icon(state.isEditing ? Icons.check : Icons.edit_outlined, size: 18),
              ),
          ],
        ),
        const SizedBox(height: 14),

        // 风格切换
        Wrap(
          spacing: 8,
          children: JournalStyle.values.map((s) {
            final selected = s == state.style;
            return ChoiceChip(
              label: Text(s.label, style: const TextStyle(fontSize: 12)),
              selected: selected,
              onSelected: state.isGenerating ? null : (_) => controller.setStyle(s),
            );
          }).toList(),
        ),
        const SizedBox(height: 14),

        // 后记正文
        if (!state.hasContent)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceVariant.withOpacity(.3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text('点上方"生成后记"，根据这次旅程的随记内容自动整理成一篇游记',
                style: theme.textTheme.bodyMedium, textAlign: TextAlign.center),
          )
        else
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: theme.dividerColor.withOpacity(.5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                state.isEditing
                    ? TextField(
                        controller: _titleController,
                        style: theme.textTheme.headlineSmall,
                        decoration: const InputDecoration(border: InputBorder.none, isDense: true),
                        maxLines: null,
                      )
                    : Text(state.title, style: theme.textTheme.headlineSmall),
                const SizedBox(height: 6),
                Text(
                  '${widget.trip.title} · 由旅行随记自动生成',
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: 14),
                for (var i = 0; i < _paragraphControllers.length; i++) ...[
                  state.isEditing
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextField(
                            controller: _paragraphControllers[i],
                            maxLines: null,
                            style: const TextStyle(fontSize: 13.5, height: 1.8),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: theme.colorScheme.surfaceVariant.withOpacity(.3),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                              contentPadding: const EdgeInsets.all(10),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(state.paragraphs[i],
                              style: const TextStyle(fontSize: 13.5, height: 1.8)),
                        ),
                ],
              ],
            ),
          ),

        const SizedBox(height: 24),

        // 旅行成就
        Text('旅行成就', style: theme.textTheme.titleLarge),
        const SizedBox(height: 8),
        Row(
          children: [
            _statCell(context, state.stats.estimatedDistanceKm < 1
                ? '-' : '约${state.stats.estimatedDistanceKm.toStringAsFixed(0)}', '里程 km'),
            const SizedBox(width: 8),
            _statCell(context, '${state.stats.locationCount}', '打卡地点'),
            const SizedBox(width: 8),
            _statCell(context, '${state.stats.photoCount}', '照片数'),
            const SizedBox(width: 8),
            _statCell(context, '${state.stats.recordCount}', '记录条数'),
          ],
        ),

        const SizedBox(height: 24),

        // 花费汇总
        Text('花费汇总', style: theme.textTheme.titleLarge),
        const SizedBox(height: 8),
        _buildExpenseSummary(context, state),

        const SizedBox(height: 24),

        // 导出/分享
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: state.hasContent ? () => _shareText(state) : null,
                icon: const Icon(Icons.ios_share, size: 16),
                label: const Text('分享文字'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: state.hasContent ? () => _showExportComingSoon(context) : null,
                icon: const Icon(Icons.picture_as_pdf_outlined, size: 16),
                label: const Text('导出PDF'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _statCell(BuildContext context, String value, String label) {
    final theme = Theme.of(context);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: theme.dividerColor.withOpacity(.5)),
        ),
        child: Column(
          children: [
            Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            const SizedBox(height: 2),
            Text(label, style: theme.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }

  Widget _buildExpenseSummary(BuildContext context, JournalState state) {
    final theme = Theme.of(context);
    if (state.totalExpenseCents == 0) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceVariant.withOpacity(.3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Text('还没有记账数据', style: TextStyle(color: Colors.grey)),
      );
    }

    final entries = state.expenseByCategory.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.dividerColor.withOpacity(.5)),
      ),
      child: Column(
        children: entries.map((e) {
          final category = ExpenseCategory.fromLabel(e.key);
          final ratio = e.value / state.totalExpenseCents;
          final yuan = e.value / 100.0;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.key, style: const TextStyle(fontSize: 12.5)),
                    Text('¥${yuan.toStringAsFixed(0)}', style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700)),
                  ],
                ),
                const SizedBox(height: 5),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: ratio,
                    minHeight: 7,
                    backgroundColor: theme.colorScheme.surfaceVariant,
                    color: category.color,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  void _shareText(JournalState state) {
    final text = '${state.title}\n\n${state.paragraphs.join('\n\n')}';
    Share.share(text, subject: state.title);
  }

  void _showExportComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('PDF/长图导出功能正在开发中，先用"分享文字"试试效果')),
    );
  }
}
