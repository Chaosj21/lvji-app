// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
mixin _$TripDaoMixin on DatabaseAccessor<AppDatabase> {
  $TripsTable get trips => attachedDatabase.trips;
  TripDaoManager get managers => TripDaoManager(this);
}

class TripDaoManager {
  final _$TripDaoMixin _db;
  TripDaoManager(this._db);
  $$TripsTableTableManager get trips =>
      $$TripsTableTableManager(_db.attachedDatabase, _db.trips);
}

mixin _$LocationDaoMixin on DatabaseAccessor<AppDatabase> {
  $TripsTable get trips => attachedDatabase.trips;
  $LocationsTable get locations => attachedDatabase.locations;
  $LocationConnectorsTable get locationConnectors =>
      attachedDatabase.locationConnectors;
  LocationDaoManager get managers => LocationDaoManager(this);
}

class LocationDaoManager {
  final _$LocationDaoMixin _db;
  LocationDaoManager(this._db);
  $$TripsTableTableManager get trips =>
      $$TripsTableTableManager(_db.attachedDatabase, _db.trips);
  $$LocationsTableTableManager get locations =>
      $$LocationsTableTableManager(_db.attachedDatabase, _db.locations);
  $$LocationConnectorsTableTableManager get locationConnectors =>
      $$LocationConnectorsTableTableManager(
          _db.attachedDatabase, _db.locationConnectors);
}

mixin _$MomentDaoMixin on DatabaseAccessor<AppDatabase> {
  $TripsTable get trips => attachedDatabase.trips;
  $MomentsTable get moments => attachedDatabase.moments;
  MomentDaoManager get managers => MomentDaoManager(this);
}

class MomentDaoManager {
  final _$MomentDaoMixin _db;
  MomentDaoManager(this._db);
  $$TripsTableTableManager get trips =>
      $$TripsTableTableManager(_db.attachedDatabase, _db.trips);
  $$MomentsTableTableManager get moments =>
      $$MomentsTableTableManager(_db.attachedDatabase, _db.moments);
}

mixin _$ExpenseDaoMixin on DatabaseAccessor<AppDatabase> {
  $TripsTable get trips => attachedDatabase.trips;
  $ExpensesTable get expenses => attachedDatabase.expenses;
  ExpenseDaoManager get managers => ExpenseDaoManager(this);
}

class ExpenseDaoManager {
  final _$ExpenseDaoMixin _db;
  ExpenseDaoManager(this._db);
  $$TripsTableTableManager get trips =>
      $$TripsTableTableManager(_db.attachedDatabase, _db.trips);
  $$ExpensesTableTableManager get expenses =>
      $$ExpensesTableTableManager(_db.attachedDatabase, _db.expenses);
}

mixin _$PackingDaoMixin on DatabaseAccessor<AppDatabase> {
  $TripsTable get trips => attachedDatabase.trips;
  $PackingChecklistsTable get packingChecklists =>
      attachedDatabase.packingChecklists;
  PackingDaoManager get managers => PackingDaoManager(this);
}

class PackingDaoManager {
  final _$PackingDaoMixin _db;
  PackingDaoManager(this._db);
  $$TripsTableTableManager get trips =>
      $$TripsTableTableManager(_db.attachedDatabase, _db.trips);
  $$PackingChecklistsTableTableManager get packingChecklists =>
      $$PackingChecklistsTableTableManager(
          _db.attachedDatabase, _db.packingChecklists);
}

mixin _$JournalDaoMixin on DatabaseAccessor<AppDatabase> {
  $TripsTable get trips => attachedDatabase.trips;
  $JournalsTable get journals => attachedDatabase.journals;
  JournalDaoManager get managers => JournalDaoManager(this);
}

class JournalDaoManager {
  final _$JournalDaoMixin _db;
  JournalDaoManager(this._db);
  $$TripsTableTableManager get trips =>
      $$TripsTableTableManager(_db.attachedDatabase, _db.trips);
  $$JournalsTableTableManager get journals =>
      $$JournalsTableTableManager(_db.attachedDatabase, _db.journals);
}

