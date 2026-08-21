import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../controllers/location_controller.dart';
import '../../../controllers/packing_controller.dart';
import '../../../controllers/ai_config_controller.dart';
import '../../../../domain/ai_config.dart';
import '../../../../data/datasources/local/app_database.dart';
import '../../../../core/constants/location_types.dart';
import 'location_card_widget.dart';
import 'add_location_dialog.dart';
import 'packing_checklist_widget.dart';

const List<Color> dayColors = [
  Color(0xFF1F7A72),
  Color(0xFFB9852A),
  Color(0xFFC1502E),
  Color(0xFF5E7CD0),
  Color(0xFFB65C8A),
  Color(0xFF34C759),
  Color(0xFF5E5CE6),
];

/// 0 代表"全部"总览，1..N 代表具体的 Day
const int kAllDaysTab = 0;

class PlanScreen extends ConsumerStatefulWidget {
  final String tripId;
  final Trip trip;

  const PlanScreen({required this.tripId, required this.trip, Key? key}) : super(key: key);

  @override
  ConsumerState<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends ConsumerState<PlanScreen> {
  late int _selectedDay; // kAllDaysTab(0) 或 1..N
  late int _totalDays;

  @override
  void initState() {
    super.initState();
    _totalDays = widget.trip.endDate.difference(widget.trip.startDate).inDays + 1;
    if (_totalDays < 1) _totalDays = 1;
    _selectedDay = _currentDayNumber().clamp(1, _totalDays);
  }

  int _currentDayNumber() {
    final now = DateTime.now();
    final start = DateTime(widget.trip.startDate.year, widget.trip.startDate.month, widget.trip.startDate.day);
    final today = DateTime(now.year, now.month, now.day);
    final diff = today.difference(start).inDays + 1;
    if (diff < 1) return 1;
    return diff;
  }

  @override
  Widget build(BuildContext context) {
    final locationsState = ref.watch(locationsControllerProvider(widget.tripId));
    final locationsController = ref.read(locationsControllerProvider(widget.tripId).notifier);
    final packingState = ref.watch(packingControllerProvider(widget.tripId));

    return locationsState.isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
            children: [
              // 天数切换：最前面加一个"全部"
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _totalDays + 1,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      final selected = _selectedDay == kAllDaysTab;
                      return ChoiceChip(
                        label: const Text('全部'),
                        selected: selected,
                        selectedColor: Theme.of(context).colorScheme.onSurface.withOpacity(.75),
                        labelStyle: TextStyle(
                          color: selected ? Colors.white : null,
                          fontWeight: FontWeight.w600,
                        ),
                        onSelected: (_) => setState(() => _selectedDay = kAllDaysTab),
                      );
                    }
                    final day = index; // index 1 -> Day1 ...
                    final selected = day == _selectedDay;
                    final color = dayColors[(day - 1) % dayColors.length];
                    return ChoiceChip(
                      label: Text('Day $day'),
                      selected: selected,
                      selectedColor: color,
                      labelStyle: TextStyle(
                        color: selected ? Colors.white : null,
                        fontWeight: FontWeight.w600,
                      ),
                      onSelected: (_) => setState(() => _selectedDay = day),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              if (_selectedDay == kAllDaysTab) ...[
                _buildOverviewSummary(context, locationsState),
                const SizedBox(height: 14),
                _buildAllDaysList(context, locationsState),
              ] else ...[
                _buildLocationList(context, locationsState, locationsController),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: () => _showAddLocationDialog(context, locationsController),
                  icon: const Icon(Icons.add_location_alt_outlined, size: 18),
                  label: const Text('添加地点'),
                ),
              ],

              const SizedBox(height: 24),
              _buildAiSuggestionCard(context),

              const SizedBox(height: 24),
              Text('物品清单', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              PackingChecklistWidget(tripId: widget.tripId, state: packingState),
            ],
          );
  }

  /// "全部"视图顶部的统计条：总地点数、总天数、已安排天数
  Widget _buildOverviewSummary(BuildContext context, LocationsState state) {
    final theme = Theme.of(context);
    final totalLocations = state.byDay.values.fold<int>(0, (sum, list) => sum + list.length);
    final plannedDays = state.byDay.entries.where((e) => e.value.isNotEmpty).length;

    return Row(
      children: [
        _summaryCell(theme, '$totalLocations', '总地点数'),
        const SizedBox(width: 8),
        _summaryCell(theme, '$_totalDays', '全程天数'),
        const SizedBox(width: 8),
        _summaryCell(theme, '$plannedDays', '已安排天数'),
      ],
    );
  }

