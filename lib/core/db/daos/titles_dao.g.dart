// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'titles_dao.dart';

// ignore_for_file: type=lint
mixin _$TitlesDaoMixin on DatabaseAccessor<AppDatabase> {
  $TitlesTable get titles => attachedDatabase.titles;
  TitlesDaoManager get managers => TitlesDaoManager(this);
}

class TitlesDaoManager {
  final _$TitlesDaoMixin _db;
  TitlesDaoManager(this._db);
  $$TitlesTableTableManager get titles =>
      $$TitlesTableTableManager(_db.attachedDatabase, _db.titles);
}
