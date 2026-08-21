import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';
import '../../../../services/amap_poi_service.dart';
import '../../../controllers/amap_config_controller.dart';

/// 地图选点页：用户在地图上点一下，确定这个点作为新地点的经纬度。
///
/// 支持关键字搜索 POI，点击搜索结果可以快速定位到该地点。
///
/// 用法：Navigator.push 后 await 返回值，拿到的是一个 [LatLng]（用户没选就点返回则为 null）。
///
/// ⚠️ 依赖 AndroidManifest.xml 里配置好高德 Key（meta-data name="com.amap.api.v2.apikey"），
/// 具体配置步骤见 PHASE2_5_NOTES.md，这一步无法用 patch 自动完成，需要你手动改一次。
class LocationPickerScreen extends ConsumerStatefulWidget {
  /// 初始定位中心点，一般传当前城市或者上一个已添加地点的坐标，让地图打开时别一片空白
  final LatLng initialCenter;

  const LocationPickerScreen({
    this.initialCenter = const LatLng(39.909187, 116.397451), // 默认北京天安门
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends ConsumerState<LocationPickerScreen> {
  AMapController? _controller;
  LatLng? _pickedLatLng;
  PoiResultItem? _pickedPoi;

  // 搜索状态
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();
  List<PoiResultItem> _searchResults = [];
  bool _searching = false;
  String? _searchError;

  late final AMapPOIService _poiService;

  @override
  void initState() {
    super.initState();
    final configuredKey = ref.read(amapConfigControllerProvider);
    _poiService = AMapPOIService(overrideKey: configuredKey.isEmpty ? null : configuredKey);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  Future<void> _doSearch(String keyword) async {
    if (keyword.trim().isEmpty) {
      setState(() {
        _searchResults = [];
        _searchError = null;
      });
      return;
    }

    setState(() {
      _searching = true;
      _searchError = null;
    });

    final results = await _poiService.search(keyword: keyword, limit: 10);

    if (!mounted) return;
    setState(() {
      _searchResults = results;
      _searching = false;
      if (results.isEmpty && !_searching) {
        _searchError = '未找到相关地点';
      } else {
        _searchError = null;
      }
    });
  }

  void _selectPoi(PoiResultItem poi) {
    final latLng = poi.latLng;
    setState(() {
      _pickedLatLng = latLng;
      _pickedPoi = poi;
      _searchResults = [];
      _searchController.clear();
      _searchFocusNode.unfocus();
    });
    // 移动相机到选中的地点
    _controller?.moveCamera(
      CameraUpdate.newLatLngZoom(latLng, 16.0),
    );
  }

  void _onTap(LatLng latLng) {
    setState(() {
      _pickedLatLng = latLng;
      _pickedPoi = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('在地图上选点'),
        actions: [
          TextButton(
            onPressed: _pickedLatLng == null ? null : () => Navigator.pop(context, _pickedLatLng),
            child: Text(
              '确定',
              style: TextStyle(
                color: _pickedLatLng == null ? Colors.grey : Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          AMapWidget(
            initialCameraPosition: CameraPosition(target: widget.initialCenter, zoom: 14.0),
            onMapCreated: (controller) => _controller = controller,
            onTap: _onTap,
            markers: _buildMarkers(),
          ),

          // 顶部搜索栏
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(12, 48, 12, 12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: const Offset(0, 2))],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _searchController,
                    focusNode: _searchFocusNode,
                    decoration: InputDecoration(
                      hintText: '搜索地点名称，如"故宫"、"星巴克"',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _searching
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: CircularProgressIndicator(strokeWidth: 2),
                              ),
                            )
                          : (_searchError != null
                              ? IconButton(
                                  icon: const Icon(Icons.close, color: Colors.red),
                                  onPressed: () {
                                    _searchController.clear();
                                    _doSearch('');
                                  },
                                )
                              : null),
                      errorText: _searchError,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    onChanged: _doSearch,
                    onSubmitted: _doSearch,
                    textInputAction: TextInputAction.search,
                  ),
                ],
              ),
            ),
          ),

          // 搜索结果列表（下拉显示）
          if (_searchResults.isNotEmpty)
            Positioned(
              top: 120,
              left: 12,
              right: 12,
              child: Container(
                constraints: const BoxConstraints(maxHeight: 200),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10, offset: const Offset(0, 4))],
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: 8),
                  shrinkWrap: true,
                  itemCount: _searchResults.length,
                  separatorBuilder: (_, __) => const Divider(height: 1, indent: 12, endIndent: 12),
                  itemBuilder: (context, index) {
                    final poi = _searchResults[index];
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 16,
                        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                        child: const Icon(Icons.location_on, size: 16, color: Colors.white),
                      ),
                      title: Text(poi.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: Text(poi.address, maxLines: 1, overflow: TextOverflow.ellipsis),
                      trailing: Text(poi.adName, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
                      onTap: () => _selectPoi(poi),
                    );
                  },
                ),
              ),
            ),

          // 底部提示条
          Positioned(
            left: 16,
            right: 16,
            bottom: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_pickedPoi != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        '已选择：${_pickedPoi!.name}',
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  Text(
                    _pickedLatLng == null
                        ? '点一下地图上的位置，或上方搜索地点'
                        : '已选中：${_pickedLatLng!.latitude.toStringAsFixed(6)}, '
                            '${_pickedLatLng!.longitude.toStringAsFixed(6)}',
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Set<Marker> _buildMarkers() {
    if (_pickedLatLng == null) return {};
    return {
      Marker(
        position: _pickedLatLng!,
      ),
    };
  }
}
