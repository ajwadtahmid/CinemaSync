import 'package:drift/drift.dart';

import '../../../shared/models/list_sort_preference.dart';
import '../../../shared/models/media_type.dart';
import '../database.dart';
import '../tables.dart';

part 'lists_dao.g.dart';

/// A list item together with whatever TMDB metadata is cached for it.
///
/// [title] may be null for the same reason as in the library: the cache is a
/// cache, and an imported row can exist before its metadata is fetched.
typedef ListItem = ({UserListItem item, Title? title});

/// A list plus how many titles are on it, for the index screen.
typedef ListWithCount = ({UserList list, int itemCount});

/// User-defined lists.
///
/// Richer than a plain collection of ids: each list carries its own ordering
/// preference, and each membership can carry a note explaining why the title
/// is on *this* list — a different thing from the note on the library entry,
/// which is about the title itself.
@DriftAccessor(tables: [UserLists, UserListItems, Titles])
class ListsDao extends DatabaseAccessor<AppDatabase> with _$ListsDaoMixin {
  ListsDao(super.db);

  // ---- lists ----

  Stream<List<UserList>> watchLists() {
    return (select(userLists)
          ..orderBy([
            (l) => OrderingTerm.asc(l.sortOrder),
            (l) => OrderingTerm.asc(l.createdAt),
          ]))
        .watch();
  }

  /// Lists with their item counts, in one query rather than N+1.
  Stream<List<ListWithCount>> watchListsWithCounts() {
    final count = userListItems.tmdbId.count();
    final query = select(userLists).join([
      leftOuterJoin(
        userListItems,
        userListItems.listId.equalsExp(userLists.id),
      ),
    ])
      ..addColumns([count])
      ..groupBy([userLists.id])
      ..orderBy([
        OrderingTerm.asc(userLists.sortOrder),
        OrderingTerm.asc(userLists.createdAt),
      ]);

    return query.watch().map(
          (rows) => rows
              .map(
                (row) => (
                  list: row.readTable(userLists),
                  itemCount: row.read(count) ?? 0,
                ),
              )
              .toList(),
        );
  }

  Future<UserList?> byId(int id) {
    return (select(userLists)..where((l) => l.id.equals(id))).getSingleOrNull();
  }

  Stream<UserList?> watchById(int id) {
    return (select(userLists)..where((l) => l.id.equals(id)))
        .watchSingleOrNull();
  }

  /// Creates a list, appended after any existing ones.
  Future<int> createList(String name, {String? description}) async {
    final maxOrder = userLists.sortOrder.max();
    final row =
        await (selectOnly(userLists)..addColumns([maxOrder])).getSingle();

    final trimmedDescription = description?.trim();
    return into(userLists).insert(
      UserListsCompanion.insert(
        name: name.trim(),
        description: Value(
          trimmedDescription == null || trimmedDescription.isEmpty
              ? null
              : trimmedDescription,
        ),
        sortOrder: Value((row.read(maxOrder) ?? -1) + 1),
        createdAt: DateTime.now().toUtc(),
      ),
    );
  }

  Future<int> renameList(int id, String name) {
    return (update(userLists)..where((l) => l.id.equals(id)))
        .write(UserListsCompanion(name: Value(name.trim())));
  }

  Future<int> setDescription(int id, String? description) {
    final trimmed = description?.trim();
    return (update(userLists)..where((l) => l.id.equals(id))).write(
      UserListsCompanion(
        description: Value(trimmed == null || trimmed.isEmpty ? null : trimmed),
      ),
    );
  }

  /// Each list orders itself; changing one never affects another.
  Future<int> setSortPreference(int id, ListSortPreference preference) {
    return (update(userLists)..where((l) => l.id.equals(id)))
        .write(UserListsCompanion(sortPreference: Value(preference)));
  }

  /// Reorders the lists themselves. [orderedIds] is the full desired order.
  Future<void> reorderLists(List<int> orderedIds) {
    return transaction(() async {
      for (var i = 0; i < orderedIds.length; i++) {
        await (update(userLists)..where((l) => l.id.equals(orderedIds[i])))
            .write(UserListsCompanion(sortOrder: Value(i)));
      }
    });
  }

  /// Deletes a list. Its items go with it via ON DELETE CASCADE, which only
  /// fires because `PRAGMA foreign_keys` is enabled in the database's
  /// `beforeOpen`.
  Future<int> deleteList(int id) {
    return (delete(userLists)..where((l) => l.id.equals(id))).go();
  }

