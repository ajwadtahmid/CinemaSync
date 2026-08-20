import 'package:cinema_sync/core/db/daos/library_dao.dart';
import 'package:cinema_sync/core/db/database.dart';
import 'package:cinema_sync/shared/models/entry_status.dart';
import 'package:cinema_sync/shared/models/library_sort.dart';
import 'package:cinema_sync/shared/models/list_sort_preference.dart';
import 'package:cinema_sync/shared/models/media_type.dart';
// drift exports SQL builders named isNull/isNotNull that shadow matcher's.
// Only Value and the companions are needed here.
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;

  setUp(() => db = AppDatabase(NativeDatabase.memory()));
  tearDown(() => db.close());

  /// Seeds the cache so joined reads have a title to show.
  Future<void> cacheTitle(
    int tmdbId,
    String title, {
    MediaType mediaType = MediaType.movie,
    int? year,
    double? voteAverage,
  }) {
    return db.titlesDao.upsertAll([
      TitlesCompanion.insert(
        tmdbId: tmdbId,
        mediaType: mediaType,
        title: title,
        year: Value(year),
        voteAverage: Value(voteAverage),
        cachedAt: DateTime.now().toUtc(),
      ),
    ]);
  }

  group('adding and status', () {
    test('adds to the watchlist by default', () async {
      await db.libraryDao.add(27205, MediaType.movie);

      final entry = await db.libraryDao.byKey(27205, MediaType.movie);
      expect(entry!.status, EntryStatus.watchlist);
      expect(entry.watchedAt, isNull);
    });

    test('adding twice moves the entry rather than duplicating it', () async {
      await db.libraryDao.add(27205, MediaType.movie);
      await db.libraryDao.add(
        27205,
        MediaType.movie,
        status: EntryStatus.watched,
      );

      expect(await db.libraryDao.count(), 1);
      final entry = await db.libraryDao.byKey(27205, MediaType.movie);
      expect(entry!.status, EntryStatus.watched);
    });

    test('moves through all four statuses and persists', () async {
      await db.libraryDao.add(1, MediaType.movie);
      final id = (await db.libraryDao.byKey(1, MediaType.movie))!.id;

      for (final status in EntryStatus.values) {
        await db.libraryDao.setStatus(id, status);
        final entry = await db.libraryDao.byKey(1, MediaType.movie);
        expect(entry!.status, status);
      }
    });

    test('marking watched stamps a date but never overwrites a chosen one',
        () async {
      await db.libraryDao.add(1, MediaType.movie);
      final id = (await db.libraryDao.byKey(1, MediaType.movie))!.id;

      await db.libraryDao.setStatus(id, EntryStatus.watched);
      expect(
        (await db.libraryDao.byKey(1, MediaType.movie))!.watchedAt,
        isNotNull,
      );

      // A deliberate date the user set must survive a status round-trip.
      final chosen = DateTime.utc(2020, 3, 2);
      await db.libraryDao.setWatchedAt(id, chosen);
      await db.libraryDao.setStatus(id, EntryStatus.watching);
      await db.libraryDao.setStatus(id, EntryStatus.watched);

      expect((await db.libraryDao.byKey(1, MediaType.movie))!.watchedAt, chosen);
    });

    test('a movie and a series sharing a tmdb id are different titles',
        () async {
      await db.libraryDao.add(27205, MediaType.movie);
      await db.libraryDao.add(27205, MediaType.tv);

      expect(await db.libraryDao.count(), 2);
    });
  });

  group('ratings', () {
    test('rejects an off-scale rating rather than rounding it', () async {
      await db.libraryDao.add(1, MediaType.movie);
      final id = (await db.libraryDao.byKey(1, MediaType.movie))!.id;

      expect(
        () => db.libraryDao.setRating(id, 7.3),
        throwsA(isA<InvalidRatingException>()),
      );
    });

    test('accepts half steps and clearing', () async {
      await db.libraryDao.add(1, MediaType.movie);
      final id = (await db.libraryDao.byKey(1, MediaType.movie))!.id;

      await db.libraryDao.setRating(id, 7.5);
      expect((await db.libraryDao.byKey(1, MediaType.movie))!.rating, 7.5);

      await db.libraryDao.setRating(id, null);
      expect((await db.libraryDao.byKey(1, MediaType.movie))!.rating, isNull);
    });
  });

  group('notes, rewatches, updatedAt', () {
    test('blank notes are stored as null rather than an empty string',
        () async {
      await db.libraryDao.add(1, MediaType.movie);
      final id = (await db.libraryDao.byKey(1, MediaType.movie))!.id;

      await db.libraryDao.setNotes(id, '   ');
      expect((await db.libraryDao.byKey(1, MediaType.movie))!.notes, isNull);

      await db.libraryDao.setNotes(id, '  Rewatch with Sam  ');
      expect(
        (await db.libraryDao.byKey(1, MediaType.movie))!.notes,
        'Rewatch with Sam',
      );
    });

    test('a rewatch count never goes negative', () async {
      await db.libraryDao.add(1, MediaType.movie);
      final id = (await db.libraryDao.byKey(1, MediaType.movie))!.id;

      await db.libraryDao.setRewatchCount(id, -5);
      expect((await db.libraryDao.byKey(1, MediaType.movie))!.rewatchCount, 0);
    });

    test('every write bumps updatedAt and keeps it UTC', () async {
      await db.libraryDao.add(1, MediaType.movie);
      final entry = (await db.libraryDao.byKey(1, MediaType.movie))!;
      final before = entry.updatedAt;

      await Future<void>.delayed(const Duration(milliseconds: 5));
      await db.libraryDao.setNotes(entry.id, 'note');

      final after = (await db.libraryDao.byKey(1, MediaType.movie))!.updatedAt;
      expect(after.isAfter(before), isTrue);
      expect(after.isUtc, isTrue);
    });
  });

  group('library view', () {
    test('filters by status', () async {
      await cacheTitle(1, 'A');
      await cacheTitle(2, 'B');
      await db.libraryDao.add(1, MediaType.movie);
      await db.libraryDao.add(2, MediaType.movie, status: EntryStatus.watched);

      final watchlist =
          await db.libraryDao.watchLibrary(status: EntryStatus.watchlist).first;

      expect(watchlist, hasLength(1));
      expect(watchlist.single.title!.title, 'A');
    });

    test('searches the cached title', () async {
      await cacheTitle(1, 'Inception');
      await cacheTitle(2, 'Interstellar');
      await db.libraryDao.add(1, MediaType.movie);
      await db.libraryDao.add(2, MediaType.movie);

      final results = await db.libraryDao.watchLibrary(query: 'cep').first;

      expect(results, hasLength(1));
      expect(results.single.title!.title, 'Inception');
    });

    test('sorts by title', () async {
      await cacheTitle(1, 'Zodiac');
      await cacheTitle(2, 'Arrival');
      await db.libraryDao.add(1, MediaType.movie);
      await db.libraryDao.add(2, MediaType.movie);

      final sorted =
          await db.libraryDao.watchLibrary(sort: LibrarySort.title).first;

      expect(sorted.map((i) => i.title!.title), ['Arrival', 'Zodiac']);
    });

    test('unrated entries sort last, not as zero', () async {
      await cacheTitle(1, 'Rated');
      await cacheTitle(2, 'Unrated');
      await db.libraryDao.add(1, MediaType.movie);
      await db.libraryDao.add(2, MediaType.movie);
      final rated = (await db.libraryDao.byKey(1, MediaType.movie))!;
      await db.libraryDao.setRating(rated.id, 6);

      final sorted =
          await db.libraryDao.watchLibrary(sort: LibrarySort.rating).first;

      expect(sorted.first.title!.title, 'Rated');
      expect(sorted.last.title!.title, 'Unrated');
    });

    test('an entry with no cached metadata still appears', () async {
      // An import can create entries before their metadata is fetched.
      await db.libraryDao.add(999, MediaType.movie);

      final all = await db.libraryDao.watchLibrary().first;

      expect(all, hasLength(1));
      expect(all.single.title, isNull);
    });

    test('status counts cover every status', () async {
      await db.libraryDao.add(1, MediaType.movie);
      await db.libraryDao.add(2, MediaType.movie, status: EntryStatus.watched);
      await db.libraryDao.add(3, MediaType.movie, status: EntryStatus.watched);

      final counts = await db.libraryDao.watchStatusCounts().first;

      expect(counts[EntryStatus.watchlist], 1);
      expect(counts[EntryStatus.watched], 2);
      expect(counts[EntryStatus.dropped], 0);
    });
  });

  group('dismissed', () {
    test('dismissal is keyed by media type and reversible', () async {
      await db.dismissedDao.dismiss(1, MediaType.movie);

      expect(await db.dismissedDao.isDismissed(1, MediaType.movie), isTrue);
      expect(await db.dismissedDao.isDismissed(1, MediaType.tv), isFalse);

      await db.dismissedDao.undismiss(1, MediaType.movie);
      expect(await db.dismissedDao.isDismissed(1, MediaType.movie), isFalse);
    });

    test('dismissing twice does not fail or duplicate', () async {
      await db.dismissedDao.dismiss(1, MediaType.movie);
      await db.dismissedDao.dismiss(1, MediaType.movie);

      expect(await db.dismissedDao.dismissedKeys(), hasLength(1));
    });
  });

  group('episode progress', () {
    test('marks and unmarks a single episode', () async {
      await db.episodeProgressDao.markWatched(1396, 1, 3);

      expect(
        await db.episodeProgressDao.watchWatchedEpisodes(1396).first,
        {(1, 3)},
      );

      await db.episodeProgressDao.markUnwatched(1396, 1, 3);
      expect(
        await db.episodeProgressDao.watchWatchedEpisodes(1396).first,
        isEmpty,
      );
    });

    test('re-marking an episode updates rather than duplicating', () async {
      await db.episodeProgressDao.markWatched(1396, 1, 3);
      await db.episodeProgressDao.markWatched(1396, 1, 3);

      expect(await db.episodeProgressDao.watchedCountForShow(1396), 1);
    });

    test('marks and clears a whole season at once', () async {
      await db.episodeProgressDao.markSeasonWatched(1396, 1, [1, 2, 3, 4]);
      expect(await db.episodeProgressDao.watchedCountForShow(1396), 4);

      await db.episodeProgressDao.markSeasonUnwatched(1396, 1);
      expect(await db.episodeProgressDao.watchedCountForShow(1396), 0);
    });
  });

  group('custom lists', () {
    test('creates lists in order and counts their items', () async {
      final first = await db.listsDao.createList('Comfort rewatches');
      await db.listsDao.createList('To watch in 2026');
      await cacheTitle(1, 'A');
      await db.listsDao.addItem(first, 1, MediaType.movie);

      final lists = await db.listsDao.watchListsWithCounts().first;

      expect(
        lists.map((l) => l.list.name),
        ['Comfort rewatches', 'To watch in 2026'],
      );
      expect(lists.first.itemCount, 1);
      expect(lists.last.itemCount, 0);
    });

    test('per-list sort preference is stored per list', () async {
      final a = await db.listsDao.createList('A');
      final b = await db.listsDao.createList('B');

      await db.listsDao.setSortPreference(a, ListSortPreference.title);

      expect(
        (await db.listsDao.byId(a))!.sortPreference,
        ListSortPreference.title,
      );
      // The other list keeps the default.
      expect(
        (await db.listsDao.byId(b))!.sortPreference,
        ListSortPreference.manual,
      );
    });

    test('an item carries its own note, separate from the library note',
        () async {
      final list = await db.listsDao.createList('Comfort rewatches');
      await cacheTitle(1, 'A');
      await db.listsDao
          .addItem(list, 1, MediaType.movie, notes: 'Always on a Sunday');

      final items =
          await db.listsDao.watchItems(list, ListSortPreference.manual).first;

      expect(items.single.item.notes, 'Always on a Sunday');
    });

    test('adding the same title twice updates instead of duplicating',
        () async {
      final list = await db.listsDao.createList('A');
      await db.listsDao.addItem(list, 1, MediaType.movie, notes: 'first');
      await db.listsDao.addItem(list, 1, MediaType.movie, notes: 'second');

      final items =
          await db.listsDao.watchItems(list, ListSortPreference.manual).first;

      expect(items, hasLength(1));
      expect(items.single.item.notes, 'second');
    });

    test('items sort by the list preference', () async {
      final list = await db.listsDao.createList('A');
      await cacheTitle(1, 'Zodiac', year: 2007);
      await cacheTitle(2, 'Arrival', year: 2016);
      await db.listsDao.addItem(list, 1, MediaType.movie);
      await db.listsDao.addItem(list, 2, MediaType.movie);

      final byTitle =
          await db.listsDao.watchItems(list, ListSortPreference.title).first;
      expect(byTitle.map((i) => i.title!.title), ['Arrival', 'Zodiac']);

      final byYear = await db.listsDao
          .watchItems(list, ListSortPreference.releaseYear)
          .first;
      expect(byYear.map((i) => i.title!.title), ['Arrival', 'Zodiac']);
    });

    test('reordering rewrites positions', () async {
      final list = await db.listsDao.createList('A');
      await db.listsDao.addItem(list, 1, MediaType.movie);
      await db.listsDao.addItem(list, 2, MediaType.movie);

      await db.listsDao.reorderItems(list, [
        (2, MediaType.movie),
        (1, MediaType.movie),
      ]);

      final items =
          await db.listsDao.watchItems(list, ListSortPreference.manual).first;
      expect(items.map((i) => i.item.tmdbId), [2, 1]);
    });

    test('deleting a list removes its items', () async {
      final list = await db.listsDao.createList('A');
      await db.listsDao.addItem(list, 1, MediaType.movie);

      await db.listsDao.deleteList(list);

      expect(await db.select(db.userListItems).get(), isEmpty);
    });

    test('reports which lists already contain a title', () async {
      final a = await db.listsDao.createList('A');
      final b = await db.listsDao.createList('B');
      await db.listsDao.addItem(a, 1, MediaType.movie);

      final containing =
          await db.listsDao.watchListIdsContaining(1, MediaType.movie).first;

      expect(containing, {a});
      expect(containing, isNot(contains(b)));
    });
  });
}
