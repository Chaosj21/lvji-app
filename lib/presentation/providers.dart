import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;
import 'package:drift/drift.dart' show LazyDatabase;
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import '../data/datasources/local/app_database.dart';

// ============ Database Provider ============
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase(LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    return NativeDatabase(File('${dir.path}/lvji.db'));
  }));
});

// ============ DAO Providers ============
final tripDaoProvider = Provider<TripDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.tripDao;
});

final locationDaoProvider = Provider<LocationDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.locationDao;
});

final momentDaoProvider = Provider<MomentDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.momentDao;
});

final expenseDaoProvider = Provider<ExpenseDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.expenseDao;
});

// ============ Auth State ============
final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthState {
  final bool isLoggedIn;
  final String? userId;
  final String? email;

  AuthState({
    this.isLoggedIn = false,
    this.userId,
    this.email,
  });

  AuthState copyWith({
    bool? isLoggedIn,
    String? userId,
    String? email,
  }) {
    return AuthState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      userId: userId ?? this.userId,
      email: email ?? this.email,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(
      isLoggedIn: true,
      userId: 'user_${DateTime.now().millisecondsSinceEpoch}',
      email: email,
    );
  }

  Future<void> register(String email, String password, String name) async {
    state = state.copyWith(
      isLoggedIn: true,
      userId: 'user_${DateTime.now().millisecondsSinceEpoch}',
      email: email,
    );
  }

  void logout() {
    state = AuthState();
  }
}

// ============ Trip List Provider ============
final tripListProvider = FutureProvider<List<Trip>>((ref) async {
  final tripDao = ref.watch(tripDaoProvider);
  return tripDao.getAllTrips();
});

// ============ Single Trip Provider ============
final tripDetailProvider = FutureProvider.family<Trip?, String>((ref, tripId) async {
  final tripDao = ref.watch(tripDaoProvider);
  return tripDao.getTripById(tripId);
});

// ============ Trip Creation Form State ============
final newTripFormProvider = StateNotifierProvider<NewTripFormNotifier, NewTripFormState>((ref) {
  return NewTripFormNotifier(ref);
});

class NewTripFormState {
  final String title;
  final String destination;
  final DateTime? startDate;
  final DateTime? endDate;
  final String description;
  final int? totalBudget;
  final Uint8List? coverImageBytes; // ✨ Phase 6 新增
  final bool isSubmitting;
  final String? error;

  NewTripFormState({
    this.title = '',
    this.destination = '',
    this.startDate,
    this.endDate,
    this.description = '',
    this.totalBudget,
    this.coverImageBytes,
    this.isSubmitting = false,
    this.error,
  });

  NewTripFormState copyWith({
    String? title,
    String? destination,
    DateTime? startDate,
    DateTime? endDate,
    String? description,
    int? totalBudget,
    Uint8List? coverImageBytes,
    bool? isSubmitting,
    String? error,
  }) {
    return NewTripFormState(
      title: title ?? this.title,
      destination: destination ?? this.destination,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      description: description ?? this.description,
      totalBudget: totalBudget ?? this.totalBudget,
      coverImageBytes: coverImageBytes ?? this.coverImageBytes,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: error,
    );
  }

  bool get isValid => title.isNotEmpty && destination.isNotEmpty && startDate != null && endDate != null;
}

class NewTripFormNotifier extends StateNotifier<NewTripFormState> {
  final Ref ref;

  NewTripFormNotifier(this.ref) : super(NewTripFormState());

  void setTitle(String title) => state = state.copyWith(title: title, error: null);
  void setDestination(String destination) => state = state.copyWith(destination: destination, error: null);
  void setStartDate(DateTime date) => state = state.copyWith(startDate: date, error: null);
  void setEndDate(DateTime date) => state = state.copyWith(endDate: date, error: null);
  void setDescription(String desc) => state = state.copyWith(description: desc, error: null);
  void setTotalBudget(int? budget) => state = state.copyWith(totalBudget: budget, error: null);
  void setCoverImage(Uint8List? bytes) => state = state.copyWith(coverImageBytes: bytes, error: null);

  Future<bool> submit() async {
    if (!state.isValid) {
      state = state.copyWith(error: '请填写所有必填项');
      return false;
    }

    state = state.copyWith(isSubmitting: true);

    try {
      final tripDao = ref.read(tripDaoProvider);
      final tripId = 'trip_${DateTime.now().millisecondsSinceEpoch}';

      await tripDao.createTrip(TripsCompanion(
        id: Value(tripId),
        title: Value(state.title),
        destination: Value(state.destination),
        startDate: Value(state.startDate!),
        endDate: Value(state.endDate!),
        description: state.description.isEmpty ? const Value.absent() : Value(state.description),
        totalBudget: state.totalBudget != null ? Value(state.totalBudget!) : const Value.absent(),
        coverImageBytes: Value(state.coverImageBytes),
        status: const Value(0), // plan
      ));

      state = NewTripFormState();
      return true;
    } catch (e) {
      state = state.copyWith(error: '创建旅程失败: $e');
      return false;
    } finally {
      state = state.copyWith(isSubmitting: false);
    }
  }

  void reset() {
    state = NewTripFormState();
  }
}
