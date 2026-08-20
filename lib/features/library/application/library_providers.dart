import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/db/daos/library_dao.dart';
import '../../../core/db/database.dart';
import '../../../shared/models/entry_status.dart';
import '../../../shared/models/library_sort.dart';
import '../../../shared/models/media_type.dart';
import '../data/library_repository.dart';

/// The active status filter chip. Null means "all statuses".
class LibraryStatusFilter extends Notifier<EntryStatus?> {
  @override
  EntryStatus? build() => null;

  void set(EntryStatus? status) => state = status;
}

final libraryStatusProvider =
    NotifierProvider<LibraryStatusFilter, EntryStatus?>(
  LibraryStatusFilter.new,
);

class LibrarySortState extends Notifier<LibrarySort> {
  @override
  LibrarySort build() => LibrarySort.dateAdded;

  void set(LibrarySort sort) => state = sort;
}

final librarySortProvider =
    NotifierProvider<LibrarySortState, LibrarySort>(LibrarySortState.new);

class LibrarySearchQuery extends Notifier<String> {
  @override
  String build() => '';

  void set(String query) => state = query;

  void clear() => state = '';
}

final librarySearchProvider =
    NotifierProvider<LibrarySearchQuery, String>(LibrarySearchQuery.new);

/// The library list, live-filtered/sorted/searched entirely in SQLite.
final libraryItemsProvider =
    StreamProvider.autoDispose<List<LibraryItem>>((ref) {
  final status = ref.watch(libraryStatusProvider);
  final sort = ref.watch(librarySortProvider);
  final query = ref.watch(librarySearchProvider);

  return ref
      .watch(libraryRepositoryProvider)
      .watchLibrary(status: status, sort: sort, query: query);
});

/// Counts per status, for the filter chips — independent of the current
/// filter, so a chip never has to guess its own count from a filtered list.
final libraryStatusCountsProvider =
    StreamProvider.autoDispose<Map<EntryStatus, int>>((ref) {
  return ref.watch(libraryRepositoryProvider).watchStatusCounts();
});

/// Whether/how a single title is tracked. Used by title detail's "Add to
/// library" button and the entry detail sheet.
final libraryEntryProvider = StreamProvider.autoDispose
    .family<LibraryEntry?, ({int id, MediaType mediaType})>((ref, key) {
  return ref
      .watch(libraryRepositoryProvider)
      .watchByKey(key.id, key.mediaType);
});

final isDismissedProvider = StreamProvider.autoDispose
    .family<bool, ({int id, MediaType mediaType})>((ref, key) {
  return ref
      .watch(libraryRepositoryProvider)
      .watchIsDismissed(key.id, key.mediaType);
});