  Widget _summaryCell(ThemeData theme, String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: theme.dividerColor),
        ),
        child: Column(
          children: [
            Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            const SizedBox(height: 2),
            Text(label, style: theme.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }

  /// "全部"视图：把每天的地点按 Day 分组，只读展示（不支持拖拽/编辑，
  /// 要改具体安排回到对应 Day 的页签操作），方便快速看完整行程走向。
  Widget _buildAllDaysList(BuildContext context, LocationsState state) {
    final theme = Theme.of(context);
    final daysWithLocations = List.generate(_totalDays, (i) => i + 1)
        .where((d) => state.forDay(d).isNotEmpty)
        .toList();

    if (daysWithLocations.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 32),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceVariant.withOpacity(.3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Text('还没有安排任何地点，切到具体某一天点"添加地点"开始规划', style: TextStyle(color: Colors.grey), textAlign: TextAlign.center),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: daysWithLocations.map((day) {
        final color = dayColors[(day - 1) % dayColors.length];
        final locations = state.forDay(day);
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
                  const SizedBox(width: 6),
                  Text('Day $day', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: color)),
                  const SizedBox(width: 6),
                  Text('· ${locations.length} 个地点', style: theme.textTheme.bodySmall),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: theme.dividerColor),
                ),
                child: Column(
                  children: [
                    for (var i = 0; i < locations.length; i++) ...[
                      if (i > 0) Divider(height: 1, indent: 46, color: theme.dividerColor),
                      _overviewLocationRow(theme, locations[i]),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _overviewLocationRow(ThemeData theme, Location loc) {
    final type = LocationType.fromValue(loc.locationType);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 26, height: 26,
            decoration: BoxDecoration(color: type.color, borderRadius: BorderRadius.circular(8)),
            child: Icon(type.icon, color: Colors.white, size: 13),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(loc.name, style: const TextStyle(fontSize: 13.5), overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationList(
      BuildContext context, LocationsState state, LocationsController controller) {
    final locations = state.forDay(_selectedDay);

    if (locations.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 32),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(.3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Text('这一天还没有安排地点', style: TextStyle(color: Colors.grey)),
      );
    }

    return ReorderableListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      buildDefaultDragHandles: false,
      itemCount: locations.length,
      onReorder: (oldIndex, newIndex) {
        controller.reorderDay(_selectedDay, oldIndex, newIndex);
      },
      itemBuilder: (context, index) {
        final loc = locations[index];
        final next = index < locations.length - 1 ? locations[index + 1] : null;
        return Padding(
          key: ValueKey(loc.id),
          padding: const EdgeInsets.only(bottom: 10),
          child: LocationCardWidget(
            index: index,
            location: loc,
            nextLocation: next,
            onNotesChanged: (notes) => controller.updateNotes(loc.id, notes),
            onDelete: () => controller.deleteLocation(loc.id),
          ),
        );
      },
    );
  }

  Widget _buildAiSuggestionCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF17232E),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFD9A94C).withOpacity(.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text('✦ AI 行程助手',
                    style: TextStyle(color: Color(0xFFD9A94C), fontSize: 11, fontWeight: FontWeight.w700)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            '接入自定义 AI 服务后，这里会根据当天已安排的地点给出简短建议。'
            '没配置的话可以去"设置 → AI 服务"里填自己的 API Key。',
            style: TextStyle(color: Color(0xFFD9D2C1), fontSize: 12.5, height: 1.5),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _selectedDay == kAllDaysTab ? null : () => _generateAiDraft(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD9A94C),
                foregroundColor: const Color(0xFF1B2A38),
              ),
              icon: const Icon(Icons.auto_awesome, size: 16),
              label: Text(_selectedDay == kAllDaysTab ? '切到具体某一天再生成建议' : '生成行程建议'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _generateAiDraft(BuildContext context) async {
    final aiConfig = ref.read(aiConfigControllerProvider);
    if (!(aiConfig.mode == AIProviderMode.custom && aiConfig.isCustomReady)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('还没有配置 AI 服务'),
          content: const Text('去"设置 → AI 服务"里配置你自己的 API Key 后才能用这个功能，或者继续使用内置的手动规划。'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('知道了')),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                context.push('/settings');
              },
              child: const Text('去设置'),
            ),
          ],
        ),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        content: Row(
          children: [
            SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)),
            SizedBox(width: 16),
            Text('AI 正在分析行程…'),
          ],
        ),
      ),
    );

    try {
      final service = ref.read(aiServiceProvider);
      final locationsState = ref.read(locationsControllerProvider(widget.tripId));
      final locations = locationsState.forDay(_selectedDay);
      final locationNames = locations.map((l) => l.name).join('、');
      final prompt = '''
我正在规划旅程"${widget.trip.title}"的第 $_selectedDay 天，目的地是${widget.trip.destination}。
这一天已经安排的地点有：${locationNames.isEmpty ? '（还没有安排地点）' : locationNames}。
请给出 3 条简短的行程建议（比如时间安排、注意事项、体验建议），每条不超过 40 字，直接列出即可，不用其他客套话。
''';
      final result = await service.complete(prompt: prompt, maxTokens: 400);
      if (!context.mounted) return;
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('AI 行程建议'),
          content: SingleChildScrollView(child: Text(result)),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('好的')),
          ],
        ),
      );
    } catch (e) {
      if (!context.mounted) return;
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('生成失败'),
          content: Text('$e'),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('知道了'))],
        ),
      );
    }
  }

  void _showAddLocationDialog(BuildContext context, LocationsController controller) {
    showDialog(
      context: context,
      builder: (context) => AddLocationDialog(
        day: _selectedDay,
        onSubmit: (name, type, lat, lng, address) async {
          await controller.addLocation(
            day: _selectedDay,
            name: name,
            locationType: type.value,
            latitude: lat,
            longitude: lng,
            address: address,
          );
        },
      ),
    );
  }
}
