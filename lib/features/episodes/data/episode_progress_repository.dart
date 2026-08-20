import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/db/daos/episode_progress_dao.dart';
import '../../../core/db/daos/library_dao.dart';
import '../../../core/db/database.dart';
import '../../../shared/models/entry_status.dart';
import '../../../shared/models/media_type.dart';

/// Marks episode progress and derives the show's library status from it.
///
/// Marking an episode watched is a strong enough signal to move a show from
/// "watchlist" (or untracked) into "watching" automatically — that is the
/// point of tracking progress at all. It never overrides "watched" or
/// "dropped", because those are deliberate calls the user made; progress
/// should not quietly undo them.
class EpisodeProgressRepository {
  EpisodeProgressRepository({
    required EpisodeProgressDao episodes,
    required LibraryDao library,
  })  : _episodes = episodes,
        _library = library;

  final EpisodeProgressDao _episodes;
  final LibraryDao _library;

  Stream<Set<(int, int)>> watchWatchedEpisodes(int tmdbId) {
    return _episodes.watchWatchedEpisodes(tmdbId);
  }

  Stream<int> watchWatchedCount(int tmdbId) {
    return _episodes.watchWatchedCount(tmdbId);
  }

  Future<void> markEpisodeWatched(int tmdbId, int season, int episode) async {
    await _episodes.markWatched(tmdbId, season, episode);
    await _promoteToWatching(tmdbId);
  }

  Future<void> markEpisodeUnwatched(int tmdbId, int season, int episode) {
    return _episodes.markUnwatched(tmdbId, season, episode);
  }

  Future<void> markSeasonWatched(
    int tmdbId,
    int season,
    List<int> episodeNumbers,
  ) async {
    await _episodes.markSeasonWatched(tmdbId, season, episodeNumbers);
    await _promoteToWatching(tmdbId);
  }

  Future<void> markSeasonUnwatched(int tmdbId, int season) {
    return _episodes.markSeasonUnwatched(tmdbId, season);
  }

  Future<void> _promoteToWatching(int tmdbId) async {
    final entry = await _library.byKey(tmdbId, MediaType.tv);
    if (entry == null) {
      await _library.add(tmdbId, MediaType.tv, status: EntryStatus.watching);
      return;
    }
    if (entry.status == EntryStatus.watchlist) {
      await _library.setStatus(entry.id, EntryStatus.watching);
    }
  }
}

final episodeProgressRepositoryProvider =
    Provider<EpisodeProgressRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return EpisodeProgressRepository(
    episodes: db.episodeProgressDao,
    library: db.libraryDao,
  );
});