  // ---- items ----

  /// Items on a list, ordered by that list's own preference.
  ///
  /// Sorting happens in SQL so a long list stays responsive. Rows whose sort
  /// key is missing sink to the bottom rather than vanishing — an uncached or
  /// unrated title is still on the list.
  Stream<List<ListItem>> watchItems(int listId, ListSortPreference preference) {
    final query = select(userListItems).join([
      leftOuterJoin(
        titles,
        titles.tmdbId.equalsExp(userListItems.tmdbId) &
            titles.mediaType.equalsExp(userListItems.mediaType),
      ),
    ])
      ..where(userListItems.listId.equals(listId));

    query.orderBy(switch (preference) {
      ListSortPreference.manual => [OrderingTerm.asc(userListItems.position)],
      // Position is append-ordered, so descending position is newest-first.
      ListSortPreference.dateAdded => [
          OrderingTerm.desc(userListItems.position),
        ],
      ListSortPreference.title => [OrderingTerm.asc(titles.title)],
      ListSortPreference.rating => [
          OrderingTerm(
            expression: titles.voteAverage.isNull(),
            mode: OrderingMode.asc,
          ),
          OrderingTerm.desc(titles.voteAverage),
        ],
      ListSortPreference.releaseYear => [
          OrderingTerm(
            expression: titles.year.isNull(),
            mode: OrderingMode.asc,
          ),
          OrderingTerm.desc(titles.year),
        ],
    });

    return query.watch().map(
          (rows) => rows
              .map(
                (row) => (
                  item: row.readTable(userListItems),
                  title: row.readTableOrNull(titles),
                ),
              )
              .toList(),
        );
  }

  /// Adds a title to a list, appended. Idempotent — adding twice updates the
  /// note rather than creating a duplicate row.
  Future<void> addItem(
    int listId,
    int tmdbId,
    MediaType mediaType, {
    String? notes,
  }) async {
    final maxPosition = userListItems.position.max();
    final row = await (selectOnly(userListItems)
          ..addColumns([maxPosition])
          ..where(userListItems.listId.equals(listId)))
        .getSingle();

    final trimmed = notes?.trim();
    await into(userListItems).insertOnConflictUpdate(
      UserListItemsCompanion.insert(
        listId: listId,
        tmdbId: tmdbId,
        mediaType: mediaType,
        position: (row.read(maxPosition) ?? -1) + 1,
        notes: Value(trimmed == null || trimmed.isEmpty ? null : trimmed),
      ),
    );
  }

  Future<int> removeItem(int listId, int tmdbId, MediaType mediaType) {
    return (delete(userListItems)
          ..where((i) =>
              i.listId.equals(listId) &
              i.tmdbId.equals(tmdbId) &
              i.mediaType.equalsValue(mediaType)))
        .go();
  }

  /// Why this title is on this list — distinct from the library entry's note,
  /// which is about the title itself.
  Future<int> setItemNotes(
    int listId,
    int tmdbId,
    MediaType mediaType,
    String? notes,
  ) {
    final trimmed = notes?.trim();
    return (update(userListItems)
          ..where((i) =>
              i.listId.equals(listId) &
              i.tmdbId.equals(tmdbId) &
              i.mediaType.equalsValue(mediaType)))
        .write(
      UserListItemsCompanion(
        notes: Value(trimmed == null || trimmed.isEmpty ? null : trimmed),
      ),
    );
  }

  /// Reorders items within a list. [orderedKeys] is the full desired order.
  Future<void> reorderItems(
    int listId,
    List<(int tmdbId, MediaType mediaType)> orderedKeys,
  ) {
    return transaction(() async {
      for (var i = 0; i < orderedKeys.length; i++) {
        final (tmdbId, mediaType) = orderedKeys[i];
        await (update(userListItems)
              ..where((item) =>
                  item.listId.equals(listId) &
                  item.tmdbId.equals(tmdbId) &
                  item.mediaType.equalsValue(mediaType)))
            .write(UserListItemsCompanion(position: Value(i)));
      }
    });
  }

  /// Which lists a title already belongs to, for the "add to list" picker.
  Stream<Set<int>> watchListIdsContaining(int tmdbId, MediaType mediaType) {
    return (select(userListItems)
          ..where((i) =>
              i.tmdbId.equals(tmdbId) & i.mediaType.equalsValue(mediaType)))
        .watch()
        .map((rows) => rows.map((r) => r.listId).toSet());
  }
}
