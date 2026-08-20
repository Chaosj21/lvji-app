import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';
import '../../../../core/constants/location_types.dart';
import '../../../../core/utils/geo_utils.dart';
import '../../../../data/datasources/local/app_database.dart';
import '../../../providers_amap.dart';

class LocationCardWidget extends ConsumerStatefulWidget {
  final int index;
  final Location location;
  final Location? nextLocation;
  final ValueChanged<String> onNotesChanged;
  final VoidCallback onDelete;

  const LocationCardWidget({
    required this.index,
    required this.location,
    required this.nextLocation,
    required this.onNotesChanged,
    required this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<LocationCardWidget> createState() => _LocationCardWidgetState();
}

class _LocationCardWidgetState extends ConsumerState<LocationCardWidget> {
  late final TextEditingController _notesController;
  TransportMode _mode = TransportMode.drive;

  // 按交通方式缓存已经算好的结果，切换回来不用重新请求
  final Map<TransportMode, ConnectorEstimate> _cache = {};
  bool _loading = false;
  bool _usedRealRoute = false;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController(text: widget.location.notes ?? '');
    if (widget.nextLocation != null) {
      _loadEstimate(_mode);
    }
  }

  @override
  void didUpdateWidget(covariant LocationCardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 拖拽排序后 nextLocation 可能变了，缓存要清空重新算
    if (oldWidget.nextLocation?.id != widget.nextLocation?.id) {
      _cache.clear();
      _usedRealRoute = false;
      if (widget.nextLocation != null) _loadEstimate(_mode);
    }
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _loadEstimate(TransportMode mode) async {
    if (widget.nextLocation == null) return;
    if (_cache.containsKey(mode)) return; // 已经有缓存，不用重复请求

    setState(() => _loading = true);

    final next = widget.nextLocation!;
    final service = ref.read(amapDirectionServiceProvider);

    // 先尝试真实高德路线 API，失败/未配置 Key 就 fallback 到直线距离估算
    final real = await service.route(
      from: LatLng(widget.location.latitude, widget.location.longitude),
      to: LatLng(next.latitude, next.longitude),
      mode: mode,
    );

    final estimate = real ??
        ConnectorEstimate.compute(
          fromLat: widget.location.latitude,
          fromLng: widget.location.longitude,
          toLat: next.latitude,
          toLng: next.longitude,
          mode: mode,
        );

    if (!mounted) return;
    setState(() {
      _cache[mode] = estimate;
      _usedRealRoute = real != null;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final type = LocationType.fromValue(widget.location.locationType);
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.dividerColor.withOpacity(.5)),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: type.color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(type.icon, color: Colors.white, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.location.name,
                        style: theme.textTheme.titleLarge, overflow: TextOverflow.ellipsis),
                    if ((widget.location.address ?? '').isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(widget.location.address!,
                            style: theme.textTheme.bodySmall, overflow: TextOverflow.ellipsis),
                      ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, size: 20),
                color: theme.colorScheme.error.withOpacity(.7),
                onPressed: () => _confirmDelete(context),
                visualDensity: VisualDensity.compact,
              ),
              ReorderableDragStartListener(
                index: widget.index,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Icon(Icons.drag_handle, color: theme.colorScheme.onSurface.withOpacity(.35)),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          TextField(
            controller: _notesController,
            maxLines: null,
            minLines: 1,
            style: const TextStyle(fontSize: 13),
            decoration: InputDecoration(
              isDense: true,
              hintText: type == LocationType.attraction ? '写下想玩的攻略、开放时间…' : '写点备注…',
              filled: true,
              fillColor: theme.colorScheme.surfaceVariant.withOpacity(.35),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            ),
            onEditingComplete: () => widget.onNotesChanged(_notesController.text),
            onTapOutside: (_) => widget.onNotesChanged(_notesController.text),
          ),

          if (widget.nextLocation != null) ...[
            const SizedBox(height: 10),
            _buildConnectorRow(theme),
          ],
        ],
      ),
    );
  }

  Widget _buildConnectorRow(ThemeData theme) {
    final estimate = _cache[_mode];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant.withOpacity(.35),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Wrap(
            spacing: 4,
            children: TransportMode.values.map((m) {
              final selected = m == _mode;
              return InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  setState(() => _mode = m);
                  _loadEstimate(m);
                },
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: selected ? theme.colorScheme.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    m.icon,
                    size: 15,
                    color: selected ? Colors.white : theme.colorScheme.onSurface.withOpacity(.5),
                  ),
                ),
              );
            }).toList(),
          ),
          const Spacer(),
          if (_loading)
            const SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          else if (estimate != null) ...[
            if (_usedRealRoute)
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Icon(Icons.verified_outlined, size: 13, color: theme.colorScheme.primary.withOpacity(.7)),
              ),
            Text(
              '→ ${estimate.distanceLabel} · ${estimate.durationLabel}',
              style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除地点'),
        content: Text('确定要删除"${widget.location.name}"吗？'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('取消')),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              widget.onDelete();
            },
            child: Text('删除', style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ),
        ],
      ),
    );
  }
}
