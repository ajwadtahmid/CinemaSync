import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/db/daos/dismissed_dao.dart';
import '../../../core/db/daos/library_dao.dart';
import '../../../core/db/database.dart';
import '../../../shared/models/entry_status.dart';
import '../../../shared/models/library_sort.dart';
import '../../../shared/models/media_type.dart';

/// Reads and writes the user's library.
///
/// A thin wrapper over [LibraryDao] and [DismissedDao] — the DAOs already
/// enforce every invariant that matters (the rating scale, `updatedAt`,
/// idempotent dismissal). This layer exists so the UI depends on one
/// interface rather than two DAOs, and so it can be swapped out in tests.
class LibraryRepository {
  LibraryRepository({
    required LibraryDao library,
    required DismissedDao dismissed,
  })  : _library = library,
        _dismissed = dismissed;

  final LibraryDao _library;
  final DismissedDao _dismissed;

  Stream<List<LibraryItem>> watchLibrary({
    EntryStatus? status,
    LibrarySort sort = LibrarySort.dateAdded,
    String? query,
  }) {
    return _library.watchLibrary(status: status, sort: sort, query: query);
  }

  Stream<LibraryEntry?> watchByKey(int tmdbId, MediaType mediaType) {
    return _library.watchByKey(tmdbId, mediaType);
  }

  Stream<Map<EntryStatus, int>> watchStatusCounts() {
    return _library.watchStatusCounts();
  }

  Future<void> add(
    int tmdbId,
    MediaType mediaType, {
    EntryStatus status = EntryStatus.watchlist,
  }) {
    return _library.add(tmdbId, mediaType, status: status);
  }

  Future<int> setStatus(int id, EntryStatus status) {
    return _library.setStatus(id, status);
  }

  Future<int> setRating(int id, double? rating) {
    return _library.setRating(id, rating);
  }

  Future<int> setWatchedAt(int id, DateTime? watchedAt) {
    return _library.setWatchedAt(id, watchedAt);
  }

  Future<int> setNotes(int id, String? notes) {
    return _library.setNotes(id, notes);
  }

  Future<int> setRewatchCount(int id, int count) {
    return _library.setRewatchCount(id, count);
  }

  Future<int> removeFromLibrary(int id) {
    return _library.deleteEntry(id);
  }

  // ---- dismiss ----
  //
  // Kept on this repository rather than a separate one: from the UI's
  // perspective, dismissing and adding-to-library are the same kind of
  // decision about a title, just opposite ends of it.

  Future<void> dismiss(int tmdbId, MediaType mediaType) {
    return _dismissed.dismiss(tmdbId, mediaType);
  }

  Future<void> undismiss(int tmdbId, MediaType mediaType) {
    return _dismissed.undismiss(tmdbId, mediaType);
  }

  Stream<bool> watchIsDismissed(int tmdbId, MediaType mediaType) {
    return _dismissed.watchIsDismissed(tmdbId, mediaType);
  }
}

final libraryRepositoryProvider = Provider<LibraryRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return LibraryRepository(library: db.libraryDao, dismissed: db.dismissedDao);
});
