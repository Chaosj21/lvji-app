import 'package:flutter/material.dart';

enum ExpenseCategory {
  transport('交通', Icons.directions_car_outlined, Color(0xFF0A84FF)),
  accommodation('住宿', Icons.bed_outlined, Color(0xFF5E5CE6)),
  food('餐饮', Icons.restaurant_outlined, Color(0xFFFF9500)),
  tickets('门票', Icons.confirmation_num_outlined, Color(0xFF34C759)),
  shopping('购物', Icons.shopping_bag_outlined, Color(0xFFE07BB0)),
  other('其他', Icons.receipt_long_outlined, Color(0xFF8E8E93));

  final String label;
  final IconData icon;
  final Color color;

  const ExpenseCategory(this.label, this.icon, this.color);

  static ExpenseCategory fromLabel(String label) {
    return ExpenseCategory.values.firstWhere(
      (c) => c.label == label,
      orElse: () => ExpenseCategory.other,
    );
  }
}
