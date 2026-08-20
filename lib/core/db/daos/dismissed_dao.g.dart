// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dismissed_dao.dart';

// ignore_for_file: type=lint
mixin _$DismissedDaoMixin on DatabaseAccessor<AppDatabase> {
  $DismissedTable get dismissed => attachedDatabase.dismissed;
  DismissedDaoManager get managers => DismissedDaoManager(this);
}

class DismissedDaoManager {
  final _$DismissedDaoMixin _db;
  DismissedDaoManager(this._db);
  $$DismissedTableTableManager get dismissed =>
      $$DismissedTableTableManager(_db.attachedDatabase, _db.dismissed);
}
