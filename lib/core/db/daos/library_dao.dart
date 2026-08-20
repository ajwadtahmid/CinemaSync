import 'package:drift/drift.dart';

import '../../../shared/models/entry_status.dart';
import '../../../shared/models/library_sort.dart';
import '../../../shared/models/media_type.dart';
import '../database.dart';
import '../tables.dart';

part 'library_dao.g.dart';

/// Thrown when a rating is not on the 0.5–10 half-step scale.
///
/// Rejecting is deliberate: rounding an out-of-scale rating would silently
/// corrupt an imported history, which is the opposite of the app's promise.
class InvalidRatingException implements Exception {
  const InvalidRatingException(this.rating);

  final double rating;

  @override
  String toString() =>
      'Rating $rating is not on the 0.5–10 scale in half steps.';
}

/// A library entry together with whatever TMDB metadata is cached for it.
///
/// The entry is the source of truth and always exists; [title] is a cache and
/// may be null if the row was written before its metadata was fetched (an
/// import can do this). The UI must degrade rather than assume it is present.
typedef LibraryItem = ({LibraryEntry entry, Title? title});

/// Reads and writes the user's library. This is the source of truth.
@DriftAccessor(tables: [LibraryEntries, Titles])
class LibraryDao extends DatabaseAccessor<AppDatabase> with _$LibraryDaoMixin {
  LibraryDao(super.db);

  /// True when [rating] is null, or within 0.5–10 and on an exact half step.
  /// Mirrors the SQL CHECK on the table; both exist so neither Dart nor a raw
  /// statement can be the hole in the guarantee.
  static bool isValidRating(double? rating) {
    if (rating == null) return true;
    if (rating < 0.5 || rating > 10.0) return false;
    return (rating * 2) % 1 == 0;
  }

  static void _assertRating(double? rating) {
    if (!isValidRating(rating)) throw InvalidRatingException(rating!);
  }

  // ---- reads ----

  /// The main library view: filtered, sorted and searched entirely in SQLite.
  ///
  /// Doing this in the query rather than in Dart is what keeps a large
  /// imported library responsive — and it works with no network, because
  /// everything it reads is local.
  Stream<List<LibraryItem>> watchLibrary({
    EntryStatus? status,
    LibrarySort sort = LibrarySort.dateAdded,
    String? query,
  }) {
    final joined = select(libraryEntries).join([
      leftOuterJoin(
        titles,
        titles.tmdbId.equalsExp(libraryEntries.tmdbId) &
            titles.mediaType.equalsExp(libraryEntries.mediaType),
      ),
    ]);

    if (status != null) {
      joined.where(libraryEntries.status.equalsValue(status));
    }

    final trimmed = query?.trim();
    if (trimmed != null && trimmed.isNotEmpty) {
      // Search the cached title, since the entry itself stores no name.
      joined.where(titles.title.lower().contains(trimmed.toLowerCase()));
    }

    joined.orderBy(switch (sort) {
      LibrarySort.dateAdded => [OrderingTerm.desc(libraryEntries.createdAt)],
      // Unrated entries sort last rather than being treated as zero.
      LibrarySort.rating => [
          OrderingTerm(
            expression: libraryEntries.rating.isNull(),
            mode: OrderingMode.asc,
          ),
          OrderingTerm.desc(libraryEntries.rating),
        ],
      LibrarySort.title => [OrderingTerm.asc(titles.title)],
      LibrarySort.releaseYear => [
          OrderingTerm(
            expression: titles.year.isNull(),
            mode: OrderingMode.asc,
          ),
          OrderingTerm.desc(titles.year),
        ],
    });

    return joined.watch().map(
          (rows) => rows
              .map(
                (row) => (
                  entry: row.readTable(libraryEntries),
                  title: row.readTableOrNull(titles),
                ),
              )
              .toList(),
        );
  }

  Stream<List<LibraryEntry>> watchByStatus(EntryStatus status) {
    return (select(libraryEntries)..where((e) => e.status.equalsValue(status)))
        .watch();
  }

  Stream<List<LibraryEntry>> watchAll() => select(libraryEntries).watch();

  Future<LibraryEntry?> byKey(int tmdbId, MediaType mediaType) {
    return (select(libraryEntries)
          ..where((e) =>
              e.tmdbId.equals(tmdbId) & e.mediaType.equalsValue(mediaType)))
        .getSingleOrNull();
  }

