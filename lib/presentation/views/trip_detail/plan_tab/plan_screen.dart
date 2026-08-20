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

class PlanScreen extends ConsumerStatefulWidget {
  final String tripId;
  final Trip trip;

  const PlanScreen({required this.tripId, required this.trip, Key? key}) : super(key: key);

  @override
  ConsumerState<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends ConsumerState<PlanScreen> {
  late int _selectedDay;
  late int _totalDays;

  @override
  void initState() {
    super.initState();
    _totalDays = widget.trip.endDate.difference(widget.trip.startDate).inDays + 1;
    if (_totalDays < 1) _totalDays = 1;
    _selectedDay = _currentDayNumber().clamp(1, _totalDays);
  }

  /// 根据当前日期粗略判断"今天是第几天"，用于默认打开对应天数（对应此前"根据当前日期自动定位"的需求）
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
              // 天数切换
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _totalDays,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final day = index + 1;
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

              // 地点列表（可拖拽排序）
              _buildLocationList(context, locationsState, locationsController),

              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () => _showAddLocationDialog(context, locationsController),
                icon: const Icon(Icons.add_location_alt_outlined, size: 18),
                label: const Text('添加地点'),
              ),

              const SizedBox(height: 24),
              _buildAiSuggestionCard(context),

              const SizedBox(height: 24),
              Text('物品清单', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              PackingChecklistWidget(tripId: widget.tripId, state: packingState),
            ],
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
            '接入 Claude API 后，这里会自动分析行程密度、驾驶时长、天气等给出建议。'
            '当前 Phase 2 阶段先占位，具体接入方式见架构文档「AI 调用架构」一节。',
            style: TextStyle(color: Color(0xFFD9D2C1), fontSize: 12.5, height: 1.5),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _generateAiDraft(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD9A94C),
                foregroundColor: const Color(0xFF1B2A38),
              ),
              icon: const Icon(Icons.auto_awesome, size: 16),
              label: const Text('生成行程建议'),
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
      Navigator.pop(context); // 关闭 loading
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
