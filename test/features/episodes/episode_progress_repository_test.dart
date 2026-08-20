import 'package:cinema_sync/core/db/database.dart';
import 'package:cinema_sync/features/episodes/data/episode_progress_repository.dart';
import 'package:cinema_sync/shared/models/entry_status.dart';
import 'package:cinema_sync/shared/models/media_type.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late EpisodeProgressRepository repo;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    repo = EpisodeProgressRepository(
      episodes: db.episodeProgressDao,
      library: db.libraryDao,
    );
  });

  tearDown(() => db.close());

  group('deriving watching status', () {
    test('marking an episode on an untracked show adds it as watching',
        () async {
      await repo.markEpisodeWatched(1396, 1, 1);

      final entry = await db.libraryDao.byKey(1396, MediaType.tv);
      expect(entry!.status, EntryStatus.watching);
    });

    test('marking an episode moves a watchlisted show to watching', () async {
      await db.libraryDao.add(1396, MediaType.tv);

      await repo.markEpisodeWatched(1396, 1, 1);

      final entry = await db.libraryDao.byKey(1396, MediaType.tv);
      expect(entry!.status, EntryStatus.watching);
    });

    test('never overrides a show already marked watched', () async {
      await db.libraryDao
          .add(1396, MediaType.tv, status: EntryStatus.watched);

      await repo.markEpisodeWatched(1396, 5, 1);

      final entry = await db.libraryDao.byKey(1396, MediaType.tv);
      expect(entry!.status, EntryStatus.watched);
    });

    test('never overrides a show the user dropped', () async {
      await db.libraryDao
          .add(1396, MediaType.tv, status: EntryStatus.dropped);

      await repo.markEpisodeWatched(1396, 1, 1);

      final entry = await db.libraryDao.byKey(1396, MediaType.tv);
      expect(entry!.status, EntryStatus.dropped);
    });

    test('marking a whole season also promotes to watching', () async {
      await repo.markSeasonWatched(1396, 1, [1, 2, 3]);

      final entry = await db.libraryDao.byKey(1396, MediaType.tv);
      expect(entry!.status, EntryStatus.watching);
      expect(await repo.watchWatchedCount(1396).first, 3);
    });
  });

  group('unmarking', () {
    test('unmarking an episode does not change status', () async {
      await repo.markEpisodeWatched(1396, 1, 1);
      await repo.markEpisodeUnwatched(1396, 1, 1);

      final entry = await db.libraryDao.byKey(1396, MediaType.tv);
      expect(entry!.status, EntryStatus.watching);
      expect(await repo.watchWatchedEpisodes(1396).first, isEmpty);
    });

    test('unmarking a whole season clears only that season', () async {
      await repo.markSeasonWatched(1396, 1, [1, 2]);
      await repo.markEpisodeWatched(1396, 2, 1);

      await repo.markSeasonUnwatched(1396, 1);

      expect(await repo.watchWatchedEpisodes(1396).first, {(2, 1)});
    });
  });
}
