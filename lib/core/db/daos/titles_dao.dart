import 'package:drift/drift.dart';

import '../../../shared/models/media_type.dart';
import '../database.dart';
import '../tables.dart';

part 'titles_dao.g.dart';

/// Reads and writes the local cache of TMDB title metadata.
///
/// This table is a cache and may be cleared at any time without data loss —
/// unlike everything else in this database, which is the source of truth.
@DriftAccessor(tables: [Titles])
class TitlesDao extends DatabaseAccessor<AppDatabase> with _$TitlesDaoMixin {
  TitlesDao(super.db);

  /// Caches metadata for titles the user has actually encountered. Existing
  /// rows are replaced so a refetch refreshes stale fields.
  Future<void> upsertAll(Iterable<TitlesCompanion> entries) async {
    await batch((b) => b.insertAllOnConflictUpdate(titles, entries.toList()));
  }

  Future<Title?> byKey(int tmdbId, MediaType mediaType) {
    return (select(titles)
          ..where(
              (t) => t.tmdbId.equals(tmdbId) & t.mediaType.equalsValue(mediaType)))
        .getSingleOrNull();
  }

  Stream<Title?> watchByKey(int tmdbId, MediaType mediaType) {
    return (select(titles)
          ..where(
              (t) => t.tmdbId.equals(tmdbId) & t.mediaType.equalsValue(mediaType)))
        .watchSingleOrNull();
  }

  /// Drops cache rows older than [cutoff]. Never touches user data.
  Future<int> evictOlderThan(DateTime cutoff) {
    return (delete(titles)..where((t) => t.cachedAt.isSmallerThanValue(cutoff)))
        .go();
  }
}
