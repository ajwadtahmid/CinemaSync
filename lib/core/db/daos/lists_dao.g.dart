// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_dao.dart';

// ignore_for_file: type=lint
mixin _$ListsDaoMixin on DatabaseAccessor<AppDatabase> {
  $UserListsTable get userLists => attachedDatabase.userLists;
  $UserListItemsTable get userListItems => attachedDatabase.userListItems;
  $TitlesTable get titles => attachedDatabase.titles;
  ListsDaoManager get managers => ListsDaoManager(this);
}

class ListsDaoManager {
  final _$ListsDaoMixin _db;
  ListsDaoManager(this._db);
  $$UserListsTableTableManager get userLists =>
      $$UserListsTableTableManager(_db.attachedDatabase, _db.userLists);
  $$UserListItemsTableTableManager get userListItems =>
      $$UserListItemsTableTableManager(_db.attachedDatabase, _db.userListItems);
  $$TitlesTableTableManager get titles =>
      $$TitlesTableTableManager(_db.attachedDatabase, _db.titles);
}
