import 'package:cinema_sync/core/db/daos/library_dao.dart';
import 'package:cinema_sync/core/db/database.dart';
import 'package:cinema_sync/shared/models/entry_status.dart';
import 'package:cinema_sync/shared/models/media_type.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;

  setUp(() => db = AppDatabase(NativeDatabase.memory()));
  tearDown(() => db.close());

  LibraryEntriesCompanion entry({required double? rating, int tmdbId = 27205}) {
    final now = DateTime.now().toUtc();
    return LibraryEntriesCompanion.insert(
      tmdbId: tmdbId,
      mediaType: MediaType.movie,
      status: EntryStatus.watched,
      createdAt: now,
      updatedAt: now,
      rating: Value(rating),
    );
  }

  group('schema', () {
    test('creates and is usable', () async {
      expect(await db.libraryDao.count(), 0);
    });

    test('title identity is (tmdbId, mediaType), not tmdbId alone', () async {
      final now = DateTime.now().toUtc();
      await db.libraryDao.upsert(entry(rating: null));
      await db.libraryDao.upsert(
        LibraryEntriesCompanion.insert(
          tmdbId: 27205, // same id, different media type — a distinct title
          mediaType: MediaType.tv,
          status: EntryStatus.watchlist,
          createdAt: now,
          updatedAt: now,
        ),
      );

      expect(await db.libraryDao.count(), 2);
    });
  });

  group('rating scale (0.5–10, half steps)', () {
    test('Dart guard accepts valid values', () {
      for (final r in [0.5, 1.0, 7.5, 10.0, null]) {
        expect(LibraryDao.isValidRating(r), isTrue, reason: 'rating $r');
      }
    });

    test('Dart guard rejects invalid values', () {
      for (final r in [0.0, 0.4, 7.3, 10.5, -1.0]) {
        expect(LibraryDao.isValidRating(r), isFalse, reason: 'rating $r');
      }
    });

    test('DAO rejects an off-scale rating rather than rounding it', () {
      expect(
        () => db.libraryDao.upsert(entry(rating: 7.3)),
        throwsA(isA<InvalidRatingException>()),
      );
    });

    test('SQL CHECK rejects an off-scale rating written around the DAO', () {
      // Bypasses LibraryDao entirely — this is the guarantee that survives a
      // raw statement, which is why the constraint exists in both layers.
      expect(
        () => db.into(db.libraryEntries).insert(entry(rating: 7.3)),
        throwsA(anything),
      );
    });

    test('a half-step rating round-trips exactly', () async {
      await db.libraryDao.upsert(entry(rating: 7.5));
      final saved = await db.libraryDao.byKey(27205, MediaType.movie);

      expect(saved!.rating, 7.5);
    });
  });

  group('buddy cascade', () {
    test('deleting a buddy removes its dependent rows', () async {
      final buddyId = await db.into(db.buddies).insert(
            BuddiesCompanion.insert(
              displayName: 'Sam',
              roomId: 'room-abc',
              keyRef: 'secure-storage-key-1',
              createdAt: DateTime.now().toUtc(),
            ),
          );
      await db.into(db.buddyRightSwipes).insert(
            BuddyRightSwipesCompanion.insert(
              buddyId: buddyId,
              tmdbId: 550,
              mediaType: MediaType.movie,
            ),
          );

      await (db.delete(db.buddies)..where((b) => b.id.equals(buddyId))).go();

      // Fails unless PRAGMA foreign_keys is on for this connection.
      expect(await db.select(db.buddyRightSwipes).get(), isEmpty);
    });
  });
}