class $TripsTable extends Trips with TableInfo<$TripsTable, Trip> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TripsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _destinationMeta =
      const VerificationMeta('destination');
  @override
  late final GeneratedColumn<String> destination = GeneratedColumn<String>(
      'destination', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _totalBudgetMeta =
      const VerificationMeta('totalBudget');
  @override
  late final GeneratedColumn<int> totalBudget = GeneratedColumn<int>(
      'total_budget', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _actualSpentMeta =
      const VerificationMeta('actualSpent');
  @override
  late final GeneratedColumn<int> actualSpent = GeneratedColumn<int>(
      'actual_spent', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _syncedToCloudMeta =
      const VerificationMeta('syncedToCloud');
  @override
  late final GeneratedColumn<bool> syncedToCloud = GeneratedColumn<bool>(
      'synced_to_cloud', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("synced_to_cloud" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        destination,
        startDate,
        endDate,
        description,
        status,
        totalBudget,
        actualSpent,
        createdAt,
        updatedAt,
        syncedToCloud
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trips';
  @override
  VerificationContext validateIntegrity(Insertable<Trip> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('destination')) {
      context.handle(
          _destinationMeta,
          destination.isAcceptableOrUnknown(
              data['destination']!, _destinationMeta));
    } else if (isInserting) {
      context.missing(_destinationMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('total_budget')) {
      context.handle(
          _totalBudgetMeta,
          totalBudget.isAcceptableOrUnknown(
              data['total_budget']!, _totalBudgetMeta));
    }
    if (data.containsKey('actual_spent')) {
      context.handle(
          _actualSpentMeta,
          actualSpent.isAcceptableOrUnknown(
              data['actual_spent']!, _actualSpentMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('synced_to_cloud')) {
      context.handle(
          _syncedToCloudMeta,
          syncedToCloud.isAcceptableOrUnknown(
              data['synced_to_cloud']!, _syncedToCloudMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Trip map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Trip(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      destination: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}destination'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!,
      totalBudget: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_budget']),
      actualSpent: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}actual_spent'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      syncedToCloud: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced_to_cloud'])!,
    );
  }

  @override
  $TripsTable createAlias(String alias) {
    return $TripsTable(attachedDatabase, alias);
  }
}

class Trip extends DataClass implements Insertable<Trip> {
  final String id;
  final String title;
  final String destination;
  final DateTime startDate;
  final DateTime endDate;
  final String? description;
  final int status;
  final int? totalBudget;
  final int actualSpent;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool syncedToCloud;
  const Trip(
      {required this.id,
      required this.title,
      required this.destination,
      required this.startDate,
      required this.endDate,
      this.description,
      required this.status,
      this.totalBudget,
      required this.actualSpent,
      required this.createdAt,
      required this.updatedAt,
      required this.syncedToCloud});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['destination'] = Variable<String>(destination);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || totalBudget != null) {
      map['total_budget'] = Variable<int>(totalBudget);
    }
    map['actual_spent'] = Variable<int>(actualSpent);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synced_to_cloud'] = Variable<bool>(syncedToCloud);
    return map;
  }

  TripsCompanion toCompanion(bool nullToAbsent) {
    return TripsCompanion(
      id: Value(id),
      title: Value(title),
      destination: Value(destination),
      startDate: Value(startDate),
      endDate: Value(endDate),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      status: Value(status),
      totalBudget: totalBudget == null && nullToAbsent
          ? const Value.absent()
          : Value(totalBudget),
      actualSpent: Value(actualSpent),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncedToCloud: Value(syncedToCloud),
    );
  }

  factory Trip.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Trip(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      destination: serializer.fromJson<String>(json['destination']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      description: serializer.fromJson<String?>(json['description']),
      status: serializer.fromJson<int>(json['status']),
      totalBudget: serializer.fromJson<int?>(json['totalBudget']),
      actualSpent: serializer.fromJson<int>(json['actualSpent']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncedToCloud: serializer.fromJson<bool>(json['syncedToCloud']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'destination': serializer.toJson<String>(destination),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'description': serializer.toJson<String?>(description),
      'status': serializer.toJson<int>(status),
      'totalBudget': serializer.toJson<int?>(totalBudget),
      'actualSpent': serializer.toJson<int>(actualSpent),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncedToCloud': serializer.toJson<bool>(syncedToCloud),
    };
  }

  Trip copyWith(
          {String? id,
          String? title,
          String? destination,
          DateTime? startDate,
          DateTime? endDate,
          Value<String?> description = const Value.absent(),
          int? status,
          Value<int?> totalBudget = const Value.absent(),
          int? actualSpent,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? syncedToCloud}) =>
      Trip(
        id: id ?? this.id,
        title: title ?? this.title,
        destination: destination ?? this.destination,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        description: description.present ? description.value : this.description,
        status: status ?? this.status,
        totalBudget: totalBudget.present ? totalBudget.value : this.totalBudget,
        actualSpent: actualSpent ?? this.actualSpent,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        syncedToCloud: syncedToCloud ?? this.syncedToCloud,
      );
  Trip copyWithCompanion(TripsCompanion data) {
    return Trip(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      destination:
          data.destination.present ? data.destination.value : this.destination,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      description:
          data.description.present ? data.description.value : this.description,
      status: data.status.present ? data.status.value : this.status,
      totalBudget:
          data.totalBudget.present ? data.totalBudget.value : this.totalBudget,
      actualSpent:
          data.actualSpent.present ? data.actualSpent.value : this.actualSpent,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncedToCloud: data.syncedToCloud.present
          ? data.syncedToCloud.value
          : this.syncedToCloud,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Trip(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('destination: $destination, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('totalBudget: $totalBudget, ')
          ..write('actualSpent: $actualSpent, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncedToCloud: $syncedToCloud')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      title,
      destination,
      startDate,
      endDate,
      description,
      status,
      totalBudget,
      actualSpent,
      createdAt,
      updatedAt,
      syncedToCloud);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Trip &&
          other.id == this.id &&
          other.title == this.title &&
          other.destination == this.destination &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.description == this.description &&
          other.status == this.status &&
          other.totalBudget == this.totalBudget &&
          other.actualSpent == this.actualSpent &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncedToCloud == this.syncedToCloud);
}

class TripsCompanion extends UpdateCompanion<Trip> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> destination;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<String?> description;
  final Value<int> status;
  final Value<int?> totalBudget;
  final Value<int> actualSpent;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> syncedToCloud;
  final Value<int> rowid;
  const TripsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.destination = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.totalBudget = const Value.absent(),
    this.actualSpent = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncedToCloud = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TripsCompanion.insert({
    required String id,
    required String title,
    required String destination,
    required DateTime startDate,
    required DateTime endDate,
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.totalBudget = const Value.absent(),
    this.actualSpent = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncedToCloud = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        destination = Value(destination),
        startDate = Value(startDate),
        endDate = Value(endDate);
  static Insertable<Trip> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? destination,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? description,
    Expression<int>? status,
    Expression<int>? totalBudget,
    Expression<int>? actualSpent,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? syncedToCloud,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (destination != null) 'destination': destination,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (description != null) 'description': description,
      if (status != null) 'status': status,
      if (totalBudget != null) 'total_budget': totalBudget,
      if (actualSpent != null) 'actual_spent': actualSpent,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncedToCloud != null) 'synced_to_cloud': syncedToCloud,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TripsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? destination,
      Value<DateTime>? startDate,
      Value<DateTime>? endDate,
      Value<String?>? description,
      Value<int>? status,
      Value<int?>? totalBudget,
      Value<int>? actualSpent,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? syncedToCloud,
      Value<int>? rowid}) {
    return TripsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      destination: destination ?? this.destination,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      description: description ?? this.description,
      status: status ?? this.status,
      totalBudget: totalBudget ?? this.totalBudget,
      actualSpent: actualSpent ?? this.actualSpent,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncedToCloud: syncedToCloud ?? this.syncedToCloud,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (destination.present) {
      map['destination'] = Variable<String>(destination.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (totalBudget.present) {
      map['total_budget'] = Variable<int>(totalBudget.value);
    }
    if (actualSpent.present) {
      map['actual_spent'] = Variable<int>(actualSpent.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncedToCloud.present) {
      map['synced_to_cloud'] = Variable<bool>(syncedToCloud.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TripsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('destination: $destination, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('totalBudget: $totalBudget, ')
          ..write('actualSpent: $actualSpent, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncedToCloud: $syncedToCloud, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocationsTable extends Locations
    with TableInfo<$LocationsTable, Location> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tripIdMeta = const VerificationMeta('tripId');
  @override
  late final GeneratedColumn<String> tripId = GeneratedColumn<String>(
      'trip_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES trips (id) ON DELETE CASCADE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationTypeMeta =
      const VerificationMeta('locationType');
  @override
  late final GeneratedColumn<String> locationType = GeneratedColumn<String>(
      'location_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dayNumberMeta =
      const VerificationMeta('dayNumber');
  @override
  late final GeneratedColumn<int> dayNumber = GeneratedColumn<int>(
      'day_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sequenceInDayMeta =
      const VerificationMeta('sequenceInDay');
  @override
  late final GeneratedColumn<int> sequenceInDay = GeneratedColumn<int>(
      'sequence_in_day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        tripId,
        name,
        locationType,
        latitude,
        longitude,
        address,
        notes,
        dayNumber,
        sequenceInDay,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'locations';
  @override
  VerificationContext validateIntegrity(Insertable<Location> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('trip_id')) {
      context.handle(_tripIdMeta,
          tripId.isAcceptableOrUnknown(data['trip_id']!, _tripIdMeta));
    } else if (isInserting) {
      context.missing(_tripIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('location_type')) {
      context.handle(
          _locationTypeMeta,
          locationType.isAcceptableOrUnknown(
              data['location_type']!, _locationTypeMeta));
    } else if (isInserting) {
      context.missing(_locationTypeMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('day_number')) {
      context.handle(_dayNumberMeta,
          dayNumber.isAcceptableOrUnknown(data['day_number']!, _dayNumberMeta));
    } else if (isInserting) {
      context.missing(_dayNumberMeta);
    }
    if (data.containsKey('sequence_in_day')) {
      context.handle(
          _sequenceInDayMeta,
          sequenceInDay.isAcceptableOrUnknown(
              data['sequence_in_day']!, _sequenceInDayMeta));
    } else if (isInserting) {
      context.missing(_sequenceInDayMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Location map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Location(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      tripId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trip_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      locationType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_type'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      dayNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_number'])!,
      sequenceInDay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sequence_in_day'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $LocationsTable createAlias(String alias) {
    return $LocationsTable(attachedDatabase, alias);
  }
}

class Location extends DataClass implements Insertable<Location> {
  final String id;
  final String tripId;
  final String name;
  final String locationType;
  final double latitude;
  final double longitude;
  final String? address;
  final String? notes;
  final int dayNumber;
  final int sequenceInDay;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Location(
      {required this.id,
      required this.tripId,
      required this.name,
      required this.locationType,
      required this.latitude,
      required this.longitude,
      this.address,
      this.notes,
      required this.dayNumber,
      required this.sequenceInDay,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['trip_id'] = Variable<String>(tripId);
    map['name'] = Variable<String>(name);
    map['location_type'] = Variable<String>(locationType);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['day_number'] = Variable<int>(dayNumber);
    map['sequence_in_day'] = Variable<int>(sequenceInDay);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  LocationsCompanion toCompanion(bool nullToAbsent) {
    return LocationsCompanion(
      id: Value(id),
      tripId: Value(tripId),
      name: Value(name),
      locationType: Value(locationType),
      latitude: Value(latitude),
      longitude: Value(longitude),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      dayNumber: Value(dayNumber),
      sequenceInDay: Value(sequenceInDay),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Location.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Location(
      id: serializer.fromJson<String>(json['id']),
      tripId: serializer.fromJson<String>(json['tripId']),
      name: serializer.fromJson<String>(json['name']),
      locationType: serializer.fromJson<String>(json['locationType']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      address: serializer.fromJson<String?>(json['address']),
      notes: serializer.fromJson<String?>(json['notes']),
      dayNumber: serializer.fromJson<int>(json['dayNumber']),
      sequenceInDay: serializer.fromJson<int>(json['sequenceInDay']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'tripId': serializer.toJson<String>(tripId),
      'name': serializer.toJson<String>(name),
      'locationType': serializer.toJson<String>(locationType),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'address': serializer.toJson<String?>(address),
      'notes': serializer.toJson<String?>(notes),
      'dayNumber': serializer.toJson<int>(dayNumber),
      'sequenceInDay': serializer.toJson<int>(sequenceInDay),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Location copyWith(
          {String? id,
          String? tripId,
          String? name,
          String? locationType,
          double? latitude,
          double? longitude,
          Value<String?> address = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          int? dayNumber,
          int? sequenceInDay,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Location(
        id: id ?? this.id,
        tripId: tripId ?? this.tripId,
        name: name ?? this.name,
        locationType: locationType ?? this.locationType,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        address: address.present ? address.value : this.address,
        notes: notes.present ? notes.value : this.notes,
        dayNumber: dayNumber ?? this.dayNumber,
        sequenceInDay: sequenceInDay ?? this.sequenceInDay,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Location copyWithCompanion(LocationsCompanion data) {
    return Location(
      id: data.id.present ? data.id.value : this.id,
      tripId: data.tripId.present ? data.tripId.value : this.tripId,
      name: data.name.present ? data.name.value : this.name,
      locationType: data.locationType.present
          ? data.locationType.value
          : this.locationType,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      address: data.address.present ? data.address.value : this.address,
      notes: data.notes.present ? data.notes.value : this.notes,
      dayNumber: data.dayNumber.present ? data.dayNumber.value : this.dayNumber,
      sequenceInDay: data.sequenceInDay.present
          ? data.sequenceInDay.value
          : this.sequenceInDay,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Location(')
          ..write('id: $id, ')
          ..write('tripId: $tripId, ')
          ..write('name: $name, ')
          ..write('locationType: $locationType, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('address: $address, ')
          ..write('notes: $notes, ')
          ..write('dayNumber: $dayNumber, ')
          ..write('sequenceInDay: $sequenceInDay, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      tripId,
      name,
      locationType,
      latitude,
      longitude,
      address,
      notes,
      dayNumber,
      sequenceInDay,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Location &&
          other.id == this.id &&
          other.tripId == this.tripId &&
          other.name == this.name &&
          other.locationType == this.locationType &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.address == this.address &&
          other.notes == this.notes &&
          other.dayNumber == this.dayNumber &&
          other.sequenceInDay == this.sequenceInDay &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class LocationsCompanion extends UpdateCompanion<Location> {
  final Value<String> id;
  final Value<String> tripId;
  final Value<String> name;
  final Value<String> locationType;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String?> address;
  final Value<String?> notes;
  final Value<int> dayNumber;
  final Value<int> sequenceInDay;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const LocationsCompanion({
    this.id = const Value.absent(),
    this.tripId = const Value.absent(),
    this.name = const Value.absent(),
    this.locationType = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.address = const Value.absent(),
    this.notes = const Value.absent(),
    this.dayNumber = const Value.absent(),
    this.sequenceInDay = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocationsCompanion.insert({
    required String id,
    required String tripId,
    required String name,
    required String locationType,
    required double latitude,
    required double longitude,
    this.address = const Value.absent(),
    this.notes = const Value.absent(),
    required int dayNumber,
    required int sequenceInDay,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        tripId = Value(tripId),
        name = Value(name),
        locationType = Value(locationType),
        latitude = Value(latitude),
        longitude = Value(longitude),
        dayNumber = Value(dayNumber),
        sequenceInDay = Value(sequenceInDay);
  static Insertable<Location> custom({
    Expression<String>? id,
    Expression<String>? tripId,
    Expression<String>? name,
    Expression<String>? locationType,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? address,
    Expression<String>? notes,
    Expression<int>? dayNumber,
    Expression<int>? sequenceInDay,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tripId != null) 'trip_id': tripId,
      if (name != null) 'name': name,
      if (locationType != null) 'location_type': locationType,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (address != null) 'address': address,
      if (notes != null) 'notes': notes,
      if (dayNumber != null) 'day_number': dayNumber,
      if (sequenceInDay != null) 'sequence_in_day': sequenceInDay,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocationsCompanion copyWith(
      {Value<String>? id,
      Value<String>? tripId,
      Value<String>? name,
      Value<String>? locationType,
      Value<double>? latitude,
      Value<double>? longitude,
      Value<String?>? address,
      Value<String?>? notes,
      Value<int>? dayNumber,
      Value<int>? sequenceInDay,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return LocationsCompanion(
      id: id ?? this.id,
      tripId: tripId ?? this.tripId,
      name: name ?? this.name,
      locationType: locationType ?? this.locationType,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      notes: notes ?? this.notes,
      dayNumber: dayNumber ?? this.dayNumber,
      sequenceInDay: sequenceInDay ?? this.sequenceInDay,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (tripId.present) {
      map['trip_id'] = Variable<String>(tripId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (locationType.present) {
      map['location_type'] = Variable<String>(locationType.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (dayNumber.present) {
      map['day_number'] = Variable<int>(dayNumber.value);
    }
    if (sequenceInDay.present) {
      map['sequence_in_day'] = Variable<int>(sequenceInDay.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationsCompanion(')
          ..write('id: $id, ')
          ..write('tripId: $tripId, ')
          ..write('name: $name, ')
          ..write('locationType: $locationType, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('address: $address, ')
          ..write('notes: $notes, ')
          ..write('dayNumber: $dayNumber, ')
          ..write('sequenceInDay: $sequenceInDay, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocationConnectorsTable extends LocationConnectors
    with TableInfo<$LocationConnectorsTable, LocationConnector> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationConnectorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tripIdMeta = const VerificationMeta('tripId');
  @override
  late final GeneratedColumn<String> tripId = GeneratedColumn<String>(
      'trip_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES trips (id) ON DELETE CASCADE'));
  static const VerificationMeta _fromLocationIdMeta =
      const VerificationMeta('fromLocationId');
  @override
  late final GeneratedColumn<String> fromLocationId = GeneratedColumn<String>(
      'from_location_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES locations (id) ON DELETE CASCADE'));
  static const VerificationMeta _toLocationIdMeta =
      const VerificationMeta('toLocationId');
  @override
  late final GeneratedColumn<String> toLocationId = GeneratedColumn<String>(
      'to_location_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES locations (id) ON DELETE CASCADE'));
  static const VerificationMeta _transportModeMeta =
      const VerificationMeta('transportMode');
  @override
  late final GeneratedColumn<String> transportMode = GeneratedColumn<String>(
      'transport_mode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _distanceKmMeta =
      const VerificationMeta('distanceKm');
  @override
  late final GeneratedColumn<int> distanceKm = GeneratedColumn<int>(
      'distance_km', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _durationMinutesMeta =
      const VerificationMeta('durationMinutes');
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
      'duration_minutes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        tripId,
        fromLocationId,
        toLocationId,
        transportMode,
        distanceKm,
        durationMinutes,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'location_connectors';
  @override
  VerificationContext validateIntegrity(Insertable<LocationConnector> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('trip_id')) {
      context.handle(_tripIdMeta,
          tripId.isAcceptableOrUnknown(data['trip_id']!, _tripIdMeta));
    } else if (isInserting) {
      context.missing(_tripIdMeta);
    }
    if (data.containsKey('from_location_id')) {
      context.handle(
          _fromLocationIdMeta,
          fromLocationId.isAcceptableOrUnknown(
              data['from_location_id']!, _fromLocationIdMeta));
    } else if (isInserting) {
      context.missing(_fromLocationIdMeta);
    }
    if (data.containsKey('to_location_id')) {
      context.handle(
          _toLocationIdMeta,
          toLocationId.isAcceptableOrUnknown(
              data['to_location_id']!, _toLocationIdMeta));
    } else if (isInserting) {
      context.missing(_toLocationIdMeta);
    }
    if (data.containsKey('transport_mode')) {
      context.handle(
          _transportModeMeta,
          transportMode.isAcceptableOrUnknown(
              data['transport_mode']!, _transportModeMeta));
    } else if (isInserting) {
      context.missing(_transportModeMeta);
    }
    if (data.containsKey('distance_km')) {
      context.handle(
          _distanceKmMeta,
          distanceKm.isAcceptableOrUnknown(
              data['distance_km']!, _distanceKmMeta));
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
          _durationMinutesMeta,
          durationMinutes.isAcceptableOrUnknown(
              data['duration_minutes']!, _durationMinutesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocationConnector map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocationConnector(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      tripId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trip_id'])!,
      fromLocationId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}from_location_id'])!,
      toLocationId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}to_location_id'])!,
      transportMode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}transport_mode'])!,
      distanceKm: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}distance_km']),
      durationMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_minutes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $LocationConnectorsTable createAlias(String alias) {
    return $LocationConnectorsTable(attachedDatabase, alias);
  }
}

class LocationConnector extends DataClass
    implements Insertable<LocationConnector> {
  final String id;
  final String tripId;
  final String fromLocationId;
  final String toLocationId;
  final String transportMode;
  final int? distanceKm;
  final int? durationMinutes;
  final DateTime createdAt;
  const LocationConnector(
      {required this.id,
      required this.tripId,
      required this.fromLocationId,
      required this.toLocationId,
      required this.transportMode,
      this.distanceKm,
      this.durationMinutes,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['trip_id'] = Variable<String>(tripId);
    map['from_location_id'] = Variable<String>(fromLocationId);
    map['to_location_id'] = Variable<String>(toLocationId);
    map['transport_mode'] = Variable<String>(transportMode);
    if (!nullToAbsent || distanceKm != null) {
      map['distance_km'] = Variable<int>(distanceKm);
    }
    if (!nullToAbsent || durationMinutes != null) {
      map['duration_minutes'] = Variable<int>(durationMinutes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LocationConnectorsCompanion toCompanion(bool nullToAbsent) {
    return LocationConnectorsCompanion(
      id: Value(id),
      tripId: Value(tripId),
      fromLocationId: Value(fromLocationId),
      toLocationId: Value(toLocationId),
      transportMode: Value(transportMode),
      distanceKm: distanceKm == null && nullToAbsent
          ? const Value.absent()
          : Value(distanceKm),
      durationMinutes: durationMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(durationMinutes),
      createdAt: Value(createdAt),
    );
  }

  factory LocationConnector.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationConnector(
      id: serializer.fromJson<String>(json['id']),
      tripId: serializer.fromJson<String>(json['tripId']),
      fromLocationId: serializer.fromJson<String>(json['fromLocationId']),
      toLocationId: serializer.fromJson<String>(json['toLocationId']),
      transportMode: serializer.fromJson<String>(json['transportMode']),
      distanceKm: serializer.fromJson<int?>(json['distanceKm']),
      durationMinutes: serializer.fromJson<int?>(json['durationMinutes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'tripId': serializer.toJson<String>(tripId),
      'fromLocationId': serializer.toJson<String>(fromLocationId),
      'toLocationId': serializer.toJson<String>(toLocationId),
      'transportMode': serializer.toJson<String>(transportMode),
      'distanceKm': serializer.toJson<int?>(distanceKm),
      'durationMinutes': serializer.toJson<int?>(durationMinutes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocationConnector copyWith(
          {String? id,
          String? tripId,
          String? fromLocationId,
          String? toLocationId,
          String? transportMode,
          Value<int?> distanceKm = const Value.absent(),
          Value<int?> durationMinutes = const Value.absent(),
          DateTime? createdAt}) =>
      LocationConnector(
        id: id ?? this.id,
        tripId: tripId ?? this.tripId,
        fromLocationId: fromLocationId ?? this.fromLocationId,
        toLocationId: toLocationId ?? this.toLocationId,
        transportMode: transportMode ?? this.transportMode,
        distanceKm: distanceKm.present ? distanceKm.value : this.distanceKm,
        durationMinutes: durationMinutes.present
            ? durationMinutes.value
            : this.durationMinutes,
        createdAt: createdAt ?? this.createdAt,
      );
  LocationConnector copyWithCompanion(LocationConnectorsCompanion data) {
    return LocationConnector(
      id: data.id.present ? data.id.value : this.id,
      tripId: data.tripId.present ? data.tripId.value : this.tripId,
      fromLocationId: data.fromLocationId.present
          ? data.fromLocationId.value
          : this.fromLocationId,
      toLocationId: data.toLocationId.present
          ? data.toLocationId.value
          : this.toLocationId,
      transportMode: data.transportMode.present
          ? data.transportMode.value
          : this.transportMode,
      distanceKm:
          data.distanceKm.present ? data.distanceKm.value : this.distanceKm,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocationConnector(')
          ..write('id: $id, ')
          ..write('tripId: $tripId, ')
          ..write('fromLocationId: $fromLocationId, ')
          ..write('toLocationId: $toLocationId, ')
          ..write('transportMode: $transportMode, ')
          ..write('distanceKm: $distanceKm, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tripId, fromLocationId, toLocationId,
      transportMode, distanceKm, durationMinutes, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationConnector &&
          other.id == this.id &&
          other.tripId == this.tripId &&
          other.fromLocationId == this.fromLocationId &&
          other.toLocationId == this.toLocationId &&
          other.transportMode == this.transportMode &&
          other.distanceKm == this.distanceKm &&
          other.durationMinutes == this.durationMinutes &&
          other.createdAt == this.createdAt);
}

class LocationConnectorsCompanion extends UpdateCompanion<LocationConnector> {
  final Value<String> id;
  final Value<String> tripId;
  final Value<String> fromLocationId;
  final Value<String> toLocationId;
  final Value<String> transportMode;
  final Value<int?> distanceKm;
  final Value<int?> durationMinutes;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const LocationConnectorsCompanion({
    this.id = const Value.absent(),
    this.tripId = const Value.absent(),
    this.fromLocationId = const Value.absent(),
    this.toLocationId = const Value.absent(),
    this.transportMode = const Value.absent(),
    this.distanceKm = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocationConnectorsCompanion.insert({
    required String id,
    required String tripId,
    required String fromLocationId,
    required String toLocationId,
    required String transportMode,
    this.distanceKm = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        tripId = Value(tripId),
        fromLocationId = Value(fromLocationId),
        toLocationId = Value(toLocationId),
        transportMode = Value(transportMode);
  static Insertable<LocationConnector> custom({
    Expression<String>? id,
    Expression<String>? tripId,
    Expression<String>? fromLocationId,
    Expression<String>? toLocationId,
    Expression<String>? transportMode,
    Expression<int>? distanceKm,
    Expression<int>? durationMinutes,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tripId != null) 'trip_id': tripId,
      if (fromLocationId != null) 'from_location_id': fromLocationId,
      if (toLocationId != null) 'to_location_id': toLocationId,
      if (transportMode != null) 'transport_mode': transportMode,
      if (distanceKm != null) 'distance_km': distanceKm,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocationConnectorsCompanion copyWith(
      {Value<String>? id,
      Value<String>? tripId,
      Value<String>? fromLocationId,
      Value<String>? toLocationId,
      Value<String>? transportMode,
      Value<int?>? distanceKm,
      Value<int?>? durationMinutes,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return LocationConnectorsCompanion(
      id: id ?? this.id,
      tripId: tripId ?? this.tripId,
      fromLocationId: fromLocationId ?? this.fromLocationId,
      toLocationId: toLocationId ?? this.toLocationId,
      transportMode: transportMode ?? this.transportMode,
      distanceKm: distanceKm ?? this.distanceKm,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (tripId.present) {
      map['trip_id'] = Variable<String>(tripId.value);
    }
    if (fromLocationId.present) {
      map['from_location_id'] = Variable<String>(fromLocationId.value);
    }
    if (toLocationId.present) {
      map['to_location_id'] = Variable<String>(toLocationId.value);
    }
    if (transportMode.present) {
      map['transport_mode'] = Variable<String>(transportMode.value);
    }
    if (distanceKm.present) {
      map['distance_km'] = Variable<int>(distanceKm.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationConnectorsCompanion(')
          ..write('id: $id, ')
          ..write('tripId: $tripId, ')
          ..write('fromLocationId: $fromLocationId, ')
          ..write('toLocationId: $toLocationId, ')
          ..write('transportMode: $transportMode, ')
          ..write('distanceKm: $distanceKm, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MomentsTable extends Moments with TableInfo<$MomentsTable, Moment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MomentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tripIdMeta = const VerificationMeta('tripId');
  @override
  late final GeneratedColumn<String> tripId = GeneratedColumn<String>(
      'trip_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES trips (id) ON DELETE CASCADE'));
  static const VerificationMeta _dayNumberMeta =
      const VerificationMeta('dayNumber');
  @override
  late final GeneratedColumn<int> dayNumber = GeneratedColumn<int>(
      'day_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _momentTypeMeta =
      const VerificationMeta('momentType');
  @override
  late final GeneratedColumn<String> momentType = GeneratedColumn<String>(
      'moment_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _textContentMeta =
      const VerificationMeta('textContent');
  @override
  late final GeneratedColumn<String> textContent = GeneratedColumn<String>(
      'text_content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageBytesMeta =
      const VerificationMeta('imageBytes');
  @override
  late final GeneratedColumn<Uint8List> imageBytes = GeneratedColumn<Uint8List>(
      'image_bytes', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  static const VerificationMeta _locationTagMeta =
      const VerificationMeta('locationTag');
  @override
  late final GeneratedColumn<String> locationTag = GeneratedColumn<String>(
      'location_tag', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _weatherMeta =
      const VerificationMeta('weather');
  @override
  late final GeneratedColumn<String> weather = GeneratedColumn<String>(
      'weather', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _recordedAtMeta =
      const VerificationMeta('recordedAt');
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
      'recorded_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('local'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        tripId,
        dayNumber,
        momentType,
        textContent,
        imageBytes,
        locationTag,
        latitude,
        longitude,
        weather,
        recordedAt,
        createdAt,
        syncStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'moments';
  @override
  VerificationContext validateIntegrity(Insertable<Moment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('trip_id')) {
      context.handle(_tripIdMeta,
          tripId.isAcceptableOrUnknown(data['trip_id']!, _tripIdMeta));
    } else if (isInserting) {
      context.missing(_tripIdMeta);
    }
    if (data.containsKey('day_number')) {
      context.handle(_dayNumberMeta,
          dayNumber.isAcceptableOrUnknown(data['day_number']!, _dayNumberMeta));
    } else if (isInserting) {
      context.missing(_dayNumberMeta);
    }
    if (data.containsKey('moment_type')) {
      context.handle(
          _momentTypeMeta,
          momentType.isAcceptableOrUnknown(
              data['moment_type']!, _momentTypeMeta));
    } else if (isInserting) {
      context.missing(_momentTypeMeta);
    }
    if (data.containsKey('text_content')) {
      context.handle(
          _textContentMeta,
          textContent.isAcceptableOrUnknown(
              data['text_content']!, _textContentMeta));
    } else if (isInserting) {
      context.missing(_textContentMeta);
    }
    if (data.containsKey('image_bytes')) {
      context.handle(
          _imageBytesMeta,
          imageBytes.isAcceptableOrUnknown(
              data['image_bytes']!, _imageBytesMeta));
    }
    if (data.containsKey('location_tag')) {
      context.handle(
          _locationTagMeta,
          locationTag.isAcceptableOrUnknown(
              data['location_tag']!, _locationTagMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    }
    if (data.containsKey('weather')) {
      context.handle(_weatherMeta,
          weather.isAcceptableOrUnknown(data['weather']!, _weatherMeta));
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
          _recordedAtMeta,
          recordedAt.isAcceptableOrUnknown(
              data['recorded_at']!, _recordedAtMeta));
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Moment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Moment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      tripId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trip_id'])!,
      dayNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_number'])!,
      momentType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}moment_type'])!,
      textContent: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}text_content'])!,
      imageBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}image_bytes']),
      locationTag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_tag']),
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude']),
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude']),
      weather: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}weather']),
      recordedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}recorded_at'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
    );
  }

  @override
  $MomentsTable createAlias(String alias) {
    return $MomentsTable(attachedDatabase, alias);
  }
}

class Moment extends DataClass implements Insertable<Moment> {
  final String id;
  final String tripId;
  final int dayNumber;
  final String momentType;
  final String textContent;
  final Uint8List? imageBytes;
  final String? locationTag;
  final double? latitude;
  final double? longitude;
  final String? weather;
  final DateTime recordedAt;
  final DateTime createdAt;
  final String syncStatus;
  const Moment(
      {required this.id,
      required this.tripId,
      required this.dayNumber,
      required this.momentType,
      required this.textContent,
      this.imageBytes,
      this.locationTag,
      this.latitude,
      this.longitude,
      this.weather,
      required this.recordedAt,
      required this.createdAt,
      required this.syncStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['trip_id'] = Variable<String>(tripId);
    map['day_number'] = Variable<int>(dayNumber);
    map['moment_type'] = Variable<String>(momentType);
    map['text_content'] = Variable<String>(textContent);
    if (!nullToAbsent || imageBytes != null) {
      map['image_bytes'] = Variable<Uint8List>(imageBytes);
    }
    if (!nullToAbsent || locationTag != null) {
      map['location_tag'] = Variable<String>(locationTag);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || weather != null) {
      map['weather'] = Variable<String>(weather);
    }
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  MomentsCompanion toCompanion(bool nullToAbsent) {
    return MomentsCompanion(
      id: Value(id),
      tripId: Value(tripId),
      dayNumber: Value(dayNumber),
      momentType: Value(momentType),
      textContent: Value(textContent),
      imageBytes: imageBytes == null && nullToAbsent
          ? const Value.absent()
          : Value(imageBytes),
      locationTag: locationTag == null && nullToAbsent
          ? const Value.absent()
          : Value(locationTag),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      weather: weather == null && nullToAbsent
          ? const Value.absent()
          : Value(weather),
      recordedAt: Value(recordedAt),
      createdAt: Value(createdAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory Moment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Moment(
      id: serializer.fromJson<String>(json['id']),
      tripId: serializer.fromJson<String>(json['tripId']),
      dayNumber: serializer.fromJson<int>(json['dayNumber']),
      momentType: serializer.fromJson<String>(json['momentType']),
      textContent: serializer.fromJson<String>(json['textContent']),
      imageBytes: serializer.fromJson<Uint8List?>(json['imageBytes']),
      locationTag: serializer.fromJson<String?>(json['locationTag']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      weather: serializer.fromJson<String?>(json['weather']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'tripId': serializer.toJson<String>(tripId),
      'dayNumber': serializer.toJson<int>(dayNumber),
      'momentType': serializer.toJson<String>(momentType),
      'textContent': serializer.toJson<String>(textContent),
      'imageBytes': serializer.toJson<Uint8List?>(imageBytes),
      'locationTag': serializer.toJson<String?>(locationTag),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'weather': serializer.toJson<String?>(weather),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  Moment copyWith(
          {String? id,
          String? tripId,
          int? dayNumber,
          String? momentType,
          String? textContent,
          Value<Uint8List?> imageBytes = const Value.absent(),
          Value<String?> locationTag = const Value.absent(),
          Value<double?> latitude = const Value.absent(),
          Value<double?> longitude = const Value.absent(),
          Value<String?> weather = const Value.absent(),
          DateTime? recordedAt,
          DateTime? createdAt,
          String? syncStatus}) =>
      Moment(
        id: id ?? this.id,
        tripId: tripId ?? this.tripId,
        dayNumber: dayNumber ?? this.dayNumber,
        momentType: momentType ?? this.momentType,
        textContent: textContent ?? this.textContent,
        imageBytes: imageBytes.present ? imageBytes.value : this.imageBytes,
        locationTag: locationTag.present ? locationTag.value : this.locationTag,
        latitude: latitude.present ? latitude.value : this.latitude,
        longitude: longitude.present ? longitude.value : this.longitude,
        weather: weather.present ? weather.value : this.weather,
        recordedAt: recordedAt ?? this.recordedAt,
        createdAt: createdAt ?? this.createdAt,
        syncStatus: syncStatus ?? this.syncStatus,
      );
  Moment copyWithCompanion(MomentsCompanion data) {
    return Moment(
      id: data.id.present ? data.id.value : this.id,
      tripId: data.tripId.present ? data.tripId.value : this.tripId,
      dayNumber: data.dayNumber.present ? data.dayNumber.value : this.dayNumber,
      momentType:
          data.momentType.present ? data.momentType.value : this.momentType,
      textContent:
          data.textContent.present ? data.textContent.value : this.textContent,
      imageBytes:
          data.imageBytes.present ? data.imageBytes.value : this.imageBytes,
      locationTag:
          data.locationTag.present ? data.locationTag.value : this.locationTag,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      weather: data.weather.present ? data.weather.value : this.weather,
      recordedAt:
          data.recordedAt.present ? data.recordedAt.value : this.recordedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Moment(')
          ..write('id: $id, ')
          ..write('tripId: $tripId, ')
          ..write('dayNumber: $dayNumber, ')
          ..write('momentType: $momentType, ')
          ..write('textContent: $textContent, ')
          ..write('imageBytes: $imageBytes, ')
          ..write('locationTag: $locationTag, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('weather: $weather, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      tripId,
      dayNumber,
      momentType,
      textContent,
      $driftBlobEquality.hash(imageBytes),
      locationTag,
      latitude,
      longitude,
      weather,
      recordedAt,
      createdAt,
      syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Moment &&
          other.id == this.id &&
          other.tripId == this.tripId &&
          other.dayNumber == this.dayNumber &&
          other.momentType == this.momentType &&
          other.textContent == this.textContent &&
          $driftBlobEquality.equals(other.imageBytes, this.imageBytes) &&
          other.locationTag == this.locationTag &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.weather == this.weather &&
          other.recordedAt == this.recordedAt &&
          other.createdAt == this.createdAt &&
          other.syncStatus == this.syncStatus);
}

class MomentsCompanion extends UpdateCompanion<Moment> {
  final Value<String> id;
  final Value<String> tripId;
  final Value<int> dayNumber;
  final Value<String> momentType;
  final Value<String> textContent;
  final Value<Uint8List?> imageBytes;
  final Value<String?> locationTag;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<String?> weather;
  final Value<DateTime> recordedAt;
  final Value<DateTime> createdAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const MomentsCompanion({
    this.id = const Value.absent(),
    this.tripId = const Value.absent(),
    this.dayNumber = const Value.absent(),
    this.momentType = const Value.absent(),
    this.textContent = const Value.absent(),
    this.imageBytes = const Value.absent(),
    this.locationTag = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.weather = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MomentsCompanion.insert({
    required String id,
    required String tripId,
    required int dayNumber,
    required String momentType,
    required String textContent,
    this.imageBytes = const Value.absent(),
    this.locationTag = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.weather = const Value.absent(),
    required DateTime recordedAt,
    this.createdAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        tripId = Value(tripId),
        dayNumber = Value(dayNumber),
        momentType = Value(momentType),
        textContent = Value(textContent),
        recordedAt = Value(recordedAt);
  static Insertable<Moment> custom({
    Expression<String>? id,
    Expression<String>? tripId,
    Expression<int>? dayNumber,
    Expression<String>? momentType,
    Expression<String>? textContent,
    Expression<Uint8List>? imageBytes,
    Expression<String>? locationTag,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? weather,
    Expression<DateTime>? recordedAt,
    Expression<DateTime>? createdAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tripId != null) 'trip_id': tripId,
      if (dayNumber != null) 'day_number': dayNumber,
      if (momentType != null) 'moment_type': momentType,
      if (textContent != null) 'text_content': textContent,
      if (imageBytes != null) 'image_bytes': imageBytes,
      if (locationTag != null) 'location_tag': locationTag,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (weather != null) 'weather': weather,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MomentsCompanion copyWith(
      {Value<String>? id,
      Value<String>? tripId,
      Value<int>? dayNumber,
      Value<String>? momentType,
      Value<String>? textContent,
      Value<Uint8List?>? imageBytes,
      Value<String?>? locationTag,
      Value<double?>? latitude,
      Value<double?>? longitude,
      Value<String?>? weather,
      Value<DateTime>? recordedAt,
      Value<DateTime>? createdAt,
      Value<String>? syncStatus,
      Value<int>? rowid}) {
    return MomentsCompanion(
      id: id ?? this.id,
      tripId: tripId ?? this.tripId,
      dayNumber: dayNumber ?? this.dayNumber,
      momentType: momentType ?? this.momentType,
      textContent: textContent ?? this.textContent,
      imageBytes: imageBytes ?? this.imageBytes,
      locationTag: locationTag ?? this.locationTag,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      weather: weather ?? this.weather,
      recordedAt: recordedAt ?? this.recordedAt,
      createdAt: createdAt ?? this.createdAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (tripId.present) {
      map['trip_id'] = Variable<String>(tripId.value);
    }
    if (dayNumber.present) {
      map['day_number'] = Variable<int>(dayNumber.value);
    }
    if (momentType.present) {
      map['moment_type'] = Variable<String>(momentType.value);
    }
    if (textContent.present) {
      map['text_content'] = Variable<String>(textContent.value);
    }
    if (imageBytes.present) {
      map['image_bytes'] = Variable<Uint8List>(imageBytes.value);
    }
    if (locationTag.present) {
      map['location_tag'] = Variable<String>(locationTag.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (weather.present) {
      map['weather'] = Variable<String>(weather.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MomentsCompanion(')
          ..write('id: $id, ')
          ..write('tripId: $tripId, ')
          ..write('dayNumber: $dayNumber, ')
          ..write('momentType: $momentType, ')
          ..write('textContent: $textContent, ')
          ..write('imageBytes: $imageBytes, ')
          ..write('locationTag: $locationTag, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('weather: $weather, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTable extends Expenses with TableInfo<$ExpensesTable, Expense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tripIdMeta = const VerificationMeta('tripId');
  @override
  late final GeneratedColumn<String> tripId = GeneratedColumn<String>(
      'trip_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES trips (id) ON DELETE CASCADE'));
  static const VerificationMeta _dayNumberMeta =
      const VerificationMeta('dayNumber');
  @override
  late final GeneratedColumn<int> dayNumber = GeneratedColumn<int>(
      'day_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _receiptImageBytesMeta =
      const VerificationMeta('receiptImageBytes');
  @override
  late final GeneratedColumn<Uint8List> receiptImageBytes =
      GeneratedColumn<Uint8List>('receipt_image_bytes', aliasedName, true,
          type: DriftSqlType.blob, requiredDuringInsert: false);
  static const VerificationMeta _receiptOcrResultMeta =
      const VerificationMeta('receiptOcrResult');
  @override
  late final GeneratedColumn<String> receiptOcrResult = GeneratedColumn<String>(
      'receipt_ocr_result', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _recordedAtMeta =
      const VerificationMeta('recordedAt');
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
      'recorded_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('local'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        tripId,
        dayNumber,
        name,
        category,
        amount,
        paymentMethod,
        receiptImageBytes,
        receiptOcrResult,
        notes,
        recordedAt,
        createdAt,
        syncStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expenses';
  @override
  VerificationContext validateIntegrity(Insertable<Expense> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('trip_id')) {
      context.handle(_tripIdMeta,
          tripId.isAcceptableOrUnknown(data['trip_id']!, _tripIdMeta));
    } else if (isInserting) {
      context.missing(_tripIdMeta);
    }
    if (data.containsKey('day_number')) {
      context.handle(_dayNumberMeta,
          dayNumber.isAcceptableOrUnknown(data['day_number']!, _dayNumberMeta));
    } else if (isInserting) {
      context.missing(_dayNumberMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    }
    if (data.containsKey('receipt_image_bytes')) {
      context.handle(
          _receiptImageBytesMeta,
          receiptImageBytes.isAcceptableOrUnknown(
              data['receipt_image_bytes']!, _receiptImageBytesMeta));
    }
    if (data.containsKey('receipt_ocr_result')) {
      context.handle(
          _receiptOcrResultMeta,
          receiptOcrResult.isAcceptableOrUnknown(
              data['receipt_ocr_result']!, _receiptOcrResultMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
          _recordedAtMeta,
          recordedAt.isAcceptableOrUnknown(
              data['recorded_at']!, _recordedAtMeta));
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Expense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Expense(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      tripId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trip_id'])!,
      dayNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_number'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method']),
      receiptImageBytes: attachedDatabase.typeMapping.read(
          DriftSqlType.blob, data['${effectivePrefix}receipt_image_bytes']),
      receiptOcrResult: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}receipt_ocr_result']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      recordedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}recorded_at'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
    );
  }

  @override
  $ExpensesTable createAlias(String alias) {
    return $ExpensesTable(attachedDatabase, alias);
  }
}

class Expense extends DataClass implements Insertable<Expense> {
  final String id;
  final String tripId;
  final int dayNumber;
  final String name;
  final String category;
  final int amount;
  final String? paymentMethod;
  final Uint8List? receiptImageBytes;
  final String? receiptOcrResult;
  final String? notes;
  final DateTime recordedAt;
  final DateTime createdAt;
  final String syncStatus;
  const Expense(
      {required this.id,
      required this.tripId,
      required this.dayNumber,
      required this.name,
      required this.category,
      required this.amount,
      this.paymentMethod,
      this.receiptImageBytes,
      this.receiptOcrResult,
      this.notes,
      required this.recordedAt,
      required this.createdAt,
      required this.syncStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['trip_id'] = Variable<String>(tripId);
    map['day_number'] = Variable<int>(dayNumber);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['amount'] = Variable<int>(amount);
    if (!nullToAbsent || paymentMethod != null) {
      map['payment_method'] = Variable<String>(paymentMethod);
    }
    if (!nullToAbsent || receiptImageBytes != null) {
      map['receipt_image_bytes'] = Variable<Uint8List>(receiptImageBytes);
    }
    if (!nullToAbsent || receiptOcrResult != null) {
      map['receipt_ocr_result'] = Variable<String>(receiptOcrResult);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  ExpensesCompanion toCompanion(bool nullToAbsent) {
    return ExpensesCompanion(
      id: Value(id),
      tripId: Value(tripId),
      dayNumber: Value(dayNumber),
      name: Value(name),
      category: Value(category),
      amount: Value(amount),
      paymentMethod: paymentMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentMethod),
      receiptImageBytes: receiptImageBytes == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptImageBytes),
      receiptOcrResult: receiptOcrResult == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptOcrResult),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      recordedAt: Value(recordedAt),
      createdAt: Value(createdAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory Expense.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Expense(
      id: serializer.fromJson<String>(json['id']),
      tripId: serializer.fromJson<String>(json['tripId']),
      dayNumber: serializer.fromJson<int>(json['dayNumber']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      amount: serializer.fromJson<int>(json['amount']),
      paymentMethod: serializer.fromJson<String?>(json['paymentMethod']),
      receiptImageBytes:
          serializer.fromJson<Uint8List?>(json['receiptImageBytes']),
      receiptOcrResult: serializer.fromJson<String?>(json['receiptOcrResult']),
      notes: serializer.fromJson<String?>(json['notes']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'tripId': serializer.toJson<String>(tripId),
      'dayNumber': serializer.toJson<int>(dayNumber),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'amount': serializer.toJson<int>(amount),
      'paymentMethod': serializer.toJson<String?>(paymentMethod),
      'receiptImageBytes': serializer.toJson<Uint8List?>(receiptImageBytes),
      'receiptOcrResult': serializer.toJson<String?>(receiptOcrResult),
      'notes': serializer.toJson<String?>(notes),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  Expense copyWith(
          {String? id,
          String? tripId,
          int? dayNumber,
          String? name,
          String? category,
          int? amount,
          Value<String?> paymentMethod = const Value.absent(),
          Value<Uint8List?> receiptImageBytes = const Value.absent(),
          Value<String?> receiptOcrResult = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          DateTime? recordedAt,
          DateTime? createdAt,
          String? syncStatus}) =>
      Expense(
        id: id ?? this.id,
        tripId: tripId ?? this.tripId,
        dayNumber: dayNumber ?? this.dayNumber,
        name: name ?? this.name,
        category: category ?? this.category,
        amount: amount ?? this.amount,
        paymentMethod:
            paymentMethod.present ? paymentMethod.value : this.paymentMethod,
        receiptImageBytes: receiptImageBytes.present
            ? receiptImageBytes.value
            : this.receiptImageBytes,
        receiptOcrResult: receiptOcrResult.present
            ? receiptOcrResult.value
            : this.receiptOcrResult,
        notes: notes.present ? notes.value : this.notes,
        recordedAt: recordedAt ?? this.recordedAt,
        createdAt: createdAt ?? this.createdAt,
        syncStatus: syncStatus ?? this.syncStatus,
      );
  Expense copyWithCompanion(ExpensesCompanion data) {
    return Expense(
      id: data.id.present ? data.id.value : this.id,
      tripId: data.tripId.present ? data.tripId.value : this.tripId,
      dayNumber: data.dayNumber.present ? data.dayNumber.value : this.dayNumber,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      amount: data.amount.present ? data.amount.value : this.amount,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      receiptImageBytes: data.receiptImageBytes.present
          ? data.receiptImageBytes.value
          : this.receiptImageBytes,
      receiptOcrResult: data.receiptOcrResult.present
          ? data.receiptOcrResult.value
          : this.receiptOcrResult,
      notes: data.notes.present ? data.notes.value : this.notes,
      recordedAt:
          data.recordedAt.present ? data.recordedAt.value : this.recordedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Expense(')
          ..write('id: $id, ')
          ..write('tripId: $tripId, ')
          ..write('dayNumber: $dayNumber, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('receiptImageBytes: $receiptImageBytes, ')
          ..write('receiptOcrResult: $receiptOcrResult, ')
          ..write('notes: $notes, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      tripId,
      dayNumber,
      name,
      category,
      amount,
      paymentMethod,
      $driftBlobEquality.hash(receiptImageBytes),
      receiptOcrResult,
      notes,
      recordedAt,
      createdAt,
      syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Expense &&
          other.id == this.id &&
          other.tripId == this.tripId &&
          other.dayNumber == this.dayNumber &&
          other.name == this.name &&
          other.category == this.category &&
          other.amount == this.amount &&
          other.paymentMethod == this.paymentMethod &&
          $driftBlobEquality.equals(
              other.receiptImageBytes, this.receiptImageBytes) &&
          other.receiptOcrResult == this.receiptOcrResult &&
          other.notes == this.notes &&
          other.recordedAt == this.recordedAt &&
          other.createdAt == this.createdAt &&
          other.syncStatus == this.syncStatus);
}

class ExpensesCompanion extends UpdateCompanion<Expense> {
  final Value<String> id;
  final Value<String> tripId;
  final Value<int> dayNumber;
  final Value<String> name;
  final Value<String> category;
  final Value<int> amount;
  final Value<String?> paymentMethod;
  final Value<Uint8List?> receiptImageBytes;
  final Value<String?> receiptOcrResult;
  final Value<String?> notes;
  final Value<DateTime> recordedAt;
  final Value<DateTime> createdAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const ExpensesCompanion({
    this.id = const Value.absent(),
    this.tripId = const Value.absent(),
    this.dayNumber = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.amount = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.receiptImageBytes = const Value.absent(),
    this.receiptOcrResult = const Value.absent(),
    this.notes = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExpensesCompanion.insert({
    required String id,
    required String tripId,
    required int dayNumber,
    required String name,
    required String category,
    required int amount,
    this.paymentMethod = const Value.absent(),
    this.receiptImageBytes = const Value.absent(),
    this.receiptOcrResult = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime recordedAt,
    this.createdAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        tripId = Value(tripId),
        dayNumber = Value(dayNumber),
        name = Value(name),
        category = Value(category),
        amount = Value(amount),
        recordedAt = Value(recordedAt);
  static Insertable<Expense> custom({
    Expression<String>? id,
    Expression<String>? tripId,
    Expression<int>? dayNumber,
    Expression<String>? name,
    Expression<String>? category,
    Expression<int>? amount,
    Expression<String>? paymentMethod,
    Expression<Uint8List>? receiptImageBytes,
    Expression<String>? receiptOcrResult,
    Expression<String>? notes,
    Expression<DateTime>? recordedAt,
    Expression<DateTime>? createdAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tripId != null) 'trip_id': tripId,
      if (dayNumber != null) 'day_number': dayNumber,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (amount != null) 'amount': amount,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (receiptImageBytes != null) 'receipt_image_bytes': receiptImageBytes,
      if (receiptOcrResult != null) 'receipt_ocr_result': receiptOcrResult,
      if (notes != null) 'notes': notes,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExpensesCompanion copyWith(
      {Value<String>? id,
      Value<String>? tripId,
      Value<int>? dayNumber,
      Value<String>? name,
      Value<String>? category,
      Value<int>? amount,
      Value<String?>? paymentMethod,
      Value<Uint8List?>? receiptImageBytes,
      Value<String?>? receiptOcrResult,
      Value<String?>? notes,
      Value<DateTime>? recordedAt,
      Value<DateTime>? createdAt,
      Value<String>? syncStatus,
      Value<int>? rowid}) {
    return ExpensesCompanion(
      id: id ?? this.id,
      tripId: tripId ?? this.tripId,
      dayNumber: dayNumber ?? this.dayNumber,
      name: name ?? this.name,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      receiptImageBytes: receiptImageBytes ?? this.receiptImageBytes,
      receiptOcrResult: receiptOcrResult ?? this.receiptOcrResult,
      notes: notes ?? this.notes,
      recordedAt: recordedAt ?? this.recordedAt,
      createdAt: createdAt ?? this.createdAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (tripId.present) {
      map['trip_id'] = Variable<String>(tripId.value);
    }
    if (dayNumber.present) {
      map['day_number'] = Variable<int>(dayNumber.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (receiptImageBytes.present) {
      map['receipt_image_bytes'] = Variable<Uint8List>(receiptImageBytes.value);
    }
    if (receiptOcrResult.present) {
      map['receipt_ocr_result'] = Variable<String>(receiptOcrResult.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesCompanion(')
          ..write('id: $id, ')
          ..write('tripId: $tripId, ')
          ..write('dayNumber: $dayNumber, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('receiptImageBytes: $receiptImageBytes, ')
          ..write('receiptOcrResult: $receiptOcrResult, ')
          ..write('notes: $notes, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $JournalsTable extends Journals with TableInfo<$JournalsTable, Journal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tripIdMeta = const VerificationMeta('tripId');
  @override
  late final GeneratedColumn<String> tripId = GeneratedColumn<String>(
      'trip_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES trips (id) ON DELETE CASCADE'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _styleMeta = const VerificationMeta('style');
  @override
  late final GeneratedColumn<String> style = GeneratedColumn<String>(
      'style', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('default'));
  static const VerificationMeta _generatedAtMeta =
      const VerificationMeta('generatedAt');
  @override
  late final GeneratedColumn<DateTime> generatedAt = GeneratedColumn<DateTime>(
      'generated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastEditedAtMeta =
      const VerificationMeta('lastEditedAt');
  @override
  late final GeneratedColumn<DateTime> lastEditedAt = GeneratedColumn<DateTime>(
      'last_edited_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _exportFormatsMeta =
      const VerificationMeta('exportFormats');
  @override
  late final GeneratedColumn<String> exportFormats = GeneratedColumn<String>(
      'export_formats', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('local'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        tripId,
        title,
        content,
        style,
        generatedAt,
        lastEditedAt,
        exportFormats,
        syncStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journals';
  @override
  VerificationContext validateIntegrity(Insertable<Journal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('trip_id')) {
      context.handle(_tripIdMeta,
          tripId.isAcceptableOrUnknown(data['trip_id']!, _tripIdMeta));
    } else if (isInserting) {
      context.missing(_tripIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('style')) {
      context.handle(
          _styleMeta, style.isAcceptableOrUnknown(data['style']!, _styleMeta));
    }
    if (data.containsKey('generated_at')) {
      context.handle(
          _generatedAtMeta,
          generatedAt.isAcceptableOrUnknown(
              data['generated_at']!, _generatedAtMeta));
    } else if (isInserting) {
      context.missing(_generatedAtMeta);
    }
    if (data.containsKey('last_edited_at')) {
      context.handle(
          _lastEditedAtMeta,
          lastEditedAt.isAcceptableOrUnknown(
              data['last_edited_at']!, _lastEditedAtMeta));
    } else if (isInserting) {
      context.missing(_lastEditedAtMeta);
    }
    if (data.containsKey('export_formats')) {
      context.handle(
          _exportFormatsMeta,
          exportFormats.isAcceptableOrUnknown(
              data['export_formats']!, _exportFormatsMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {tripId},
      ];
  @override
  Journal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Journal(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      tripId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trip_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      style: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}style'])!,
      generatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}generated_at'])!,
      lastEditedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_edited_at'])!,
      exportFormats: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}export_formats']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
    );
  }

  @override
  $JournalsTable createAlias(String alias) {
    return $JournalsTable(attachedDatabase, alias);
  }
}

class Journal extends DataClass implements Insertable<Journal> {
  final String id;
  final String tripId;
  final String title;
  final String content;
  final String style;
  final DateTime generatedAt;
  final DateTime lastEditedAt;
  final String? exportFormats;
  final String syncStatus;
  const Journal(
      {required this.id,
      required this.tripId,
      required this.title,
      required this.content,
      required this.style,
      required this.generatedAt,
      required this.lastEditedAt,
      this.exportFormats,
      required this.syncStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['trip_id'] = Variable<String>(tripId);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['style'] = Variable<String>(style);
    map['generated_at'] = Variable<DateTime>(generatedAt);
    map['last_edited_at'] = Variable<DateTime>(lastEditedAt);
    if (!nullToAbsent || exportFormats != null) {
      map['export_formats'] = Variable<String>(exportFormats);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  JournalsCompanion toCompanion(bool nullToAbsent) {
    return JournalsCompanion(
      id: Value(id),
      tripId: Value(tripId),
      title: Value(title),
      content: Value(content),
      style: Value(style),
      generatedAt: Value(generatedAt),
      lastEditedAt: Value(lastEditedAt),
      exportFormats: exportFormats == null && nullToAbsent
          ? const Value.absent()
          : Value(exportFormats),
      syncStatus: Value(syncStatus),
    );
  }

  factory Journal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Journal(
      id: serializer.fromJson<String>(json['id']),
      tripId: serializer.fromJson<String>(json['tripId']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      style: serializer.fromJson<String>(json['style']),
      generatedAt: serializer.fromJson<DateTime>(json['generatedAt']),
      lastEditedAt: serializer.fromJson<DateTime>(json['lastEditedAt']),
      exportFormats: serializer.fromJson<String?>(json['exportFormats']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'tripId': serializer.toJson<String>(tripId),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'style': serializer.toJson<String>(style),
      'generatedAt': serializer.toJson<DateTime>(generatedAt),
      'lastEditedAt': serializer.toJson<DateTime>(lastEditedAt),
      'exportFormats': serializer.toJson<String?>(exportFormats),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  Journal copyWith(
          {String? id,
          String? tripId,
          String? title,
          String? content,
          String? style,
          DateTime? generatedAt,
          DateTime? lastEditedAt,
          Value<String?> exportFormats = const Value.absent(),
          String? syncStatus}) =>
      Journal(
        id: id ?? this.id,
        tripId: tripId ?? this.tripId,
        title: title ?? this.title,
        content: content ?? this.content,
        style: style ?? this.style,
        generatedAt: generatedAt ?? this.generatedAt,
        lastEditedAt: lastEditedAt ?? this.lastEditedAt,
        exportFormats:
            exportFormats.present ? exportFormats.value : this.exportFormats,
        syncStatus: syncStatus ?? this.syncStatus,
      );
  Journal copyWithCompanion(JournalsCompanion data) {
    return Journal(
      id: data.id.present ? data.id.value : this.id,
      tripId: data.tripId.present ? data.tripId.value : this.tripId,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      style: data.style.present ? data.style.value : this.style,
      generatedAt:
          data.generatedAt.present ? data.generatedAt.value : this.generatedAt,
      lastEditedAt: data.lastEditedAt.present
          ? data.lastEditedAt.value
          : this.lastEditedAt,
      exportFormats: data.exportFormats.present
          ? data.exportFormats.value
          : this.exportFormats,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Journal(')
          ..write('id: $id, ')
          ..write('tripId: $tripId, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('style: $style, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('lastEditedAt: $lastEditedAt, ')
          ..write('exportFormats: $exportFormats, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tripId, title, content, style,
      generatedAt, lastEditedAt, exportFormats, syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Journal &&
          other.id == this.id &&
          other.tripId == this.tripId &&
          other.title == this.title &&
          other.content == this.content &&
          other.style == this.style &&
          other.generatedAt == this.generatedAt &&
          other.lastEditedAt == this.lastEditedAt &&
          other.exportFormats == this.exportFormats &&
          other.syncStatus == this.syncStatus);
}

class JournalsCompanion extends UpdateCompanion<Journal> {
  final Value<String> id;
  final Value<String> tripId;
  final Value<String> title;
  final Value<String> content;
  final Value<String> style;
  final Value<DateTime> generatedAt;
  final Value<DateTime> lastEditedAt;
  final Value<String?> exportFormats;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const JournalsCompanion({
    this.id = const Value.absent(),
    this.tripId = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.style = const Value.absent(),
    this.generatedAt = const Value.absent(),
    this.lastEditedAt = const Value.absent(),
    this.exportFormats = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JournalsCompanion.insert({
    required String id,
    required String tripId,
    required String title,
    required String content,
    this.style = const Value.absent(),
    required DateTime generatedAt,
    required DateTime lastEditedAt,
    this.exportFormats = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        tripId = Value(tripId),
        title = Value(title),
        content = Value(content),
        generatedAt = Value(generatedAt),
        lastEditedAt = Value(lastEditedAt);
  static Insertable<Journal> custom({
    Expression<String>? id,
    Expression<String>? tripId,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? style,
    Expression<DateTime>? generatedAt,
    Expression<DateTime>? lastEditedAt,
    Expression<String>? exportFormats,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tripId != null) 'trip_id': tripId,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (style != null) 'style': style,
      if (generatedAt != null) 'generated_at': generatedAt,
      if (lastEditedAt != null) 'last_edited_at': lastEditedAt,
      if (exportFormats != null) 'export_formats': exportFormats,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JournalsCompanion copyWith(
      {Value<String>? id,
      Value<String>? tripId,
      Value<String>? title,
      Value<String>? content,
      Value<String>? style,
      Value<DateTime>? generatedAt,
      Value<DateTime>? lastEditedAt,
      Value<String?>? exportFormats,
      Value<String>? syncStatus,
      Value<int>? rowid}) {
    return JournalsCompanion(
      id: id ?? this.id,
      tripId: tripId ?? this.tripId,
      title: title ?? this.title,
      content: content ?? this.content,
      style: style ?? this.style,
      generatedAt: generatedAt ?? this.generatedAt,
      lastEditedAt: lastEditedAt ?? this.lastEditedAt,
      exportFormats: exportFormats ?? this.exportFormats,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (tripId.present) {
      map['trip_id'] = Variable<String>(tripId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (style.present) {
      map['style'] = Variable<String>(style.value);
    }
    if (generatedAt.present) {
      map['generated_at'] = Variable<DateTime>(generatedAt.value);
    }
    if (lastEditedAt.present) {
      map['last_edited_at'] = Variable<DateTime>(lastEditedAt.value);
    }
    if (exportFormats.present) {
      map['export_formats'] = Variable<String>(exportFormats.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalsCompanion(')
          ..write('id: $id, ')
          ..write('tripId: $tripId, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('style: $style, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('lastEditedAt: $lastEditedAt, ')
          ..write('exportFormats: $exportFormats, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PackingChecklistsTable extends PackingChecklists
    with TableInfo<$PackingChecklistsTable, PackingChecklist> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PackingChecklistsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tripIdMeta = const VerificationMeta('tripId');
  @override
  late final GeneratedColumn<String> tripId = GeneratedColumn<String>(
      'trip_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES trips (id) ON DELETE CASCADE'));
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemNameMeta =
      const VerificationMeta('itemName');
  @override
  late final GeneratedColumn<String> itemName = GeneratedColumn<String>(
      'item_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isPackedMeta =
      const VerificationMeta('isPacked');
  @override
  late final GeneratedColumn<bool> isPacked = GeneratedColumn<bool>(
      'is_packed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_packed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _sortOrderMeta =
      const VerificationMeta('sortOrder');
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
      'sort_order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, tripId, category, itemName, isPacked, sortOrder, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'packing_checklists';
  @override
  VerificationContext validateIntegrity(Insertable<PackingChecklist> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('trip_id')) {
      context.handle(_tripIdMeta,
          tripId.isAcceptableOrUnknown(data['trip_id']!, _tripIdMeta));
    } else if (isInserting) {
      context.missing(_tripIdMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('item_name')) {
      context.handle(_itemNameMeta,
          itemName.isAcceptableOrUnknown(data['item_name']!, _itemNameMeta));
    } else if (isInserting) {
      context.missing(_itemNameMeta);
    }
    if (data.containsKey('is_packed')) {
      context.handle(_isPackedMeta,
          isPacked.isAcceptableOrUnknown(data['is_packed']!, _isPackedMeta));
    }
    if (data.containsKey('sort_order')) {
      context.handle(_sortOrderMeta,
          sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta));
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PackingChecklist map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PackingChecklist(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      tripId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trip_id'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      itemName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_name'])!,
      isPacked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_packed'])!,
      sortOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort_order'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $PackingChecklistsTable createAlias(String alias) {
    return $PackingChecklistsTable(attachedDatabase, alias);
  }
}

class PackingChecklist extends DataClass
    implements Insertable<PackingChecklist> {
  final String id;
  final String tripId;
  final String category;
  final String itemName;
  final bool isPacked;
  final int sortOrder;
  final DateTime createdAt;
  const PackingChecklist(
      {required this.id,
      required this.tripId,
      required this.category,
      required this.itemName,
      required this.isPacked,
      required this.sortOrder,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['trip_id'] = Variable<String>(tripId);
    map['category'] = Variable<String>(category);
    map['item_name'] = Variable<String>(itemName);
    map['is_packed'] = Variable<bool>(isPacked);
    map['sort_order'] = Variable<int>(sortOrder);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PackingChecklistsCompanion toCompanion(bool nullToAbsent) {
    return PackingChecklistsCompanion(
      id: Value(id),
      tripId: Value(tripId),
      category: Value(category),
      itemName: Value(itemName),
      isPacked: Value(isPacked),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
    );
  }

  factory PackingChecklist.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PackingChecklist(
      id: serializer.fromJson<String>(json['id']),
      tripId: serializer.fromJson<String>(json['tripId']),
      category: serializer.fromJson<String>(json['category']),
      itemName: serializer.fromJson<String>(json['itemName']),
      isPacked: serializer.fromJson<bool>(json['isPacked']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'tripId': serializer.toJson<String>(tripId),
      'category': serializer.toJson<String>(category),
      'itemName': serializer.toJson<String>(itemName),
      'isPacked': serializer.toJson<bool>(isPacked),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PackingChecklist copyWith(
          {String? id,
          String? tripId,
          String? category,
          String? itemName,
          bool? isPacked,
          int? sortOrder,
          DateTime? createdAt}) =>
      PackingChecklist(
        id: id ?? this.id,
        tripId: tripId ?? this.tripId,
        category: category ?? this.category,
        itemName: itemName ?? this.itemName,
        isPacked: isPacked ?? this.isPacked,
        sortOrder: sortOrder ?? this.sortOrder,
        createdAt: createdAt ?? this.createdAt,
      );
  PackingChecklist copyWithCompanion(PackingChecklistsCompanion data) {
    return PackingChecklist(
      id: data.id.present ? data.id.value : this.id,
      tripId: data.tripId.present ? data.tripId.value : this.tripId,
      category: data.category.present ? data.category.value : this.category,
      itemName: data.itemName.present ? data.itemName.value : this.itemName,
      isPacked: data.isPacked.present ? data.isPacked.value : this.isPacked,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PackingChecklist(')
          ..write('id: $id, ')
          ..write('tripId: $tripId, ')
          ..write('category: $category, ')
          ..write('itemName: $itemName, ')
          ..write('isPacked: $isPacked, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, tripId, category, itemName, isPacked, sortOrder, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PackingChecklist &&
          other.id == this.id &&
          other.tripId == this.tripId &&
          other.category == this.category &&
          other.itemName == this.itemName &&
          other.isPacked == this.isPacked &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt);
}

class PackingChecklistsCompanion extends UpdateCompanion<PackingChecklist> {
  final Value<String> id;
  final Value<String> tripId;
  final Value<String> category;
  final Value<String> itemName;
  final Value<bool> isPacked;
  final Value<int> sortOrder;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const PackingChecklistsCompanion({
    this.id = const Value.absent(),
    this.tripId = const Value.absent(),
    this.category = const Value.absent(),
    this.itemName = const Value.absent(),
    this.isPacked = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PackingChecklistsCompanion.insert({
    required String id,
    required String tripId,
    required String category,
    required String itemName,
    this.isPacked = const Value.absent(),
    required int sortOrder,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        tripId = Value(tripId),
        category = Value(category),
        itemName = Value(itemName),
        sortOrder = Value(sortOrder);
  static Insertable<PackingChecklist> custom({
    Expression<String>? id,
    Expression<String>? tripId,
    Expression<String>? category,
    Expression<String>? itemName,
    Expression<bool>? isPacked,
    Expression<int>? sortOrder,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tripId != null) 'trip_id': tripId,
      if (category != null) 'category': category,
      if (itemName != null) 'item_name': itemName,
      if (isPacked != null) 'is_packed': isPacked,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PackingChecklistsCompanion copyWith(
      {Value<String>? id,
      Value<String>? tripId,
      Value<String>? category,
      Value<String>? itemName,
      Value<bool>? isPacked,
      Value<int>? sortOrder,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return PackingChecklistsCompanion(
      id: id ?? this.id,
      tripId: tripId ?? this.tripId,
      category: category ?? this.category,
      itemName: itemName ?? this.itemName,
      isPacked: isPacked ?? this.isPacked,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (tripId.present) {
      map['trip_id'] = Variable<String>(tripId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (itemName.present) {
      map['item_name'] = Variable<String>(itemName.value);
    }
    if (isPacked.present) {
      map['is_packed'] = Variable<bool>(isPacked.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PackingChecklistsCompanion(')
          ..write('id: $id, ')
          ..write('tripId: $tripId, ')
          ..write('category: $category, ')
          ..write('itemName: $itemName, ')
          ..write('isPacked: $isPacked, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTable extends SyncQueue
    with TableInfo<$SyncQueueTable, SyncQueueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entityTypeMeta =
      const VerificationMeta('entityType');
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entityIdMeta =
      const VerificationMeta('entityId');
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
      'entity_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
      'action', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payloadMeta =
      const VerificationMeta('payload');
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
      'payload', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _retryCountMeta =
      const VerificationMeta('retryCount');
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
      'retry_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, entityType, entityId, action, payload, retryCount, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(Insertable<SyncQueueData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
          _entityTypeMeta,
          entityType.isAcceptableOrUnknown(
              data['entity_type']!, _entityTypeMeta));
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(_entityIdMeta,
          entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta));
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action']!, _actionMeta));
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta,
          payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta));
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('retry_count')) {
      context.handle(
          _retryCountMeta,
          retryCount.isAcceptableOrUnknown(
              data['retry_count']!, _retryCountMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      entityId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_id'])!,
      action: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action'])!,
      payload: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload'])!,
      retryCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}retry_count'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $SyncQueueTable createAlias(String alias) {
    return $SyncQueueTable(attachedDatabase, alias);
  }
}

class SyncQueueData extends DataClass implements Insertable<SyncQueueData> {
  final String id;
  final String entityType;
  final String entityId;
  final String action;
  final String payload;
  final int retryCount;
  final DateTime createdAt;
  const SyncQueueData(
      {required this.id,
      required this.entityType,
      required this.entityId,
      required this.action,
      required this.payload,
      required this.retryCount,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['action'] = Variable<String>(action);
    map['payload'] = Variable<String>(payload);
    map['retry_count'] = Variable<int>(retryCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityId: Value(entityId),
      action: Value(action),
      payload: Value(payload),
      retryCount: Value(retryCount),
      createdAt: Value(createdAt),
    );
  }

  factory SyncQueueData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueData(
      id: serializer.fromJson<String>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      action: serializer.fromJson<String>(json['action']),
      payload: serializer.fromJson<String>(json['payload']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'action': serializer.toJson<String>(action),
      'payload': serializer.toJson<String>(payload),
      'retryCount': serializer.toJson<int>(retryCount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SyncQueueData copyWith(
          {String? id,
          String? entityType,
          String? entityId,
          String? action,
          String? payload,
          int? retryCount,
          DateTime? createdAt}) =>
      SyncQueueData(
        id: id ?? this.id,
        entityType: entityType ?? this.entityType,
        entityId: entityId ?? this.entityId,
        action: action ?? this.action,
        payload: payload ?? this.payload,
        retryCount: retryCount ?? this.retryCount,
        createdAt: createdAt ?? this.createdAt,
      );
  SyncQueueData copyWithCompanion(SyncQueueCompanion data) {
    return SyncQueueData(
      id: data.id.present ? data.id.value : this.id,
      entityType:
          data.entityType.present ? data.entityType.value : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      action: data.action.present ? data.action.value : this.action,
      payload: data.payload.present ? data.payload.value : this.payload,
      retryCount:
          data.retryCount.present ? data.retryCount.value : this.retryCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueData(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('action: $action, ')
          ..write('payload: $payload, ')
          ..write('retryCount: $retryCount, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, entityType, entityId, action, payload, retryCount, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueData &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.action == this.action &&
          other.payload == this.payload &&
          other.retryCount == this.retryCount &&
          other.createdAt == this.createdAt);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueData> {
  final Value<String> id;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> action;
  final Value<String> payload;
  final Value<int> retryCount;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const SyncQueueCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.action = const Value.absent(),
    this.payload = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    required String id,
    required String entityType,
    required String entityId,
    required String action,
    required String payload,
    this.retryCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        entityType = Value(entityType),
        entityId = Value(entityId),
        action = Value(action),
        payload = Value(payload);
  static Insertable<SyncQueueData> custom({
    Expression<String>? id,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? action,
    Expression<String>? payload,
    Expression<int>? retryCount,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (action != null) 'action': action,
      if (payload != null) 'payload': payload,
      if (retryCount != null) 'retry_count': retryCount,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncQueueCompanion copyWith(
      {Value<String>? id,
      Value<String>? entityType,
      Value<String>? entityId,
      Value<String>? action,
      Value<String>? payload,
      Value<int>? retryCount,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return SyncQueueCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      action: action ?? this.action,
      payload: payload ?? this.payload,
      retryCount: retryCount ?? this.retryCount,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('action: $action, ')
          ..write('payload: $payload, ')
          ..write('retryCount: $retryCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TripsTable trips = $TripsTable(this);
  late final $LocationsTable locations = $LocationsTable(this);
  late final $LocationConnectorsTable locationConnectors =
      $LocationConnectorsTable(this);
  late final $MomentsTable moments = $MomentsTable(this);
  late final $ExpensesTable expenses = $ExpensesTable(this);
  late final $JournalsTable journals = $JournalsTable(this);
  late final $PackingChecklistsTable packingChecklists =
      $PackingChecklistsTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final TripDao tripDao = TripDao(this as AppDatabase);
  late final LocationDao locationDao = LocationDao(this as AppDatabase);
  late final MomentDao momentDao = MomentDao(this as AppDatabase);
  late final ExpenseDao expenseDao = ExpenseDao(this as AppDatabase);
  late final PackingDao packingDao = PackingDao(this as AppDatabase);
  late final JournalDao journalDao = JournalDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        trips,
        locations,
        locationConnectors,
        moments,
        expenses,
        journals,
        packingChecklists,
        syncQueue
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('trips',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('locations', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('trips',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('location_connectors', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('locations',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('location_connectors', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('locations',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('location_connectors', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('trips',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('moments', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('trips',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('expenses', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('trips',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('journals', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('trips',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('packing_checklists', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$TripsTableCreateCompanionBuilder = TripsCompanion Function({
  required String id,
  required String title,
  required String destination,
  required DateTime startDate,
  required DateTime endDate,
  Value<String?> description,
  Value<int> status,
  Value<int?> totalBudget,
  Value<int> actualSpent,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> syncedToCloud,
  Value<int> rowid,
});
typedef $$TripsTableUpdateCompanionBuilder = TripsCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String> destination,
  Value<DateTime> startDate,
  Value<DateTime> endDate,
  Value<String?> description,
  Value<int> status,
  Value<int?> totalBudget,
  Value<int> actualSpent,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> syncedToCloud,
  Value<int> rowid,
});

final class $$TripsTableReferences
    extends BaseReferences<_$AppDatabase, $TripsTable, Trip> {
  $$TripsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LocationsTable, List<Location>>
      _locationsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.locations,
              aliasName: 'trips__id__locations__trip_id');

  $$LocationsTableProcessedTableManager get locationsRefs {
    final manager = $$LocationsTableTableManager($_db, $_db.locations)
        .filter((f) => f.tripId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_locationsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$LocationConnectorsTable, List<LocationConnector>>
      _locationConnectorsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.locationConnectors,
              aliasName: 'trips__id__location_connectors__trip_id');

  $$LocationConnectorsTableProcessedTableManager get locationConnectorsRefs {
    final manager =
        $$LocationConnectorsTableTableManager($_db, $_db.locationConnectors)
            .filter((f) => f.tripId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_locationConnectorsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$MomentsTable, List<Moment>> _momentsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.moments,
          aliasName: 'trips__id__moments__trip_id');

  $$MomentsTableProcessedTableManager get momentsRefs {
    final manager = $$MomentsTableTableManager($_db, $_db.moments)
        .filter((f) => f.tripId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_momentsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ExpensesTable, List<Expense>> _expensesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.expenses,
          aliasName: 'trips__id__expenses__trip_id');

  $$ExpensesTableProcessedTableManager get expensesRefs {
    final manager = $$ExpensesTableTableManager($_db, $_db.expenses)
        .filter((f) => f.tripId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_expensesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$JournalsTable, List<Journal>> _journalsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.journals,
          aliasName: 'trips__id__journals__trip_id');

  $$JournalsTableProcessedTableManager get journalsRefs {
    final manager = $$JournalsTableTableManager($_db, $_db.journals)
        .filter((f) => f.tripId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_journalsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PackingChecklistsTable, List<PackingChecklist>>
      _packingChecklistsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.packingChecklists,
              aliasName: 'trips__id__packing_checklists__trip_id');

  $$PackingChecklistsTableProcessedTableManager get packingChecklistsRefs {
    final manager =
        $$PackingChecklistsTableTableManager($_db, $_db.packingChecklists)
            .filter((f) => f.tripId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_packingChecklistsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TripsTableFilterComposer extends Composer<_$AppDatabase, $TripsTable> {
  $$TripsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalBudget => $composableBuilder(
      column: $table.totalBudget, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get actualSpent => $composableBuilder(
      column: $table.actualSpent, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get syncedToCloud => $composableBuilder(
      column: $table.syncedToCloud, builder: (column) => ColumnFilters(column));

  Expression<bool> locationsRefs(
      Expression<bool> Function($$LocationsTableFilterComposer f) f) {
    final $$LocationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.locations,
        getReferencedColumn: (t) => t.tripId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LocationsTableFilterComposer(
              $db: $db,
              $table: $db.locations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> locationConnectorsRefs(
      Expression<bool> Function($$LocationConnectorsTableFilterComposer f) f) {
    final $$LocationConnectorsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.locationConnectors,
        getReferencedColumn: (t) => t.tripId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LocationConnectorsTableFilterComposer(
              $db: $db,
              $table: $db.locationConnectors,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> momentsRefs(
      Expression<bool> Function($$MomentsTableFilterComposer f) f) {
    final $$MomentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.moments,
        getReferencedColumn: (t) => t.tripId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MomentsTableFilterComposer(
              $db: $db,
              $table: $db.moments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> expensesRefs(
      Expression<bool> Function($$ExpensesTableFilterComposer f) f) {
    final $$ExpensesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expenses,
        getReferencedColumn: (t) => t.tripId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableFilterComposer(
              $db: $db,
              $table: $db.expenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> journalsRefs(
      Expression<bool> Function($$JournalsTableFilterComposer f) f) {
    final $$JournalsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.journals,
        getReferencedColumn: (t) => t.tripId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$JournalsTableFilterComposer(
              $db: $db,
              $table: $db.journals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> packingChecklistsRefs(
      Expression<bool> Function($$PackingChecklistsTableFilterComposer f) f) {
    final $$PackingChecklistsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.packingChecklists,
        getReferencedColumn: (t) => t.tripId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PackingChecklistsTableFilterComposer(
              $db: $db,
              $table: $db.packingChecklists,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TripsTableOrderingComposer
    extends Composer<_$AppDatabase, $TripsTable> {
  $$TripsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalBudget => $composableBuilder(
      column: $table.totalBudget, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get actualSpent => $composableBuilder(
      column: $table.actualSpent, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get syncedToCloud => $composableBuilder(
      column: $table.syncedToCloud,
      builder: (column) => ColumnOrderings(column));
}

class $$TripsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TripsTable> {
  $$TripsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get totalBudget => $composableBuilder(
      column: $table.totalBudget, builder: (column) => column);

  GeneratedColumn<int> get actualSpent => $composableBuilder(
      column: $table.actualSpent, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get syncedToCloud => $composableBuilder(
      column: $table.syncedToCloud, builder: (column) => column);

  Expression<T> locationsRefs<T extends Object>(
      Expression<T> Function($$LocationsTableAnnotationComposer a) f) {
    final $$LocationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.locations,
        getReferencedColumn: (t) => t.tripId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LocationsTableAnnotationComposer(
              $db: $db,
              $table: $db.locations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> locationConnectorsRefs<T extends Object>(
      Expression<T> Function($$LocationConnectorsTableAnnotationComposer a) f) {
    final $$LocationConnectorsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.locationConnectors,
            getReferencedColumn: (t) => t.tripId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$LocationConnectorsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.locationConnectors,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> momentsRefs<T extends Object>(
      Expression<T> Function($$MomentsTableAnnotationComposer a) f) {
    final $$MomentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.moments,
        getReferencedColumn: (t) => t.tripId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MomentsTableAnnotationComposer(
              $db: $db,
              $table: $db.moments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> expensesRefs<T extends Object>(
      Expression<T> Function($$ExpensesTableAnnotationComposer a) f) {
    final $$ExpensesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expenses,
        getReferencedColumn: (t) => t.tripId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableAnnotationComposer(
              $db: $db,
              $table: $db.expenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> journalsRefs<T extends Object>(
      Expression<T> Function($$JournalsTableAnnotationComposer a) f) {
    final $$JournalsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.journals,
        getReferencedColumn: (t) => t.tripId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$JournalsTableAnnotationComposer(
              $db: $db,
              $table: $db.journals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> packingChecklistsRefs<T extends Object>(
      Expression<T> Function($$PackingChecklistsTableAnnotationComposer a) f) {
    final $$PackingChecklistsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.packingChecklists,
            getReferencedColumn: (t) => t.tripId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PackingChecklistsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.packingChecklists,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$TripsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TripsTable,
    Trip,
    $$TripsTableFilterComposer,
    $$TripsTableOrderingComposer,
    $$TripsTableAnnotationComposer,
    $$TripsTableCreateCompanionBuilder,
    $$TripsTableUpdateCompanionBuilder,
    (Trip, $$TripsTableReferences),
    Trip,
    PrefetchHooks Function(
        {bool locationsRefs,
        bool locationConnectorsRefs,
        bool momentsRefs,
        bool expensesRefs,
        bool journalsRefs,
        bool packingChecklistsRefs})> {
  $$TripsTableTableManager(_$AppDatabase db, $TripsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TripsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TripsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TripsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> destination = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime> endDate = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> status = const Value.absent(),
            Value<int?> totalBudget = const Value.absent(),
            Value<int> actualSpent = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> syncedToCloud = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TripsCompanion(
            id: id,
            title: title,
            destination: destination,
            startDate: startDate,
            endDate: endDate,
            description: description,
            status: status,
            totalBudget: totalBudget,
            actualSpent: actualSpent,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncedToCloud: syncedToCloud,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required String destination,
            required DateTime startDate,
            required DateTime endDate,
            Value<String?> description = const Value.absent(),
            Value<int> status = const Value.absent(),
            Value<int?> totalBudget = const Value.absent(),
            Value<int> actualSpent = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> syncedToCloud = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TripsCompanion.insert(
            id: id,
            title: title,
            destination: destination,
            startDate: startDate,
            endDate: endDate,
            description: description,
            status: status,
            totalBudget: totalBudget,
            actualSpent: actualSpent,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncedToCloud: syncedToCloud,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TripsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {locationsRefs = false,
              locationConnectorsRefs = false,
              momentsRefs = false,
              expensesRefs = false,
              journalsRefs = false,
              packingChecklistsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (locationsRefs) db.locations,
                if (locationConnectorsRefs) db.locationConnectors,
                if (momentsRefs) db.moments,
                if (expensesRefs) db.expenses,
                if (journalsRefs) db.journals,
                if (packingChecklistsRefs) db.packingChecklists
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (locationsRefs)
                    await $_getPrefetchedData<Trip, $TripsTable, Location>(
                        currentTable: table,
                        referencedTable:
                            $$TripsTableReferences._locationsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TripsTableReferences(db, table, p0).locationsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.tripId == item.id),
                        typedResults: items),
                  if (locationConnectorsRefs)
                    await $_getPrefetchedData<Trip, $TripsTable,
                            LocationConnector>(
                        currentTable: table,
                        referencedTable: $$TripsTableReferences
                            ._locationConnectorsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TripsTableReferences(db, table, p0)
                                .locationConnectorsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.tripId == item.id),
                        typedResults: items),
                  if (momentsRefs)
                    await $_getPrefetchedData<Trip, $TripsTable, Moment>(
                        currentTable: table,
                        referencedTable:
                            $$TripsTableReferences._momentsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TripsTableReferences(db, table, p0).momentsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.tripId == item.id),
                        typedResults: items),
                  if (expensesRefs)
                    await $_getPrefetchedData<Trip, $TripsTable, Expense>(
                        currentTable: table,
                        referencedTable:
                            $$TripsTableReferences._expensesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TripsTableReferences(db, table, p0).expensesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.tripId == item.id),
                        typedResults: items),
                  if (journalsRefs)
                    await $_getPrefetchedData<Trip, $TripsTable, Journal>(
                        currentTable: table,
                        referencedTable:
                            $$TripsTableReferences._journalsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TripsTableReferences(db, table, p0).journalsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.tripId == item.id),
                        typedResults: items),
                  if (packingChecklistsRefs)
                    await $_getPrefetchedData<Trip, $TripsTable,
                            PackingChecklist>(
                        currentTable: table,
                        referencedTable: $$TripsTableReferences
                            ._packingChecklistsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TripsTableReferences(db, table, p0)
                                .packingChecklistsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.tripId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TripsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TripsTable,
    Trip,
    $$TripsTableFilterComposer,
    $$TripsTableOrderingComposer,
    $$TripsTableAnnotationComposer,
    $$TripsTableCreateCompanionBuilder,
    $$TripsTableUpdateCompanionBuilder,
    (Trip, $$TripsTableReferences),
    Trip,
    PrefetchHooks Function(
        {bool locationsRefs,
        bool locationConnectorsRefs,
        bool momentsRefs,
        bool expensesRefs,
        bool journalsRefs,
        bool packingChecklistsRefs})>;
typedef $$LocationsTableCreateCompanionBuilder = LocationsCompanion Function({
  required String id,
  required String tripId,
  required String name,
  required String locationType,
  required double latitude,
  required double longitude,
  Value<String?> address,
  Value<String?> notes,
  required int dayNumber,
  required int sequenceInDay,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$LocationsTableUpdateCompanionBuilder = LocationsCompanion Function({
  Value<String> id,
  Value<String> tripId,
  Value<String> name,
  Value<String> locationType,
  Value<double> latitude,
  Value<double> longitude,
  Value<String?> address,
  Value<String?> notes,
  Value<int> dayNumber,
  Value<int> sequenceInDay,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$LocationsTableReferences
    extends BaseReferences<_$AppDatabase, $LocationsTable, Location> {
  $$LocationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TripsTable _tripIdTable(_$AppDatabase db) =>
      db.trips.createAlias('locations__trip_id__trips__id');

  $$TripsTableProcessedTableManager get tripId {
    final $_column = $_itemColumn<String>('trip_id')!;

    final manager = $$TripsTableTableManager($_db, $_db.trips)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tripIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$LocationsTableFilterComposer
    extends Composer<_$AppDatabase, $LocationsTable> {
  $$LocationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get locationType => $composableBuilder(
      column: $table.locationType, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dayNumber => $composableBuilder(
      column: $table.dayNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sequenceInDay => $composableBuilder(
      column: $table.sequenceInDay, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$TripsTableFilterComposer get tripId {
    final $$TripsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableFilterComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LocationsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocationsTable> {
  $$LocationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get locationType => $composableBuilder(
      column: $table.locationType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dayNumber => $composableBuilder(
      column: $table.dayNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sequenceInDay => $composableBuilder(
      column: $table.sequenceInDay,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$TripsTableOrderingComposer get tripId {
    final $$TripsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableOrderingComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LocationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocationsTable> {
  $$LocationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get locationType => $composableBuilder(
      column: $table.locationType, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get dayNumber =>
      $composableBuilder(column: $table.dayNumber, builder: (column) => column);

  GeneratedColumn<int> get sequenceInDay => $composableBuilder(
      column: $table.sequenceInDay, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$TripsTableAnnotationComposer get tripId {
    final $$TripsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableAnnotationComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LocationsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocationsTable,
    Location,
    $$LocationsTableFilterComposer,
    $$LocationsTableOrderingComposer,
    $$LocationsTableAnnotationComposer,
    $$LocationsTableCreateCompanionBuilder,
    $$LocationsTableUpdateCompanionBuilder,
    (Location, $$LocationsTableReferences),
    Location,
    PrefetchHooks Function({bool tripId})> {
  $$LocationsTableTableManager(_$AppDatabase db, $LocationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> tripId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> locationType = const Value.absent(),
            Value<double> latitude = const Value.absent(),
            Value<double> longitude = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> dayNumber = const Value.absent(),
            Value<int> sequenceInDay = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LocationsCompanion(
            id: id,
            tripId: tripId,
            name: name,
            locationType: locationType,
            latitude: latitude,
            longitude: longitude,
            address: address,
            notes: notes,
            dayNumber: dayNumber,
            sequenceInDay: sequenceInDay,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String tripId,
            required String name,
            required String locationType,
            required double latitude,
            required double longitude,
            Value<String?> address = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            required int dayNumber,
            required int sequenceInDay,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LocationsCompanion.insert(
            id: id,
            tripId: tripId,
            name: name,
            locationType: locationType,
            latitude: latitude,
            longitude: longitude,
            address: address,
            notes: notes,
            dayNumber: dayNumber,
            sequenceInDay: sequenceInDay,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$LocationsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({tripId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (tripId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tripId,
                    referencedTable:
                        $$LocationsTableReferences._tripIdTable(db),
                    referencedColumn:
                        $$LocationsTableReferences._tripIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$LocationsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LocationsTable,
    Location,
    $$LocationsTableFilterComposer,
    $$LocationsTableOrderingComposer,
    $$LocationsTableAnnotationComposer,
    $$LocationsTableCreateCompanionBuilder,
    $$LocationsTableUpdateCompanionBuilder,
    (Location, $$LocationsTableReferences),
    Location,
    PrefetchHooks Function({bool tripId})>;
typedef $$LocationConnectorsTableCreateCompanionBuilder
    = LocationConnectorsCompanion Function({
  required String id,
  required String tripId,
  required String fromLocationId,
  required String toLocationId,
  required String transportMode,
  Value<int?> distanceKm,
  Value<int?> durationMinutes,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$LocationConnectorsTableUpdateCompanionBuilder
    = LocationConnectorsCompanion Function({
  Value<String> id,
  Value<String> tripId,
  Value<String> fromLocationId,
  Value<String> toLocationId,
  Value<String> transportMode,
  Value<int?> distanceKm,
  Value<int?> durationMinutes,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

final class $$LocationConnectorsTableReferences extends BaseReferences<
    _$AppDatabase, $LocationConnectorsTable, LocationConnector> {
  $$LocationConnectorsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TripsTable _tripIdTable(_$AppDatabase db) =>
      db.trips.createAlias('location_connectors__trip_id__trips__id');

  $$TripsTableProcessedTableManager get tripId {
    final $_column = $_itemColumn<String>('trip_id')!;

    final manager = $$TripsTableTableManager($_db, $_db.trips)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tripIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $LocationsTable _fromLocationIdTable(_$AppDatabase db) => db.locations
      .createAlias('location_connectors__from_location_id__locations__id');

  $$LocationsTableProcessedTableManager get fromLocationId {
    final $_column = $_itemColumn<String>('from_location_id')!;

    final manager = $$LocationsTableTableManager($_db, $_db.locations)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_fromLocationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $LocationsTable _toLocationIdTable(_$AppDatabase db) => db.locations
      .createAlias('location_connectors__to_location_id__locations__id');

  $$LocationsTableProcessedTableManager get toLocationId {
    final $_column = $_itemColumn<String>('to_location_id')!;

    final manager = $$LocationsTableTableManager($_db, $_db.locations)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_toLocationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$LocationConnectorsTableFilterComposer
    extends Composer<_$AppDatabase, $LocationConnectorsTable> {
  $$LocationConnectorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transportMode => $composableBuilder(
      column: $table.transportMode, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get distanceKm => $composableBuilder(
      column: $table.distanceKm, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$TripsTableFilterComposer get tripId {
    final $$TripsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableFilterComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$LocationsTableFilterComposer get fromLocationId {
    final $$LocationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromLocationId,
        referencedTable: $db.locations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LocationsTableFilterComposer(
              $db: $db,
              $table: $db.locations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$LocationsTableFilterComposer get toLocationId {
    final $$LocationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toLocationId,
        referencedTable: $db.locations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LocationsTableFilterComposer(
              $db: $db,
              $table: $db.locations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LocationConnectorsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocationConnectorsTable> {
  $$LocationConnectorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transportMode => $composableBuilder(
      column: $table.transportMode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get distanceKm => $composableBuilder(
      column: $table.distanceKm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$TripsTableOrderingComposer get tripId {
    final $$TripsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableOrderingComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$LocationsTableOrderingComposer get fromLocationId {
    final $$LocationsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromLocationId,
        referencedTable: $db.locations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LocationsTableOrderingComposer(
              $db: $db,
              $table: $db.locations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$LocationsTableOrderingComposer get toLocationId {
    final $$LocationsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toLocationId,
        referencedTable: $db.locations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LocationsTableOrderingComposer(
              $db: $db,
              $table: $db.locations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LocationConnectorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocationConnectorsTable> {
  $$LocationConnectorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get transportMode => $composableBuilder(
      column: $table.transportMode, builder: (column) => column);

  GeneratedColumn<int> get distanceKm => $composableBuilder(
      column: $table.distanceKm, builder: (column) => column);

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$TripsTableAnnotationComposer get tripId {
    final $$TripsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableAnnotationComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$LocationsTableAnnotationComposer get fromLocationId {
    final $$LocationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromLocationId,
        referencedTable: $db.locations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LocationsTableAnnotationComposer(
              $db: $db,
              $table: $db.locations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$LocationsTableAnnotationComposer get toLocationId {
    final $$LocationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toLocationId,
        referencedTable: $db.locations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LocationsTableAnnotationComposer(
              $db: $db,
              $table: $db.locations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LocationConnectorsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocationConnectorsTable,
    LocationConnector,
    $$LocationConnectorsTableFilterComposer,
    $$LocationConnectorsTableOrderingComposer,
    $$LocationConnectorsTableAnnotationComposer,
    $$LocationConnectorsTableCreateCompanionBuilder,
    $$LocationConnectorsTableUpdateCompanionBuilder,
    (LocationConnector, $$LocationConnectorsTableReferences),
    LocationConnector,
    PrefetchHooks Function(
        {bool tripId, bool fromLocationId, bool toLocationId})> {
  $$LocationConnectorsTableTableManager(
      _$AppDatabase db, $LocationConnectorsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocationConnectorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocationConnectorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocationConnectorsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> tripId = const Value.absent(),
            Value<String> fromLocationId = const Value.absent(),
            Value<String> toLocationId = const Value.absent(),
            Value<String> transportMode = const Value.absent(),
            Value<int?> distanceKm = const Value.absent(),
            Value<int?> durationMinutes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LocationConnectorsCompanion(
            id: id,
            tripId: tripId,
            fromLocationId: fromLocationId,
            toLocationId: toLocationId,
            transportMode: transportMode,
            distanceKm: distanceKm,
            durationMinutes: durationMinutes,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String tripId,
            required String fromLocationId,
            required String toLocationId,
            required String transportMode,
            Value<int?> distanceKm = const Value.absent(),
            Value<int?> durationMinutes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LocationConnectorsCompanion.insert(
            id: id,
            tripId: tripId,
            fromLocationId: fromLocationId,
            toLocationId: toLocationId,
            transportMode: transportMode,
            distanceKm: distanceKm,
            durationMinutes: durationMinutes,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$LocationConnectorsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {tripId = false, fromLocationId = false, toLocationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (tripId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tripId,
                    referencedTable:
                        $$LocationConnectorsTableReferences._tripIdTable(db),
                    referencedColumn:
                        $$LocationConnectorsTableReferences._tripIdTable(db).id,
                  ) as T;
                }
                if (fromLocationId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.fromLocationId,
                    referencedTable: $$LocationConnectorsTableReferences
                        ._fromLocationIdTable(db),
                    referencedColumn: $$LocationConnectorsTableReferences
                        ._fromLocationIdTable(db)
                        .id,
                  ) as T;
                }
                if (toLocationId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.toLocationId,
                    referencedTable: $$LocationConnectorsTableReferences
                        ._toLocationIdTable(db),
                    referencedColumn: $$LocationConnectorsTableReferences
                        ._toLocationIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$LocationConnectorsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LocationConnectorsTable,
    LocationConnector,
    $$LocationConnectorsTableFilterComposer,
    $$LocationConnectorsTableOrderingComposer,
    $$LocationConnectorsTableAnnotationComposer,
    $$LocationConnectorsTableCreateCompanionBuilder,
    $$LocationConnectorsTableUpdateCompanionBuilder,
    (LocationConnector, $$LocationConnectorsTableReferences),
    LocationConnector,
    PrefetchHooks Function(
        {bool tripId, bool fromLocationId, bool toLocationId})>;
typedef $$MomentsTableCreateCompanionBuilder = MomentsCompanion Function({
  required String id,
  required String tripId,
  required int dayNumber,
  required String momentType,
  required String textContent,
  Value<Uint8List?> imageBytes,
  Value<String?> locationTag,
  Value<double?> latitude,
  Value<double?> longitude,
  Value<String?> weather,
  required DateTime recordedAt,
  Value<DateTime> createdAt,
  Value<String> syncStatus,
  Value<int> rowid,
});
typedef $$MomentsTableUpdateCompanionBuilder = MomentsCompanion Function({
  Value<String> id,
  Value<String> tripId,
  Value<int> dayNumber,
  Value<String> momentType,
  Value<String> textContent,
  Value<Uint8List?> imageBytes,
  Value<String?> locationTag,
  Value<double?> latitude,
  Value<double?> longitude,
  Value<String?> weather,
  Value<DateTime> recordedAt,
  Value<DateTime> createdAt,
  Value<String> syncStatus,
  Value<int> rowid,
});

final class $$MomentsTableReferences
    extends BaseReferences<_$AppDatabase, $MomentsTable, Moment> {
  $$MomentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TripsTable _tripIdTable(_$AppDatabase db) =>
      db.trips.createAlias('moments__trip_id__trips__id');

  $$TripsTableProcessedTableManager get tripId {
    final $_column = $_itemColumn<String>('trip_id')!;

    final manager = $$TripsTableTableManager($_db, $_db.trips)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tripIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MomentsTableFilterComposer
    extends Composer<_$AppDatabase, $MomentsTable> {
  $$MomentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dayNumber => $composableBuilder(
      column: $table.dayNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get momentType => $composableBuilder(
      column: $table.momentType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get textContent => $composableBuilder(
      column: $table.textContent, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get imageBytes => $composableBuilder(
      column: $table.imageBytes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get locationTag => $composableBuilder(
      column: $table.locationTag, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get weather => $composableBuilder(
      column: $table.weather, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
      column: $table.recordedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  $$TripsTableFilterComposer get tripId {
    final $$TripsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableFilterComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MomentsTableOrderingComposer
    extends Composer<_$AppDatabase, $MomentsTable> {
  $$MomentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dayNumber => $composableBuilder(
      column: $table.dayNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get momentType => $composableBuilder(
      column: $table.momentType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get textContent => $composableBuilder(
      column: $table.textContent, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get imageBytes => $composableBuilder(
      column: $table.imageBytes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get locationTag => $composableBuilder(
      column: $table.locationTag, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get weather => $composableBuilder(
      column: $table.weather, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
      column: $table.recordedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  $$TripsTableOrderingComposer get tripId {
    final $$TripsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableOrderingComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MomentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MomentsTable> {
  $$MomentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get dayNumber =>
      $composableBuilder(column: $table.dayNumber, builder: (column) => column);

  GeneratedColumn<String> get momentType => $composableBuilder(
      column: $table.momentType, builder: (column) => column);

  GeneratedColumn<String> get textContent => $composableBuilder(
      column: $table.textContent, builder: (column) => column);

  GeneratedColumn<Uint8List> get imageBytes => $composableBuilder(
      column: $table.imageBytes, builder: (column) => column);

  GeneratedColumn<String> get locationTag => $composableBuilder(
      column: $table.locationTag, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get weather =>
      $composableBuilder(column: $table.weather, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
      column: $table.recordedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  $$TripsTableAnnotationComposer get tripId {
    final $$TripsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableAnnotationComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MomentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MomentsTable,
    Moment,
    $$MomentsTableFilterComposer,
    $$MomentsTableOrderingComposer,
    $$MomentsTableAnnotationComposer,
    $$MomentsTableCreateCompanionBuilder,
    $$MomentsTableUpdateCompanionBuilder,
    (Moment, $$MomentsTableReferences),
    Moment,
    PrefetchHooks Function({bool tripId})> {
  $$MomentsTableTableManager(_$AppDatabase db, $MomentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MomentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MomentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MomentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> tripId = const Value.absent(),
            Value<int> dayNumber = const Value.absent(),
            Value<String> momentType = const Value.absent(),
            Value<String> textContent = const Value.absent(),
            Value<Uint8List?> imageBytes = const Value.absent(),
            Value<String?> locationTag = const Value.absent(),
            Value<double?> latitude = const Value.absent(),
            Value<double?> longitude = const Value.absent(),
            Value<String?> weather = const Value.absent(),
            Value<DateTime> recordedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MomentsCompanion(
            id: id,
            tripId: tripId,
            dayNumber: dayNumber,
            momentType: momentType,
            textContent: textContent,
            imageBytes: imageBytes,
            locationTag: locationTag,
            latitude: latitude,
            longitude: longitude,
            weather: weather,
            recordedAt: recordedAt,
            createdAt: createdAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String tripId,
            required int dayNumber,
            required String momentType,
            required String textContent,
            Value<Uint8List?> imageBytes = const Value.absent(),
            Value<String?> locationTag = const Value.absent(),
            Value<double?> latitude = const Value.absent(),
            Value<double?> longitude = const Value.absent(),
            Value<String?> weather = const Value.absent(),
            required DateTime recordedAt,
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MomentsCompanion.insert(
            id: id,
            tripId: tripId,
            dayNumber: dayNumber,
            momentType: momentType,
            textContent: textContent,
            imageBytes: imageBytes,
            locationTag: locationTag,
            latitude: latitude,
            longitude: longitude,
            weather: weather,
            recordedAt: recordedAt,
            createdAt: createdAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$MomentsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({tripId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (tripId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tripId,
                    referencedTable: $$MomentsTableReferences._tripIdTable(db),
                    referencedColumn:
                        $$MomentsTableReferences._tripIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MomentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MomentsTable,
    Moment,
    $$MomentsTableFilterComposer,
    $$MomentsTableOrderingComposer,
    $$MomentsTableAnnotationComposer,
    $$MomentsTableCreateCompanionBuilder,
    $$MomentsTableUpdateCompanionBuilder,
    (Moment, $$MomentsTableReferences),
    Moment,
    PrefetchHooks Function({bool tripId})>;
typedef $$ExpensesTableCreateCompanionBuilder = ExpensesCompanion Function({
  required String id,
  required String tripId,
  required int dayNumber,
  required String name,
  required String category,
  required int amount,
  Value<String?> paymentMethod,
  Value<Uint8List?> receiptImageBytes,
  Value<String?> receiptOcrResult,
  Value<String?> notes,
  required DateTime recordedAt,
  Value<DateTime> createdAt,
  Value<String> syncStatus,
  Value<int> rowid,
});
typedef $$ExpensesTableUpdateCompanionBuilder = ExpensesCompanion Function({
  Value<String> id,
  Value<String> tripId,
  Value<int> dayNumber,
  Value<String> name,
  Value<String> category,
  Value<int> amount,
  Value<String?> paymentMethod,
  Value<Uint8List?> receiptImageBytes,
  Value<String?> receiptOcrResult,
  Value<String?> notes,
  Value<DateTime> recordedAt,
  Value<DateTime> createdAt,
  Value<String> syncStatus,
  Value<int> rowid,
});

final class $$ExpensesTableReferences
    extends BaseReferences<_$AppDatabase, $ExpensesTable, Expense> {
  $$ExpensesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TripsTable _tripIdTable(_$AppDatabase db) =>
      db.trips.createAlias('expenses__trip_id__trips__id');

  $$TripsTableProcessedTableManager get tripId {
    final $_column = $_itemColumn<String>('trip_id')!;

    final manager = $$TripsTableTableManager($_db, $_db.trips)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tripIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ExpensesTableFilterComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dayNumber => $composableBuilder(
      column: $table.dayNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get receiptImageBytes => $composableBuilder(
      column: $table.receiptImageBytes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get receiptOcrResult => $composableBuilder(
      column: $table.receiptOcrResult,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
      column: $table.recordedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  $$TripsTableFilterComposer get tripId {
    final $$TripsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableFilterComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpensesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dayNumber => $composableBuilder(
      column: $table.dayNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get receiptImageBytes => $composableBuilder(
      column: $table.receiptImageBytes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get receiptOcrResult => $composableBuilder(
      column: $table.receiptOcrResult,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
      column: $table.recordedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  $$TripsTableOrderingComposer get tripId {
    final $$TripsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableOrderingComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpensesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get dayNumber =>
      $composableBuilder(column: $table.dayNumber, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<Uint8List> get receiptImageBytes => $composableBuilder(
      column: $table.receiptImageBytes, builder: (column) => column);

  GeneratedColumn<String> get receiptOcrResult => $composableBuilder(
      column: $table.receiptOcrResult, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
      column: $table.recordedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  $$TripsTableAnnotationComposer get tripId {
    final $$TripsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableAnnotationComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpensesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExpensesTable,
    Expense,
    $$ExpensesTableFilterComposer,
    $$ExpensesTableOrderingComposer,
    $$ExpensesTableAnnotationComposer,
    $$ExpensesTableCreateCompanionBuilder,
    $$ExpensesTableUpdateCompanionBuilder,
    (Expense, $$ExpensesTableReferences),
    Expense,
    PrefetchHooks Function({bool tripId})> {
  $$ExpensesTableTableManager(_$AppDatabase db, $ExpensesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpensesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpensesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpensesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> tripId = const Value.absent(),
            Value<int> dayNumber = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<int> amount = const Value.absent(),
            Value<String?> paymentMethod = const Value.absent(),
            Value<Uint8List?> receiptImageBytes = const Value.absent(),
            Value<String?> receiptOcrResult = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> recordedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExpensesCompanion(
            id: id,
            tripId: tripId,
            dayNumber: dayNumber,
            name: name,
            category: category,
            amount: amount,
            paymentMethod: paymentMethod,
            receiptImageBytes: receiptImageBytes,
            receiptOcrResult: receiptOcrResult,
            notes: notes,
            recordedAt: recordedAt,
            createdAt: createdAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String tripId,
            required int dayNumber,
            required String name,
            required String category,
            required int amount,
            Value<String?> paymentMethod = const Value.absent(),
            Value<Uint8List?> receiptImageBytes = const Value.absent(),
            Value<String?> receiptOcrResult = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            required DateTime recordedAt,
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExpensesCompanion.insert(
            id: id,
            tripId: tripId,
            dayNumber: dayNumber,
            name: name,
            category: category,
            amount: amount,
            paymentMethod: paymentMethod,
            receiptImageBytes: receiptImageBytes,
            receiptOcrResult: receiptOcrResult,
            notes: notes,
            recordedAt: recordedAt,
            createdAt: createdAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ExpensesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({tripId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (tripId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tripId,
                    referencedTable: $$ExpensesTableReferences._tripIdTable(db),
                    referencedColumn:
                        $$ExpensesTableReferences._tripIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ExpensesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExpensesTable,
    Expense,
    $$ExpensesTableFilterComposer,
    $$ExpensesTableOrderingComposer,
    $$ExpensesTableAnnotationComposer,
    $$ExpensesTableCreateCompanionBuilder,
    $$ExpensesTableUpdateCompanionBuilder,
    (Expense, $$ExpensesTableReferences),
    Expense,
    PrefetchHooks Function({bool tripId})>;
typedef $$JournalsTableCreateCompanionBuilder = JournalsCompanion Function({
  required String id,
  required String tripId,
  required String title,
  required String content,
  Value<String> style,
  required DateTime generatedAt,
  required DateTime lastEditedAt,
  Value<String?> exportFormats,
  Value<String> syncStatus,
  Value<int> rowid,
});
typedef $$JournalsTableUpdateCompanionBuilder = JournalsCompanion Function({
  Value<String> id,
  Value<String> tripId,
  Value<String> title,
  Value<String> content,
  Value<String> style,
  Value<DateTime> generatedAt,
  Value<DateTime> lastEditedAt,
  Value<String?> exportFormats,
  Value<String> syncStatus,
  Value<int> rowid,
});

final class $$JournalsTableReferences
    extends BaseReferences<_$AppDatabase, $JournalsTable, Journal> {
  $$JournalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TripsTable _tripIdTable(_$AppDatabase db) =>
      db.trips.createAlias('journals__trip_id__trips__id');

  $$TripsTableProcessedTableManager get tripId {
    final $_column = $_itemColumn<String>('trip_id')!;

    final manager = $$TripsTableTableManager($_db, $_db.trips)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tripIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$JournalsTableFilterComposer
    extends Composer<_$AppDatabase, $JournalsTable> {
  $$JournalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get style => $composableBuilder(
      column: $table.style, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastEditedAt => $composableBuilder(
      column: $table.lastEditedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exportFormats => $composableBuilder(
      column: $table.exportFormats, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  $$TripsTableFilterComposer get tripId {
    final $$TripsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableFilterComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$JournalsTableOrderingComposer
    extends Composer<_$AppDatabase, $JournalsTable> {
  $$JournalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get style => $composableBuilder(
      column: $table.style, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastEditedAt => $composableBuilder(
      column: $table.lastEditedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exportFormats => $composableBuilder(
      column: $table.exportFormats,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  $$TripsTableOrderingComposer get tripId {
    final $$TripsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableOrderingComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$JournalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $JournalsTable> {
  $$JournalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get style =>
      $composableBuilder(column: $table.style, builder: (column) => column);

  GeneratedColumn<DateTime> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastEditedAt => $composableBuilder(
      column: $table.lastEditedAt, builder: (column) => column);

  GeneratedColumn<String> get exportFormats => $composableBuilder(
      column: $table.exportFormats, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  $$TripsTableAnnotationComposer get tripId {
    final $$TripsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableAnnotationComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$JournalsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $JournalsTable,
    Journal,
    $$JournalsTableFilterComposer,
    $$JournalsTableOrderingComposer,
    $$JournalsTableAnnotationComposer,
    $$JournalsTableCreateCompanionBuilder,
    $$JournalsTableUpdateCompanionBuilder,
    (Journal, $$JournalsTableReferences),
    Journal,
    PrefetchHooks Function({bool tripId})> {
  $$JournalsTableTableManager(_$AppDatabase db, $JournalsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JournalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JournalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JournalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> tripId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<String> style = const Value.absent(),
            Value<DateTime> generatedAt = const Value.absent(),
            Value<DateTime> lastEditedAt = const Value.absent(),
            Value<String?> exportFormats = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              JournalsCompanion(
            id: id,
            tripId: tripId,
            title: title,
            content: content,
            style: style,
            generatedAt: generatedAt,
            lastEditedAt: lastEditedAt,
            exportFormats: exportFormats,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String tripId,
            required String title,
            required String content,
            Value<String> style = const Value.absent(),
            required DateTime generatedAt,
            required DateTime lastEditedAt,
            Value<String?> exportFormats = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              JournalsCompanion.insert(
            id: id,
            tripId: tripId,
            title: title,
            content: content,
            style: style,
            generatedAt: generatedAt,
            lastEditedAt: lastEditedAt,
            exportFormats: exportFormats,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$JournalsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({tripId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (tripId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tripId,
                    referencedTable: $$JournalsTableReferences._tripIdTable(db),
                    referencedColumn:
                        $$JournalsTableReferences._tripIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$JournalsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $JournalsTable,
    Journal,
    $$JournalsTableFilterComposer,
    $$JournalsTableOrderingComposer,
    $$JournalsTableAnnotationComposer,
    $$JournalsTableCreateCompanionBuilder,
    $$JournalsTableUpdateCompanionBuilder,
    (Journal, $$JournalsTableReferences),
    Journal,
    PrefetchHooks Function({bool tripId})>;
typedef $$PackingChecklistsTableCreateCompanionBuilder
    = PackingChecklistsCompanion Function({
  required String id,
  required String tripId,
  required String category,
  required String itemName,
  Value<bool> isPacked,
  required int sortOrder,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$PackingChecklistsTableUpdateCompanionBuilder
    = PackingChecklistsCompanion Function({
  Value<String> id,
  Value<String> tripId,
  Value<String> category,
  Value<String> itemName,
  Value<bool> isPacked,
  Value<int> sortOrder,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

final class $$PackingChecklistsTableReferences extends BaseReferences<
    _$AppDatabase, $PackingChecklistsTable, PackingChecklist> {
  $$PackingChecklistsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TripsTable _tripIdTable(_$AppDatabase db) =>
      db.trips.createAlias('packing_checklists__trip_id__trips__id');

  $$TripsTableProcessedTableManager get tripId {
    final $_column = $_itemColumn<String>('trip_id')!;

    final manager = $$TripsTableTableManager($_db, $_db.trips)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tripIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PackingChecklistsTableFilterComposer
    extends Composer<_$AppDatabase, $PackingChecklistsTable> {
  $$PackingChecklistsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get itemName => $composableBuilder(
      column: $table.itemName, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPacked => $composableBuilder(
      column: $table.isPacked, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$TripsTableFilterComposer get tripId {
    final $$TripsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableFilterComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PackingChecklistsTableOrderingComposer
    extends Composer<_$AppDatabase, $PackingChecklistsTable> {
  $$PackingChecklistsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get itemName => $composableBuilder(
      column: $table.itemName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPacked => $composableBuilder(
      column: $table.isPacked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$TripsTableOrderingComposer get tripId {
    final $$TripsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableOrderingComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PackingChecklistsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PackingChecklistsTable> {
  $$PackingChecklistsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get itemName =>
      $composableBuilder(column: $table.itemName, builder: (column) => column);

  GeneratedColumn<bool> get isPacked =>
      $composableBuilder(column: $table.isPacked, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$TripsTableAnnotationComposer get tripId {
    final $$TripsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableAnnotationComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PackingChecklistsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PackingChecklistsTable,
    PackingChecklist,
    $$PackingChecklistsTableFilterComposer,
    $$PackingChecklistsTableOrderingComposer,
    $$PackingChecklistsTableAnnotationComposer,
    $$PackingChecklistsTableCreateCompanionBuilder,
    $$PackingChecklistsTableUpdateCompanionBuilder,
    (PackingChecklist, $$PackingChecklistsTableReferences),
    PackingChecklist,
    PrefetchHooks Function({bool tripId})> {
  $$PackingChecklistsTableTableManager(
      _$AppDatabase db, $PackingChecklistsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PackingChecklistsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PackingChecklistsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PackingChecklistsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> tripId = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> itemName = const Value.absent(),
            Value<bool> isPacked = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PackingChecklistsCompanion(
            id: id,
            tripId: tripId,
            category: category,
            itemName: itemName,
            isPacked: isPacked,
            sortOrder: sortOrder,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String tripId,
            required String category,
            required String itemName,
            Value<bool> isPacked = const Value.absent(),
            required int sortOrder,
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PackingChecklistsCompanion.insert(
            id: id,
            tripId: tripId,
            category: category,
            itemName: itemName,
            isPacked: isPacked,
            sortOrder: sortOrder,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PackingChecklistsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({tripId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (tripId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tripId,
                    referencedTable:
                        $$PackingChecklistsTableReferences._tripIdTable(db),
                    referencedColumn:
                        $$PackingChecklistsTableReferences._tripIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PackingChecklistsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PackingChecklistsTable,
    PackingChecklist,
    $$PackingChecklistsTableFilterComposer,
    $$PackingChecklistsTableOrderingComposer,
    $$PackingChecklistsTableAnnotationComposer,
    $$PackingChecklistsTableCreateCompanionBuilder,
    $$PackingChecklistsTableUpdateCompanionBuilder,
    (PackingChecklist, $$PackingChecklistsTableReferences),
    PackingChecklist,
    PrefetchHooks Function({bool tripId})>;
typedef $$SyncQueueTableCreateCompanionBuilder = SyncQueueCompanion Function({
  required String id,
  required String entityType,
  required String entityId,
  required String action,
  required String payload,
  Value<int> retryCount,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$SyncQueueTableUpdateCompanionBuilder = SyncQueueCompanion Function({
  Value<String> id,
  Value<String> entityType,
  Value<String> entityId,
  Value<String> action,
  Value<String> payload,
  Value<int> retryCount,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$SyncQueueTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$SyncQueueTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$SyncQueueTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => column);

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SyncQueueTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SyncQueueTable,
    SyncQueueData,
    $$SyncQueueTableFilterComposer,
    $$SyncQueueTableOrderingComposer,
    $$SyncQueueTableAnnotationComposer,
    $$SyncQueueTableCreateCompanionBuilder,
    $$SyncQueueTableUpdateCompanionBuilder,
    (
      SyncQueueData,
      BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>
    ),
    SyncQueueData,
    PrefetchHooks Function()> {
  $$SyncQueueTableTableManager(_$AppDatabase db, $SyncQueueTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> entityType = const Value.absent(),
            Value<String> entityId = const Value.absent(),
            Value<String> action = const Value.absent(),
            Value<String> payload = const Value.absent(),
            Value<int> retryCount = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SyncQueueCompanion(
            id: id,
            entityType: entityType,
            entityId: entityId,
            action: action,
            payload: payload,
            retryCount: retryCount,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String entityType,
            required String entityId,
            required String action,
            required String payload,
            Value<int> retryCount = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SyncQueueCompanion.insert(
            id: id,
            entityType: entityType,
            entityId: entityId,
            action: action,
            payload: payload,
            retryCount: retryCount,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncQueueTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SyncQueueTable,
    SyncQueueData,
    $$SyncQueueTableFilterComposer,
    $$SyncQueueTableOrderingComposer,
    $$SyncQueueTableAnnotationComposer,
    $$SyncQueueTableCreateCompanionBuilder,
    $$SyncQueueTableUpdateCompanionBuilder,
    (
      SyncQueueData,
      BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>
    ),
    SyncQueueData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TripsTableTableManager get trips =>
      $$TripsTableTableManager(_db, _db.trips);
  $$LocationsTableTableManager get locations =>
      $$LocationsTableTableManager(_db, _db.locations);
  $$LocationConnectorsTableTableManager get locationConnectors =>
      $$LocationConnectorsTableTableManager(_db, _db.locationConnectors);
  $$MomentsTableTableManager get moments =>
      $$MomentsTableTableManager(_db, _db.moments);
  $$ExpensesTableTableManager get expenses =>
      $$ExpensesTableTableManager(_db, _db.expenses);
  $$JournalsTableTableManager get journals =>
      $$JournalsTableTableManager(_db, _db.journals);
  $$PackingChecklistsTableTableManager get packingChecklists =>
      $$PackingChecklistsTableTableManager(_db, _db.packingChecklists);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
}
