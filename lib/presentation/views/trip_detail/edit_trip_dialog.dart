import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' show Value;
import '../../providers.dart';
import '../../../data/datasources/local/app_database.dart';

/// 编辑已有旅程：标题、目的地、日期、封面照片。
/// 跟创建旅程的表单是分开的两套状态（不复用 newTripFormProvider），
/// 避免"编辑一半退出"污染创建旅程的表单状态。
class EditTripDialog extends ConsumerStatefulWidget {
  final Trip trip;
  const EditTripDialog({required this.trip, Key? key}) : super(key: key);

  @override
  ConsumerState<EditTripDialog> createState() => _EditTripDialogState();
}

class _EditTripDialogState extends ConsumerState<EditTripDialog> {
  late TextEditingController _titleController;
  late TextEditingController _destinationController;
  DateTime? _start;
  DateTime? _end;
  Uint8List? _coverImageBytes;
  bool _coverChanged = false; // 用户有没有主动改过封面（区分"没改"和"改成空"）
  bool _submitting = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.trip.title);
    _destinationController = TextEditingController(text: widget.trip.destination);
    _start = widget.trip.startDate;
    _end = widget.trip.endDate;
    _coverImageBytes = widget.trip.coverImageBytes;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  Future<void> _pickDateRange() async {
    final range = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 730)),
      initialDateRange: _start != null && _end != null ? DateTimeRange(start: _start!, end: _end!) : null,
    );
    if (range != null) {
      setState(() {
        _start = range.start;
        _end = range.end;
      });
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
            if (_coverImageBytes != null)
              ListTile(
                leading: const Icon(Icons.delete_outline, color: Colors.red),
                title: const Text('移除封面照片', style: TextStyle(color: Colors.red)),
                onTap: () => Navigator.pop(context, null),
              ),
          ],
        ),
      ),
    );

    if (source == null && _coverImageBytes == null) return; // 用户没选任何东西，取消了

    if (source == null) {
      // 用户点了"移除封面照片"
      setState(() {
        _coverImageBytes = null;
        _coverChanged = true;
      });
      return;
    }

    final file = await ImagePicker().pickImage(source: source, maxWidth: 1600, imageQuality: 85);
    if (file == null) return;
    final bytes = await file.readAsBytes();
    setState(() {
      _coverImageBytes = bytes;
      _coverChanged = true;
    });
  }

  Future<void> _submit() async {
    final title = _titleController.text.trim();
    final destination = _destinationController.text.trim();

    if (title.isEmpty || destination.isEmpty || _start == null || _end == null) {
      setState(() => _error = '请填写所有必填项');
      return;
    }

    setState(() {
      _submitting = true;
      _error = null;
    });

    try {
      final tripDao = ref.read(tripDaoProvider);
      await tripDao.updateTrip(TripsCompanion(
        id: Value(widget.trip.id),
        title: Value(title),
        destination: Value(destination),
        startDate: Value(_start!),
        endDate: Value(_end!),
        description: Value(widget.trip.description),
        status: Value(widget.trip.status),
        totalBudget: Value(widget.trip.totalBudget),
        actualSpent: Value(widget.trip.actualSpent),
        coverImageBytes: _coverChanged ? Value(_coverImageBytes) : Value(widget.trip.coverImageBytes),
        syncedToCloud: Value(widget.trip.syncedToCloud),
        createdAt: Value(widget.trip.createdAt),
        updatedAt: Value(DateTime.now()),
      ));

      ref.invalidate(tripDetailProvider(widget.trip.id));
      ref.invalidate(tripListProvider);

      if (mounted) Navigator.pop(context);
    } catch (e) {
      setState(() => _error = '保存失败：$e');
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFmt = DateFormat('yyyy.MM.dd');
    final theme = Theme.of(context);

    return AlertDialog(
      title: const Text('编辑旅程'),
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
                child: _coverImageBytes != null
                    ? Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.memory(_coverImageBytes!, fit: BoxFit.cover),
                          Positioned(
                            right: 6,
                            bottom: 6,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.55),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text('更换封面', style: TextStyle(color: Colors.white, fontSize: 11)),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_photo_alternate_outlined, color: theme.colorScheme.onSurface.withOpacity(.4)),
                          const SizedBox(height: 4),
                          Text('添加封面照片', style: theme.textTheme.bodySmall),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: '旅程名称'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _destinationController,
              decoration: const InputDecoration(labelText: '目的地', hintText: '可以填多个城市，用逗号分开'),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: _pickDateRange,
              child: InputDecorator(
                decoration: const InputDecoration(labelText: '出行日期'),
                child: Text(
                  _start != null && _end != null
                      ? '${dateFmt.format(_start!)} - ${dateFmt.format(_end!)}'
                      : '点击选择日期范围',
                ),
              ),
            ),
            if (_error != null) ...[
              const SizedBox(height: 10),
              Text(_error!, style: TextStyle(color: theme.colorScheme.error, fontSize: 12)),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('取消')),
        ElevatedButton(
          onPressed: _submitting ? null : _submit,
          child: _submitting
              ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
              : const Text('保存'),
        ),
      ],
    );
  }
}
