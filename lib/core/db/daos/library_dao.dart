import 'package:drift/drift.dart';

import '../../../shared/models/entry_status.dart';
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

/// Reads and writes the user's library. This is the source of truth.
@DriftAccessor(tables: [LibraryEntries])
class LibraryDao extends DatabaseAccessor<AppDatabase> with _$LibraryDaoMixin {
  LibraryDao(super.db);

  /// True when [rating] is null, or within 0.5–10 and on an exact half step.
  /// Mirrors the SQL CHECK on the table; both exist so neither Dart nor raw
  /// SQL can be the hole in the guarantee.
  static bool isValidRating(double? rating) {
    if (rating == null) return true;
    if (rating < 0.5 || rating > 10.0) return false;
    return (rating * 2) % 1 == 0;
  }

  static void _assertRating(double? rating) {
    if (!isValidRating(rating)) throw InvalidRatingException(rating!);
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

  /// Inserts or updates the entry for `(tmdbId, mediaType)`, which is the
  /// title's identity everywhere in this app.
  Future<void> upsert(LibraryEntriesCompanion entry) async {
    if (entry.rating.present) _assertRating(entry.rating.value);
    await into(libraryEntries).insertOnConflictUpdate(entry);
  }

  Future<int> setRating(int id, double? rating) {
    _assertRating(rating);
    return (update(libraryEntries)..where((e) => e.id.equals(id))).write(
      LibraryEntriesCompanion(
        rating: Value(rating),
        updatedAt: Value(DateTime.now().toUtc()),
      ),
    );
  }

  Future<int> setStatus(int id, EntryStatus status) {
    return (update(libraryEntries)..where((e) => e.id.equals(id))).write(
      LibraryEntriesCompanion(
        status: Value(status),
        updatedAt: Value(DateTime.now().toUtc()),
      ),
    );
  }

  Future<int> deleteEntry(int id) {
    return (delete(libraryEntries)..where((e) => e.id.equals(id))).go();
  }

  Future<int> count() async {
    final expr = libraryEntries.id.count();
    final query = selectOnly(libraryEntries)..addColumns([expr]);
    final row = await query.getSingle();
    return row.read(expr) ?? 0;
  }
}
