// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_dao.dart';

// ignore_for_file: type=lint
mixin _$LibraryDaoMixin on DatabaseAccessor<AppDatabase> {
  $LibraryEntriesTable get libraryEntries => attachedDatabase.libraryEntries;
  $TitlesTable get titles => attachedDatabase.titles;
  LibraryDaoManager get managers => LibraryDaoManager(this);
}

class LibraryDaoManager {
  final _$LibraryDaoMixin _db;
  LibraryDaoManager(this._db);
  $$LibraryEntriesTableTableManager get libraryEntries =>
      $$LibraryEntriesTableTableManager(
        _db.attachedDatabase,
        _db.libraryEntries,
      );
  $$TitlesTableTableManager get titles =>
      $$TitlesTableTableManager(_db.attachedDatabase, _db.titles);
}
