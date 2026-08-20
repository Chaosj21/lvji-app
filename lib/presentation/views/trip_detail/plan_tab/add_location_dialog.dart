import 'package:flutter/material.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';
import '../../../../core/constants/location_types.dart';
import 'location_picker_screen.dart';

class AddLocationDialog extends StatefulWidget {
  final int day;
  final Future<void> Function(
    String name,
    LocationType type,
    double lat,
    double lng,
    String? address,
  ) onSubmit;

  const AddLocationDialog({required this.day, required this.onSubmit, Key? key}) : super(key: key);

  @override
  State<AddLocationDialog> createState() => _AddLocationDialogState();
}

class _AddLocationDialogState extends State<AddLocationDialog> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _latController = TextEditingController();
  final _lngController = TextEditingController();
  LocationType _type = LocationType.attraction;
  bool _submitting = false;
  String? _error;

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _latController.dispose();
    _lngController.dispose();
    super.dispose();
  }

  Future<void> _openMapPicker() async {
    // 如果已经填过经纬度，地图打开时以那个点为中心，方便微调
    LatLng initial = const LatLng(39.909187, 116.397451);
    final curLat = double.tryParse(_latController.text.trim());
    final curLng = double.tryParse(_lngController.text.trim());
    if (curLat != null && curLng != null) {
      initial = LatLng(curLat, curLng);
    }

    final picked = await Navigator.push<LatLng>(
      context,
      MaterialPageRoute(builder: (context) => LocationPickerScreen(initialCenter: initial)),
    );

    if (picked != null) {
      setState(() {
        _latController.text = picked.latitude.toStringAsFixed(6);
        _lngController.text = picked.longitude.toStringAsFixed(6);
        _error = null;
      });
    }
  }

  Future<void> _submit() async {
    final name = _nameController.text.trim();
    final lat = double.tryParse(_latController.text.trim());
    final lng = double.tryParse(_lngController.text.trim());

    if (name.isEmpty) {
      setState(() => _error = '请输入地点名称');
      return;
    }
    if (lat == null || lng == null) {
      setState(() => _error = '请先点"在地图上选点"确定位置，或手动填经纬度');
      return;
    }

    setState(() {
      _submitting = true;
      _error = null;
    });

    try {
      await widget.onSubmit(
        name,
        _type,
        lat,
        lng,
        _addressController.text.trim().isEmpty ? null : _addressController.text.trim(),
      );
      if (mounted) Navigator.pop(context);
    } catch (e) {
      setState(() => _error = '添加失败：$e');
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasCoords = _latController.text.isNotEmpty && _lngController.text.isNotEmpty;

    return AlertDialog(
      title: Text('添加地点 · Day ${widget.day}'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              children: LocationType.values.map((t) {
                final selected = t == _type;
                return ChoiceChip(
                  label: Text(t.label),
                  selected: selected,
                  avatar: Icon(t.icon, size: 16, color: selected ? Colors.white : t.color),
                  selectedColor: t.color,
                  labelStyle: TextStyle(color: selected ? Colors.white : null, fontSize: 12),
                  onSelected: (_) => setState(() => _type = t),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: '地点名称'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: '地址（可选）'),
            ),
            const SizedBox(height: 14),

            // 地图选点入口（主要方式）
            OutlinedButton.icon(
              onPressed: _openMapPicker,
              icon: Icon(hasCoords ? Icons.location_on : Icons.map_outlined, size: 18),
              label: Text(hasCoords ? '已选点，点击重新选择' : '在地图上选点'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(44),
                foregroundColor: hasCoords ? Theme.of(context).colorScheme.primary : null,
              ),
            ),
            if (hasCoords)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  '${_latController.text}, ${_lngController.text}',
                  style: TextStyle(fontSize: 11, color: Theme.of(context).hintColor),
                ),
              ),

            // 手动输入作为兜底（地图选点失败/模拟器没有定位权限时用）
            ExpansionTile(
              tilePadding: EdgeInsets.zero,
              title: const Text('手动输入经纬度（兜底）', style: TextStyle(fontSize: 12, color: Colors.grey)),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _latController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                        decoration: const InputDecoration(labelText: '纬度'),
                        onChanged: (_) => setState(() {}),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _lngController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                        decoration: const InputDecoration(labelText: '经度'),
                        onChanged: (_) => setState(() {}),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            if (_error != null) ...[
              const SizedBox(height: 10),
              Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 12)),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('取消')),
        ElevatedButton(
          onPressed: _submitting ? null : _submit,
          child: _submitting
              ? const SizedBox(
                  width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
              : const Text('添加'),
        ),
      ],
    );
  }
}
