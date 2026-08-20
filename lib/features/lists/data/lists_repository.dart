import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/db/daos/lists_dao.dart';
import '../../../core/db/database.dart';
import '../../../shared/models/list_sort_preference.dart';
import '../../../shared/models/media_type.dart';

/// A thin wrapper over [ListsDao]. The DAO already enforces every invariant
/// that matters (idempotent membership, per-list sort, cascade delete); this
/// layer exists so the UI depends on one interface, swappable in tests.
class ListsRepository {
  ListsRepository({required ListsDao lists}) : _lists = lists;

  final ListsDao _lists;

  Stream<List<ListWithCount>> watchListsWithCounts() =>
      _lists.watchListsWithCounts();

  Stream<UserList?> watchById(int id) => _lists.watchById(id);

  Stream<List<ListItem>> watchItems(
    int listId,
    ListSortPreference preference,
  ) =>
      _lists.watchItems(listId, preference);

  Future<int> createList(String name, {String? description}) =>
      _lists.createList(name, description: description);

  Future<int> renameList(int id, String name) => _lists.renameList(id, name);

  Future<int> setDescription(int id, String? description) =>
      _lists.setDescription(id, description);

  Future<int> setSortPreference(int id, ListSortPreference preference) =>
      _lists.setSortPreference(id, preference);

  Future<int> deleteList(int id) => _lists.deleteList(id);

  Future<void> addItem(
    int listId,
    int tmdbId,
    MediaType mediaType, {
    String? notes,
  }) =>
      _lists.addItem(listId, tmdbId, mediaType, notes: notes);

  Future<int> removeItem(int listId, int tmdbId, MediaType mediaType) =>
      _lists.removeItem(listId, tmdbId, mediaType);

  Future<int> setItemNotes(
    int listId,
    int tmdbId,
    MediaType mediaType,
    String? notes,
  ) =>
      _lists.setItemNotes(listId, tmdbId, mediaType, notes);

  Future<void> reorderItems(int listId, List<(int, MediaType)> orderedKeys) =>
      _lists.reorderItems(listId, orderedKeys);

  Stream<Set<int>> watchListIdsContaining(int tmdbId, MediaType mediaType) =>
      _lists.watchListIdsContaining(tmdbId, mediaType);
}

final listsRepositoryProvider = Provider<ListsRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return ListsRepository(lists: db.listsDao);
});
