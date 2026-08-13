import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
                  Icon(Icons.map_outlined, size: 56, color: Theme.of(context).colorScheme.primary.withOpacity(.4)),
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
            itemBuilder: (context, index) {
              final trip = trips[index];
              return _TripCard(trip: trip);
            },
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

class _TripCard extends StatelessWidget {
  final Trip trip;
  const _TripCard({required this.trip});

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

  @override
  Widget build(BuildContext context) {
    final dateFmt = DateFormat('MM.dd');
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => context.push('/trip/${trip.id}'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: _statusColor(context).withOpacity(.12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            _statusLabel,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: _statusColor(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(trip.title, style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 4),
                    Text(trip.destination, style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 6),
                    Text(
                      '${dateFmt.format(trip.startDate)} - ${dateFmt.format(trip.endDate)}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
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

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(newTripFormProvider);
    final dateFmt = DateFormat('yyyy.MM.dd');

    return AlertDialog(
      title: const Text(AppStrings.createTrip),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: AppStrings.tripName),
              onChanged: (value) => ref.read(newTripFormProvider.notifier).setTitle(value),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: AppStrings.tripDestination),
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
                  style: TextStyle(
                    color: _start != null ? null : Theme.of(context).hintColor,
                  ),
                ),
              ),
            ),
            if (formState.error != null) ...[
              const SizedBox(height: 12),
              Text(
                formState.error!,
                style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 13),
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(AppStrings.cancel),
        ),
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
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                )
              : const Text(AppStrings.create),
        ),
      ],
    );
  }
}
