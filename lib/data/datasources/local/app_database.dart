import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

/// ============ Tables ============

class Trips extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get destination => text()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  TextColumn get description => text().nullable()();
  IntColumn get status => integer().withDefault(const Constant(0))(); // 0:plan, 1:going, 2:done
  IntColumn get totalBudget => integer().nullable()();
  IntColumn get actualSpent => integer().withDefault(const Constant(0))();
  BlobColumn get coverImageBytes => blob().nullable()(); // Phase 6 新增：旅程封面照
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get syncedToCloud => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class Locations extends Table {
  TextColumn get id => text()();
  TextColumn get tripId => text().references(Trips, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get locationType => text()(); // 'attraction', 'hotel', 'airport', 'station', 'service'
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  TextColumn get address => text().nullable()();
  TextColumn get notes => text().nullable()();
  IntColumn get dayNumber => integer()();
  IntColumn get sequenceInDay => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class LocationConnectors extends Table {
  TextColumn get id => text()();
  TextColumn get tripId => text().references(Trips, #id, onDelete: KeyAction.cascade)();
  TextColumn get fromLocationId => text().references(Locations, #id, onDelete: KeyAction.cascade)();
  TextColumn get toLocationId => text().references(Locations, #id, onDelete: KeyAction.cascade)();
  TextColumn get transportMode => text()(); // 'drive', 'taxi', 'walk', 'transit', 'flight'
  IntColumn get distanceKm => integer().nullable()();
  IntColumn get durationMinutes => integer().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class Moments extends Table {
  TextColumn get id => text()();
  TextColumn get tripId => text().references(Trips, #id, onDelete: KeyAction.cascade)();
  IntColumn get dayNumber => integer()();
  TextColumn get momentType => text()(); // 'photo', 'text', 'hybrid'
  TextColumn get textContent => text()();
  BlobColumn get imageBytes => blob().nullable()();
  TextColumn get locationTag => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  TextColumn get weather => text().nullable()();
  DateTimeColumn get recordedAt => dateTime()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus => text().withDefault(const Constant('local'))(); // 'local', 'syncing', 'synced'

  @override
  Set<Column> get primaryKey => {id};
}

class Expenses extends Table {
  TextColumn get id => text()();
  TextColumn get tripId => text().references(Trips, #id, onDelete: KeyAction.cascade)();
  IntColumn get dayNumber => integer()();
  TextColumn get name => text()();
  TextColumn get category => text()(); // 'food', 'transport', 'accommodation', 'tickets', 'shopping', 'other'
  IntColumn get amount => integer()();
  TextColumn get paymentMethod => text().nullable()();
  BlobColumn get receiptImageBytes => blob().nullable()();
  TextColumn get receiptOcrResult => text().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get recordedAt => dateTime()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus => text().withDefault(const Constant('local'))();

  @override
  Set<Column> get primaryKey => {id};
}

class Journals extends Table {
  TextColumn get id => text()();
  TextColumn get tripId => text().references(Trips, #id, onDelete: KeyAction.cascade)();
  TextColumn get title => text()();
  TextColumn get content => text()();
  TextColumn get style => text().withDefault(const Constant('default'))();
  DateTimeColumn get generatedAt => dateTime()();
  DateTimeColumn get lastEditedAt => dateTime()();
  TextColumn get exportFormats => text().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('local'))();

  @override
  Set<Column> get primaryKey => {id};
  @override
  List<Set<Column>> get uniqueKeys => [{tripId}];
}

class PackingChecklists extends Table {
  TextColumn get id => text()();
  TextColumn get tripId => text().references(Trips, #id, onDelete: KeyAction.cascade)();
  TextColumn get category => text()();
  TextColumn get itemName => text()();
  BoolColumn get isPacked => boolean().withDefault(const Constant(false))();
  IntColumn get sortOrder => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class SyncQueue extends Table {
  TextColumn get id => text()();
  TextColumn get entityType => text()();
  TextColumn get entityId => text()();
  TextColumn get action => text()();
  TextColumn get payload => text()();
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// ============ DAOs ============

@DriftAccessor(tables: [Trips])
class TripDao extends DatabaseAccessor<AppDatabase> with _$TripDaoMixin {
  TripDao(AppDatabase db) : super(db);

  Future<List<Trip>> getAllTrips() => select(trips).get();

  Future<Trip?> getTripById(String id) =>
      (select(trips)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<String> createTrip(TripsCompanion trip) async {
    final rowId = await into(trips).insert(trip);
    return trip.id.value;
  }

  Future<bool> updateTrip(TripsCompanion trip) => update(trips).replace(trip);

  Future<int> deleteTrip(String id) =>
      (delete(trips)..where((t) => t.id.equals(id))).go();

  Future<List<Trip>> getUnsyncedTrips() =>
      (select(trips)..where((t) => t.syncedToCloud.equals(false))).get();
}

@DriftAccessor(tables: [Locations, LocationConnectors])
class LocationDao extends DatabaseAccessor<AppDatabase> with _$LocationDaoMixin {
  LocationDao(AppDatabase db) : super(db);

  Future<List<Location>> getLocationsByTrip(String tripId) =>
      (select(locations)
            ..where((l) => l.tripId.equals(tripId))
            ..orderBy([(l) => OrderingTerm.asc(l.dayNumber), (l) => OrderingTerm.asc(l.sequenceInDay)]))
          .get();

  Future<Location?> getLocationById(String id) =>
      (select(locations)..where((l) => l.id.equals(id))).getSingleOrNull();

  Future<String> createLocation(LocationsCompanion location) async {
    await into(locations).insert(location);
    return location.id.value;
  }

  Future<bool> updateLocation(LocationsCompanion location) =>
      update(locations).replace(location);

  Future<int> deleteLocation(String id) =>
      (delete(locations)..where((l) => l.id.equals(id))).go();

  Future<void> reorderLocations(String tripId, int dayNumber, List<String> orderedIds) async {
    for (int i = 0; i < orderedIds.length; i++) {
      await (update(locations)..where((l) => l.id.equals(orderedIds[i]))).write(
        LocationsCompanion(sequenceInDay: Value(i)),
      );
    }
  }

  Future<LocationConnector?> getConnector(String fromId, String toId) =>
      (select(locationConnectors)
            ..where((c) => c.fromLocationId.equals(fromId) & c.toLocationId.equals(toId)))
          .getSingleOrNull();

  Future<String> createConnector(LocationConnectorsCompanion connector) async {
    await into(locationConnectors).insert(connector);
    return connector.id.value;
  }

  Future<bool> updateConnector(LocationConnectorsCompanion connector) =>
      update(locationConnectors).replace(connector);
}

@DriftAccessor(tables: [Moments])
class MomentDao extends DatabaseAccessor<AppDatabase> with _$MomentDaoMixin {
  MomentDao(AppDatabase db) : super(db);

  Future<List<Moment>> getMomentsByTrip(String tripId) =>
      (select(moments)
            ..where((m) => m.tripId.equals(tripId))
            ..orderBy([(m) => OrderingTerm.desc(m.recordedAt)]))
          .get();

  Future<List<Moment>> getMomentsByDay(String tripId, int dayNumber) =>
      (select(moments)
            ..where((m) => m.tripId.equals(tripId) & m.dayNumber.equals(dayNumber))
            ..orderBy([(m) => OrderingTerm.desc(m.recordedAt)]))
          .get();

  Future<String> createMoment(MomentsCompanion moment) async {
    await into(moments).insert(moment);
    return moment.id.value;
  }

  Future<bool> updateMoment(MomentsCompanion moment) =>
      update(moments).replace(moment);

  Future<int> deleteMoment(String id) =>
      (delete(moments)..where((m) => m.id.equals(id))).go();

  Future<List<Moment>> getUnsyncedMoments() =>
      (select(moments)..where((m) => m.syncStatus.equals('local'))).get();
}

@DriftAccessor(tables: [Expenses])
class ExpenseDao extends DatabaseAccessor<AppDatabase> with _$ExpenseDaoMixin {
  ExpenseDao(AppDatabase db) : super(db);

  Future<List<Expense>> getExpensesByTrip(String tripId) =>
      (select(expenses)
            ..where((e) => e.tripId.equals(tripId))
            ..orderBy([(e) => OrderingTerm.desc(e.recordedAt)]))
          .get();

  Future<List<Expense>> getExpensesByDay(String tripId, int dayNumber) =>
      (select(expenses)
            ..where((e) => e.tripId.equals(tripId) & e.dayNumber.equals(dayNumber))
            ..orderBy([(e) => OrderingTerm.desc(e.recordedAt)]))
          .get();

  Future<int> getTotalExpense(String tripId) async {
    final result = await (select(expenses)..where((e) => e.tripId.equals(tripId)))
        .map((e) => e.amount)
        .get();
    return result.fold<int>(0, (sum, val) => sum + val);
  }

  Future<String> createExpense(ExpensesCompanion expense) async {
    await into(expenses).insert(expense);
    return expense.id.value;
  }

  Future<bool> updateExpense(ExpensesCompanion expense) =>
      update(expenses).replace(expense);

  Future<int> deleteExpense(String id) =>
      (delete(expenses)..where((e) => e.id.equals(id))).go();
}

/// Phase 2 新增：物品清单 DAO
@DriftAccessor(tables: [PackingChecklists])
class PackingDao extends DatabaseAccessor<AppDatabase> with _$PackingDaoMixin {
  PackingDao(AppDatabase db) : super(db);

  Future<List<PackingChecklist>> getByTrip(String tripId) => (select(packingChecklists)
        ..where((p) => p.tripId.equals(tripId))
        ..orderBy([(p) => OrderingTerm.asc(p.sortOrder)]))
      .get();

  Future<int> createItem(PackingChecklistsCompanion item) =>
      into(packingChecklists).insert(item);

  Future<int> updateItem(PackingChecklistsCompanion item) =>
      update(packingChecklists).replace(item).then((_) => 1);

  Future<int> deleteItem(String id) =>
      (delete(packingChecklists)..where((p) => p.id.equals(id))).go();

  Future<bool> togglePacked(String id, bool packed) async {
    final row = await (select(packingChecklists)..where((p) => p.id.equals(id)))
        .getSingleOrNull();
    if (row == null) return false;
    return update(packingChecklists).replace(row.copyWith(isPacked: packed)).then((_) => true);
  }
}

@DriftAccessor(tables: [Journals])
class JournalDao extends DatabaseAccessor<AppDatabase> with _$JournalDaoMixin {
  JournalDao(AppDatabase db) : super(db);

  Future<Journal?> getByTrip(String tripId) =>
      (select(journals)..where((j) => j.tripId.equals(tripId))).getSingleOrNull();

  Future<void> upsert(JournalsCompanion journal) async {
    final existing = await getByTrip(journal.tripId.value);
    if (existing == null) {
      await into(journals).insert(journal);
    } else {
      await (update(journals)..where((j) => j.tripId.equals(journal.tripId.value))).write(journal);
    }
  }

  Future<bool> deleteByTrip(String tripId) =>
      (delete(journals)..where((j) => j.tripId.equals(tripId))).go().then((n) => n > 0);
}

/// ============ Database ============

@DriftDatabase(
  tables: [Trips, Locations, LocationConnectors, Moments, Expenses, Journals, PackingChecklists, SyncQueue],
  daos: [TripDao, LocationDao, MomentDao, ExpenseDao, PackingDao, JournalDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor executor) : super(executor);

  // Phase 6：schemaVersion 从 1 升到 2，新增 Trips.coverImageBytes 字段
  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.addColumn(trips, trips.coverImageBytes);
          }
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'lvji.db'));
    return NativeDatabase(file);
  });
}
