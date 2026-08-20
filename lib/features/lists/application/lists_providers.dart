import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/db/daos/lists_dao.dart';
import '../../../core/db/database.dart';
import '../../../shared/models/list_sort_preference.dart';
import '../../../shared/models/media_type.dart';
import '../data/lists_repository.dart';

final listsProvider = StreamProvider.autoDispose<List<ListWithCount>>((ref) {
  return ref.watch(listsRepositoryProvider).watchListsWithCounts();
});

final listProvider =
    StreamProvider.autoDispose.family<UserList?, int>((ref, id) {
  return ref.watch(listsRepositoryProvider).watchById(id);
});

/// Items for a list, sorted by that list's own preference — read from the
/// list itself so the items view and the sort choice can never drift apart.
final listItemsProvider =
    StreamProvider.autoDispose.family<List<ListItem>, int>((ref, listId) {
  final list = ref.watch(listProvider(listId)).value;
  final preference = list?.sortPreference ?? ListSortPreference.manual;
  return ref.watch(listsRepositoryProvider).watchItems(listId, preference);
});

/// Which lists a title already belongs to — drives the checkboxes in the
/// "add to list" picker.
final listIdsContainingProvider = StreamProvider.autoDispose
    .family<Set<int>, ({int id, MediaType mediaType})>((ref, key) {
  return ref
      .watch(listsRepositoryProvider)
      .watchListIdsContaining(key.id, key.mediaType);
});
