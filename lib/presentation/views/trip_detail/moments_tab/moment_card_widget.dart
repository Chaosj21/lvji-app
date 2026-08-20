import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../data/datasources/local/app_database.dart';

class MomentCardWidget extends StatelessWidget {
  final Moment moment;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const MomentCardWidget({
    required this.moment,
    required this.onEdit,
    required this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final timeStr = DateFormat('HH:mm').format(moment.recordedAt);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.dividerColor.withOpacity(.5)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (moment.imageBytes != null) _buildPhoto(context, moment.imageBytes!),
          Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (moment.imageBytes == null)
                  Row(
                    children: [
                      Expanded(child: Text(moment.textContent, style: const TextStyle(fontSize: 13.5, height: 1.5))),
                      _buildActions(context),
                    ],
                  )
                else
                  Text(moment.textContent, style: const TextStyle(fontSize: 13.5, height: 1.5)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(timeStr, style: theme.textTheme.bodySmall),
                    if ((moment.weather ?? '').isNotEmpty) ...[
                      const SizedBox(width: 8),
                      Text(moment.weather!, style: theme.textTheme.bodySmall),
                    ],
                    if ((moment.locationTag ?? '').isNotEmpty) ...[
                      const SizedBox(width: 8),
                      Icon(Icons.place_outlined, size: 12, color: theme.colorScheme.onSurface.withOpacity(.4)),
                      const SizedBox(width: 2),
                      Text(moment.locationTag!, style: theme.textTheme.bodySmall),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoto(BuildContext context, Uint8List bytes) {
    return Stack(
      children: [
        Image.memory(bytes, width: double.infinity, height: 180, fit: BoxFit.cover),
        Positioned(
          top: 8,
          right: 8,
          child: Row(
            children: [
              _iconBtn(Icons.edit_outlined, onEdit),
              const SizedBox(width: 6),
              _iconBtn(Icons.delete_outline, onDelete),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _iconBtn(Icons.edit_outlined, onEdit, dark: false),
        const SizedBox(width: 4),
        _iconBtn(Icons.delete_outline, onDelete, dark: false),
      ],
    );
  }

  Widget _iconBtn(IconData icon, VoidCallback onTap, {bool dark = true}) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          color: dark ? Colors.black.withOpacity(.45) : Colors.black.withOpacity(.06),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 13, color: dark ? Colors.white : Colors.black54),
      ),
    );
  }
}
