import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers.dart';
import '../../../../core/constants/strings.dart';
import 'plan_tab/plan_screen.dart';
import 'moments_tab/moments_screen.dart';
import 'journal_tab/journal_screen.dart';

class TripDetailScreen extends ConsumerStatefulWidget {
  final String tripId;

  const TripDetailScreen({required this.tripId, Key? key}) : super(key: key);

  @override
  ConsumerState<TripDetailScreen> createState() => _TripDetailScreenState();
}

class _TripDetailScreenState extends ConsumerState<TripDetailScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final trip = ref.watch(tripDetailProvider(widget.tripId));
    return Scaffold(
      appBar: AppBar(title: Text(trip.when(data: (t) => t?.title ?? '', loading: () => '', error: (_, __) => ''))),
      body: trip.when(
        data: (tripData) {
          if (tripData == null) return const Center(child: Text('行程不存在'));
          return IndexedStack(
            index: _currentIndex,
            children: [
              PlanScreen(tripId: widget.tripId, trip: tripData),
              MomentsScreen(tripId: widget.tripId, trip: tripData),
              JournalScreen(tripId: widget.tripId, trip: tripData),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: Text('加载失败')),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.map_outlined), selectedIcon: Icon(Icons.map), label: '行程'),
          NavigationDestination(icon: Icon(Icons.photo_library_outlined), selectedIcon: Icon(Icons.photo_library), label: '随记'),
          NavigationDestination(icon: Icon(Icons.book_outlined), selectedIcon: Icon(Icons.book), label: '后记'),
        ],
      ),
    );
  }
}
