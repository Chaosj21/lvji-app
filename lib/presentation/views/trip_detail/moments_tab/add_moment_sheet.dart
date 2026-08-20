import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/constants/expense_categories.dart';
import '../../../controllers/day_feed_controller.dart';
import '../plan_tab/plan_screen.dart' show dayColors;

/// 随记/记账的统一入口弹窗：先选天，再选"随手拍 / 写点什么 / 记一笔"。
/// 对应之前 HTML 原型里"点+号先选天再选类型"的交互，这里落成真实的 Flutter bottom sheet。
Future<void> showAddEntrySheet({
  required BuildContext context,
  required int totalDays,
  required int initialDay,
  required DayFeedController controller,
}) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => _AddEntrySheet(
      totalDays: totalDays,
      initialDay: initialDay,
      controller: controller,
    ),
  );
}

class _AddEntrySheet extends StatefulWidget {
  final int totalDays;
  final int initialDay;
  final DayFeedController controller;

  const _AddEntrySheet({required this.totalDays, required this.initialDay, required this.controller});

  @override
  State<_AddEntrySheet> createState() => _AddEntrySheetState();
}

class _AddEntrySheetState extends State<_AddEntrySheet> {
  late int _day;

  @override
  void initState() {
    super.initState();
    _day = widget.initialDay;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36, height: 4,
                margin: const EdgeInsets.only(bottom: 14),
                decoration: BoxDecoration(color: theme.dividerColor, borderRadius: BorderRadius.circular(4)),
              ),
            ),
            Text('添加到旅行随记', style: theme.textTheme.titleLarge),
            const SizedBox(height: 12),

            // 天数选择
            SizedBox(
              height: 34,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: widget.totalDays,
                separatorBuilder: (_, __) => const SizedBox(width: 6),
                itemBuilder: (context, index) {
                  final d = index + 1;
                  final selected = d == _day;
                  final color = dayColors[(d - 1) % dayColors.length];
                  return ChoiceChip(
                    label: Text('Day $d', style: const TextStyle(fontSize: 12)),
                    selected: selected,
                    selectedColor: color,
                    labelStyle: TextStyle(color: selected ? Colors.white : null, fontWeight: FontWeight.w600),
                    onSelected: (_) => setState(() => _day = d),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            _OptionTile(
              icon: Icons.camera_alt_outlined,
              iconColor: theme.colorScheme.primary,
              title: '随手拍',
              subtitle: '记录这一刻的照片和心情',
              onTap: () => _handlePhoto(context),
            ),
            const SizedBox(height: 8),
            _OptionTile(
              icon: Icons.edit_note_outlined,
              iconColor: const Color(0xFF34C759),
              title: '写点什么',
              subtitle: '记录今天发生的事',
              onTap: () => _handleText(context),
            ),
            const SizedBox(height: 8),
            _OptionTile(
              icon: Icons.receipt_long_outlined,
              iconColor: const Color(0xFFFF9500),
              title: '记一笔',
              subtitle: '手动记账（拍票据自动识别功能开发中）',
              onTap: () => _handleExpense(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handlePhoto(BuildContext context) async {
    final picker = ImagePicker();
    final source = await _pickImageSource(context);
    if (source == null) return;

    final file = await picker.pickImage(source: source, maxWidth: 1600, imageQuality: 85);
    if (file == null) return;

    final bytes = await file.readAsBytes();
    if (!mounted) return;

    final caption = await _promptText(context, title: '给这张照片写点说明', hint: '（可留空）', required: false);
    if (caption == null) return; // 用户取消

    Navigator.pop(context);
    await widget.controller.addMoment(
      day: _day,
      text: caption.isEmpty ? '随手拍下的一刻' : caption,
      imageBytes: bytes,
    );
  }

  Future<ImageSource?> _pickImageSource(BuildContext context) {
    return showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('拍照'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('从相册选择'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleText(BuildContext context) async {
    final text = await _promptText(context, title: '记录今天发生的事', hint: '今天发生了什么…', required: true);
    if (text == null || text.trim().isEmpty) return;
    Navigator.pop(context);
    await widget.controller.addMoment(day: _day, text: text.trim());
  }

  Future<void> _handleExpense(BuildContext context) async {
    final result = await _promptExpense(context);
    if (result == null) return;
    Navigator.pop(context);
    await widget.controller.addExpense(
      day: _day,
      name: result.$1,
      category: result.$2,
      amountCents: result.$3,
    );
  }

  Future<String?> _promptText(BuildContext context,
      {required String title, required String hint, required bool required}) {
    final controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          maxLines: 3,
          autofocus: true,
          decoration: InputDecoration(hintText: hint),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('取消')),
          TextButton(
            onPressed: () {
              if (required && controller.text.trim().isEmpty) return;
              Navigator.pop(context, controller.text);
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  Future<(String, String, int)?> _promptExpense(BuildContext context) {
    final nameController = TextEditingController();
    final amountController = TextEditingController();
    ExpenseCategory category = ExpenseCategory.food;

    return showDialog<(String, String, int)>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('记一笔'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nameController,
                  autofocus: true,
                  decoration: const InputDecoration(labelText: '这笔花费是什么'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: amountController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(labelText: '金额（元）', prefixText: '¥'),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: ExpenseCategory.values.map((c) {
                    final selected = c == category;
                    return ChoiceChip(
                      label: Text(c.label, style: const TextStyle(fontSize: 12)),
                      avatar: Icon(c.icon, size: 14, color: selected ? Colors.white : c.color),
                      selected: selected,
                      selectedColor: c.color,
                      labelStyle: TextStyle(color: selected ? Colors.white : null),
                      onSelected: (_) => setDialogState(() => category = c),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('取消')),
            TextButton(
              onPressed: () {
                final name = nameController.text.trim();
                final amount = double.tryParse(amountController.text.trim());
                if (name.isEmpty || amount == null || amount < 0) return;
                Navigator.pop(context, (name, category.label, (amount * 100).round()));
              },
              child: const Text('保存'),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _OptionTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceVariant.withOpacity(.35),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              width: 38, height: 38,
              decoration: BoxDecoration(color: iconColor, borderRadius: BorderRadius.circular(11)),
              child: Icon(icon, color: Colors.white, size: 19),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 1),
                  Text(subtitle, style: theme.textTheme.bodySmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
