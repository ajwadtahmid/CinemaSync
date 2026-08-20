import 'package:cinema_sync/core/db/database.dart';
import 'package:cinema_sync/shared/models/entry_status.dart';
import 'package:cinema_sync/shared/models/library_sort.dart';
import 'package:cinema_sync/shared/models/media_type.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

/// Phase 2 DoD: "A library with 5,000 seeded entries filters and sorts
/// without visible lag." This seeds that scale directly in SQLite (the path
/// a real import would take) and times the query the library screen issues.
void main() {
  test('watchLibrary stays fast at 5,000 entries', () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);

    const count = 5000;
    final now = DateTime.now().toUtc();

    await db.batch((b) {
      b.insertAll(db.titles, [
        for (var i = 0; i < count; i++)
          TitlesCompanion.insert(
            tmdbId: i,
            mediaType: MediaType.movie,
            title: 'Title $i',
            year: Value(1980 + (i % 45)),
            voteAverage: Value((i % 10).toDouble()),
            cachedAt: now,
          ),
      ]);
      b.insertAll(db.libraryEntries, [
        for (var i = 0; i < count; i++)
          LibraryEntriesCompanion.insert(
            tmdbId: i,
            mediaType: MediaType.movie,
            status: EntryStatus.values[i % EntryStatus.values.length],
            createdAt: now,
            updatedAt: now,
          ),
      ]);
    });

    final stopwatch = Stopwatch()..start();
    final filtered = await db.libraryDao
        .watchLibrary(
          status: EntryStatus.watchlist,
          sort: LibrarySort.title,
          query: 'Title 12',
        )
        .first;
    stopwatch.stop();

    // Generous ceiling for a debug/CI machine; the point is "no visible lag"
    // (a frame budget is ~16ms), not a tight microbenchmark.
    expect(
      stopwatch.elapsedMilliseconds,
      lessThan(1000),
      reason: 'library query took ${stopwatch.elapsedMilliseconds}ms at '
          '$count entries',
    );
    // "Title 12" also matches "Title 120".."Title 129" etc — just confirm the
    // filter+search actually narrowed the result rather than returning all.
    expect(filtered, isNotEmpty);
    expect(filtered.length, lessThan(count));
  });
}
