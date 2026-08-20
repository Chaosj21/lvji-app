import 'package:flutter/material.dart';
import '../../../../data/datasources/local/app_database.dart';
import '../../../../core/constants/expense_categories.dart';

class ExpenseCardWidget extends StatelessWidget {
  final Expense expense;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ExpenseCardWidget({
    required this.expense,
    required this.onEdit,
    required this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final category = ExpenseCategory.fromLabel(expense.category);
    final yuan = expense.amount / 100.0;
    final isOcr = expense.receiptOcrResult != null;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.dividerColor.withOpacity(.5)),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: category.color.withOpacity(.14),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(category.icon, size: 17, color: category.color),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(expense.name, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(category.label, style: theme.textTheme.bodySmall),
                    if (isOcr) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text('已识别',
                            style: TextStyle(fontSize: 9.5, color: theme.colorScheme.primary, fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          Text('¥${yuan.toStringAsFixed(yuan.truncateToDouble() == yuan ? 0 : 2)}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: theme.colorScheme.error)),
          const SizedBox(width: 6),
          InkWell(
            onTap: onEdit,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Icon(Icons.edit_outlined, size: 15, color: theme.colorScheme.onSurface.withOpacity(.4)),
            ),
          ),
          InkWell(
            onTap: onDelete,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Icon(Icons.delete_outline, size: 15, color: theme.colorScheme.onSurface.withOpacity(.4)),
            ),
          ),
        ],
      ),
    );
  }
}
