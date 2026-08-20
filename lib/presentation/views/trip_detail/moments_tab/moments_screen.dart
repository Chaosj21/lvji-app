import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../controllers/day_feed_controller.dart';
import '../../../../data/datasources/local/app_database.dart';
import 'moment_card_widget.dart';
import 'expense_card_widget.dart';
import 'add_moment_sheet.dart';

class MomentsScreen extends ConsumerWidget {
  final String tripId;
  final Trip trip;

  const MomentsScreen({required this.tripId, required this.trip, Key? key}) : super(key: key);

  int get _totalDays {
    final d = trip.endDate.difference(trip.startDate).inDays + 1;
    return d < 1 ? 1 : d;
  }

  int get _currentDay {
    final now = DateTime.now();
    final start = DateTime(trip.startDate.year, trip.startDate.month, trip.startDate.day);
    final today = DateTime(now.year, now.month, now.day);
    final diff = today.difference(start).inDays + 1;
    return diff.clamp(1, _totalDays);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dayFeedControllerProvider(tripId));
    final controller = ref.read(dayFeedControllerProvider(tripId).notifier);

    return Scaffold(
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: controller.reload,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 90),
                children: [
                  _buildSpendBar(context, state),
                  const SizedBox(height: 16),
                  if (state.activeDays.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 60),
                      child: Center(
                        child: Text('还没有随记内容，点右下角"+"开始记录',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                    )
                  else
                    ...state.activeDays.expand((day) => _buildDaySection(context, controller, day, state)),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddEntrySheet(
          context: context,
          totalDays: _totalDays,
          initialDay: _currentDay,
          controller: controller,
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSpendBar(BuildContext context, DayFeedState state) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.dividerColor.withOpacity(.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('本次旅程已花费', style: theme.textTheme.bodySmall),
              const SizedBox(height: 2),
              Text('¥${state.totalSpentYuan.toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: theme.colorScheme.error)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('日均', style: theme.textTheme.bodySmall),
              const SizedBox(height: 2),
              Text('¥${state.avgPerDayYuan.toStringAsFixed(0)}',
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDaySection(
      BuildContext context, DayFeedController controller, int day, DayFeedState state) {
    final entries = state.byDay[day]!;
    return [
      Padding(
        padding: const EdgeInsets.only(top: 6, bottom: 8),
        child: Text('DAY $day',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: .5,
              color: Theme.of(context).colorScheme.primary,
            )),
      ),
      ...entries.map((entry) {
        if (entry.isExpense) {
          return ExpenseCardWidget(
            expense: entry.expense!,
            onEdit: () => _editExpense(context, controller, entry.expense!),
            onDelete: () => _confirmDelete(context, () => controller.deleteExpense(entry.id)),
          );
        }
        return MomentCardWidget(
          moment: entry.moment!,
          onEdit: () => _editMoment(context, controller, entry.moment!),
          onDelete: () => _confirmDelete(context, () => controller.deleteMoment(entry.id)),
        );
      }),
    ];
  }

  Future<void> _editMoment(BuildContext context, DayFeedController controller, Moment moment) async {
    final textController = TextEditingController(text: moment.textContent);
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('编辑随记'),
        content: TextField(controller: textController, maxLines: 4, autofocus: true),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('取消')),
          TextButton(onPressed: () => Navigator.pop(context, textController.text), child: const Text('保存')),
        ],
      ),
    );
    if (result != null && result.trim().isNotEmpty) {
      await controller.updateMomentText(moment.id, result.trim());
    }
  }

  Future<void> _editExpense(BuildContext context, DayFeedController controller, Expense expense) async {
    final nameController = TextEditingController(text: expense.name);
    final amountController = TextEditingController(text: (expense.amount / 100.0).toStringAsFixed(2));
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('编辑花费'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: '项目名称')),
            const SizedBox(height: 12),
            TextField(
              controller: amountController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: '金额（元）', prefixText: '¥'),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('取消')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('保存')),
        ],
      ),
    );
    if (result == true) {
      final amount = double.tryParse(amountController.text.trim());
      await controller.updateExpense(
        expense.id,
        name: nameController.text.trim().isEmpty ? null : nameController.text.trim(),
        amountCents: amount == null ? null : (amount * 100).round(),
      );
    }
  }

  Future<void> _confirmDelete(BuildContext context, Future<void> Function() onConfirm) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除这条记录'),
        content: const Text('删除后无法恢复，确定吗？'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('取消')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('删除', style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ),
        ],
      ),
    );
    if (ok == true) await onConfirm();
  }
}