  Stream<LibraryEntry?> watchByKey(int tmdbId, MediaType mediaType) {
    return (select(libraryEntries)
          ..where((e) =>
              e.tmdbId.equals(tmdbId) & e.mediaType.equalsValue(mediaType)))
        .watchSingleOrNull();
  }

  /// Counts per status, for the filter chips. One query rather than four.
  Stream<Map<EntryStatus, int>> watchStatusCounts() {
    final count = libraryEntries.id.count();
    final query = selectOnly(libraryEntries)
      ..addColumns([libraryEntries.status, count])
      ..groupBy([libraryEntries.status]);

    return query.watch().map((rows) {
      final counts = {for (final s in EntryStatus.values) s: 0};
      for (final row in rows) {
        // readWithConverter, not read: the column stores the enum's name, and
        // read would hand back that raw string.
        final status = row.readWithConverter(libraryEntries.status);
        if (status != null) counts[status] = row.read(count) ?? 0;
      }
      return counts;
    });
  }

  Future<int> count() async {
    final expr = libraryEntries.id.count();
    final query = selectOnly(libraryEntries)..addColumns([expr]);
    final row = await query.getSingle();
    return row.read(expr) ?? 0;
  }

  // ---- writes ----

  /// Inserts or updates the entry for `(tmdbId, mediaType)`, which is the
  /// title's identity everywhere in this app.
  Future<void> upsert(LibraryEntriesCompanion entry) async {
    if (entry.rating.present) _assertRating(entry.rating.value);
    await into(libraryEntries).insertOnConflictUpdate(entry);
  }

  /// Adds a title at [status], or moves an existing entry to it. Idempotent —
  /// adding something already tracked updates it rather than duplicating.
  Future<void> add(
    int tmdbId,
    MediaType mediaType, {
    EntryStatus status = EntryStatus.watchlist,
  }) async {
    final existing = await byKey(tmdbId, mediaType);
    if (existing != null) {
      await setStatus(existing.id, status);
      return;
    }

    final now = DateTime.now().toUtc();
    await into(libraryEntries).insert(
      LibraryEntriesCompanion.insert(
        tmdbId: tmdbId,
        mediaType: mediaType,
        status: status,
        createdAt: now,
        updatedAt: now,
        // Marking something watched with no date leaves the diary blank, so
        // stamp one; the user can correct it.
        watchedAt: Value(status == EntryStatus.watched ? now : null),
      ),
    );
  }

  Future<int> setRating(int id, double? rating) {
    _assertRating(rating);
    return _write(id, LibraryEntriesCompanion(rating: Value(rating)));
  }

  Future<int> setStatus(int id, EntryStatus status) async {
    final entry = await (select(libraryEntries)..where((e) => e.id.equals(id)))
        .getSingleOrNull();

    return _write(
      id,
      LibraryEntriesCompanion(
        status: Value(status),
        // Moving to watched with no date recorded yet stamps one.
        watchedAt: status == EntryStatus.watched && entry?.watchedAt == null
            ? Value(DateTime.now().toUtc())
            : const Value.absent(),
      ),
    );
  }

  Future<int> setWatchedAt(int id, DateTime? watchedAt) {
    return _write(
      id,
      LibraryEntriesCompanion(watchedAt: Value(watchedAt?.toUtc())),
    );
  }

  Future<int> setNotes(int id, String? notes) {
    final trimmed = notes?.trim();
    return _write(
      id,
      LibraryEntriesCompanion(
        notes: Value(trimmed == null || trimmed.isEmpty ? null : trimmed),
      ),
    );
  }

  Future<int> setRewatchCount(int id, int count) {
    return _write(
      id,
      LibraryEntriesCompanion(rewatchCount: Value(count < 0 ? 0 : count)),
    );
  }

  Future<int> deleteEntry(int id) {
    return (delete(libraryEntries)..where((e) => e.id.equals(id))).go();
  }

  Future<int> deleteByKey(int tmdbId, MediaType mediaType) {
    return (delete(libraryEntries)
          ..where((e) =>
              e.tmdbId.equals(tmdbId) & e.mediaType.equalsValue(mediaType)))
        .go();
  }

  /// Every write goes through here so `updatedAt` can never be forgotten — it
  /// is what the Phase 4 importer uses to resolve conflicts.
  Future<int> _write(int id, LibraryEntriesCompanion changes) {
    return (update(libraryEntries)..where((e) => e.id.equals(id))).write(
      changes.copyWith(updatedAt: Value(DateTime.now().toUtc())),
    );
  }
}
