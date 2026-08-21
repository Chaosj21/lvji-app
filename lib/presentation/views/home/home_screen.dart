import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../providers.dart';
import '../../../core/constants/strings.dart';
import '../../../data/datasources/local/app_database.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripListAsync = ref.watch(tripListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.myTrips),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: tripListAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('${AppStrings.loadFailed}: $err')),
        data: (trips) {
          if (trips.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map_outlined, size: 56, color: Theme.of(context).colorScheme.primary.withOpacity(.35)),
                  const SizedBox(height: 16),
                  Text(AppStrings.noTripsYet, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(
                    AppStrings.noTripsHint,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: trips.length,
            itemBuilder: (context, index) => _TicketTripCard(trip: trips[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateTripDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showCreateTripDialog(BuildContext context, WidgetRef ref) {
    ref.read(newTripFormProvider.notifier).reset();
    showDialog(
      context: context,
      builder: (context) => const CreateTripDialog(),
    );
  }
}

/// 登机牌/车票风格的旅程卡片：左边主体信息，右边目的地缩略图（有封面照片用照片，没有就用渐变色占位），
/// 中间用虚线撕口分隔。
class _TicketTripCard extends StatelessWidget {
  final Trip trip;
  const _TicketTripCard({required this.trip});

  // 没有封面照片时，用 trip.id 的哈希值稳定选一个渐变色占位
  static const _gradients = [
    [Color(0xFF3E6B6A), Color(0xFF8FA98F), Color(0xFFD8C79A)],
    [Color(0xFF8FA9C9), Color(0xFFDCE3D0), Color(0xFFD8C79A)],
    [Color(0xFFD8A9C9), Color(0xFFE8D3B0), Color(0xFF9FC9D8)],
    [Color(0xFFC9A9D8), Color(0xFFD8C79A), Color(0xFF8FA98F)],
  ];

  List<Color> get _gradient => _gradients[trip.id.hashCode.abs() % _gradients.length];

  String get _statusLabel {
    switch (trip.status) {
      case 1:
        return '进行中';
      case 2:
        return '已完成';
      default:
        return '筹备中';
    }
  }

  Color _statusColor(BuildContext context) {
    switch (trip.status) {
      case 1:
        return Theme.of(context).colorScheme.secondary;
      case 2:
        return Theme.of(context).colorScheme.onSurface.withOpacity(.4);
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }

  String get _routeLabel {
    final parts = trip.destination.split(RegExp(r'[,，]')).map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
    if (parts.length >= 2) return parts.join(' → ');
    return parts.isNotEmpty ? parts.first : trip.destination;
  }

  String _footerText() {
    final totalDays = trip.endDate.difference(trip.startDate).inDays + 1;
    switch (trip.status) {
      case 1:
        final now = DateTime.now();
        final start = DateTime(trip.startDate.year, trip.startDate.month, trip.startDate.day);
        final day = (DateTime(now.year, now.month, now.day).difference(start).inDays + 1).clamp(1, totalDays);
        return '进行中 · Day $day/$totalDays';
      case 2:
        return '已完成 · 共 $totalDays 天';
      default:
        final now = DateTime.now();
        final diff = trip.startDate.difference(now).inDays;
        return diff > 0 ? '距出发还有 $diff 天' : '即将出发 · 共 $totalDays 天';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFmt = DateFormat('MM.dd');
    final statusColor = _statusColor(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      height: 128,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.dividerColor),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.04), blurRadius: 10, offset: const Offset(0, 3)),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/trip/${trip.id}'),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 12, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(.12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            _statusLabel,
                            style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w700, color: statusColor),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(trip.title,
                            style: theme.textTheme.titleLarge?.copyWith(fontSize: 17),
                            maxLines: 1, overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 3),
                        Text(_routeLabel, style: theme.textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_today_outlined, size: 11, color: theme.colorScheme.onSurface.withOpacity(.4)),
                        const SizedBox(width: 4),
                        Text(
                          '${dateFmt.format(trip.startDate)} - ${dateFmt.format(trip.endDate)}',
                          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            _footerText(),
                            style: theme.textTheme.bodySmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              width: 14,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(size: const Size(1.5, double.infinity), painter: _DashedLinePainter(color: theme.dividerColor)),
                  Positioned(top: -7, child: _notch(theme)),
                  Positioned(bottom: -7, child: _notch(theme)),
                ],
              ),
            ),

            // ---- 目的地缩略图：有封面照片用真照片，没有就用渐变色占位 ----
            SizedBox(
              width: 92,
              child: trip.coverImageBytes != null
                  ? Image.memory(trip.coverImageBytes!, fit: BoxFit.cover)
                  : Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: _gradient),
                      ),
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        _routeLabel.split(' → ').last,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          shadows: [Shadow(color: Colors.black38, blurRadius: 4)],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _notch(ThemeData theme) {
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(color: theme.scaffoldBackgroundColor, shape: BoxShape.circle),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Color color;
  const _DashedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.2;
    const dashHeight = 4.0;
    const dashSpace = 4.0;
    double y = 0;
    while (y < size.height) {
      canvas.drawLine(Offset(size.width / 2, y), Offset(size.width / 2, y + dashHeight), paint);
      y += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CreateTripDialog extends ConsumerStatefulWidget {
  const CreateTripDialog({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateTripDialog> createState() => _CreateTripDialogState();
}

class _CreateTripDialogState extends ConsumerState<CreateTripDialog> {
  DateTime? _start;
  DateTime? _end;

  Future<void> _pickDateRange() async {
    final now = DateTime.now();
    final range = await showDateRangePicker(
      context: context,
      firstDate: now.subtract(const Duration(days: 30)),
      lastDate: now.add(const Duration(days: 365)),
      initialDateRange: _start != null && _end != null ? DateTimeRange(start: _start!, end: _end!) : null,
    );
    if (range != null) {
      setState(() {
        _start = range.start;
        _end = range.end;
      });
      ref.read(newTripFormProvider.notifier).setStartDate(range.start);
      ref.read(newTripFormProvider.notifier).setEndDate(range.end);
    }
  }

  Future<void> _pickCoverImage() async {
    final source = await showModalBottomSheet<ImageSource>(
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
    if (source == null) return;
    final file = await ImagePicker().pickImage(source: source, maxWidth: 1600, imageQuality: 85);
    if (file == null) return;
    final bytes = await file.readAsBytes();
    ref.read(newTripFormProvider.notifier).setCoverImage(bytes);
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(newTripFormProvider);
    final dateFmt = DateFormat('yyyy.MM.dd');
    final theme = Theme.of(context);

    return AlertDialog(
      title: const Text(AppStrings.createTrip),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 封面照片
            InkWell(
              onTap: _pickCoverImage,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 100,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: theme.dividerColor),
                  color: theme.colorScheme.surfaceVariant.withOpacity(.3),
                ),
                child: formState.coverImageBytes != null
                    ? Image.memory(formState.coverImageBytes!, fit: BoxFit.cover, width: double.infinity)
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_photo_alternate_outlined, color: theme.colorScheme.onSurface.withOpacity(.4)),
                          const SizedBox(height: 4),
                          Text('添加封面照片（可选）', style: theme.textTheme.bodySmall),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(labelText: AppStrings.tripName),
              onChanged: (value) => ref.read(newTripFormProvider.notifier).setTitle(value),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: AppStrings.tripDestination, hintText: '可以填多个城市，用逗号分开'),
              onChanged: (value) => ref.read(newTripFormProvider.notifier).setDestination(value),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: _pickDateRange,
              child: InputDecorator(
                decoration: const InputDecoration(labelText: '出行日期'),
                child: Text(
                  _start != null && _end != null
                      ? '${dateFmt.format(_start!)} - ${dateFmt.format(_end!)}'
                      : '点击选择日期范围',
                  style: TextStyle(color: _start != null ? null : Theme.of(context).hintColor),
                ),
              ),
            ),
            if (formState.error != null) ...[
              const SizedBox(height: 12),
              Text(formState.error!, style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 13)),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text(AppStrings.cancel)),
        ElevatedButton(
          onPressed: formState.isSubmitting
              ? null
              : () async {
                  final success = await ref.read(newTripFormProvider.notifier).submit();
                  if (success && context.mounted) {
                    Navigator.pop(context);
                    ref.invalidate(tripListProvider);
                  }
                },
          child: formState.isSubmitting
              ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
              : const Text(AppStrings.create),
        ),
      ],
    );
  }
}
