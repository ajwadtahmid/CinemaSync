import 'package:drift/drift.dart';

import '../database.dart';
import '../tables.dart';

part 'episode_progress_dao.g.dart';

/// Per-episode watch progress for TV.
///
/// TV only, so rows carry no `mediaType` — the pair is implicitly
/// `(tmdbId, tv)`.
@DriftAccessor(tables: [EpisodeProgress])
class EpisodeProgressDao extends DatabaseAccessor<AppDatabase>
    with _$EpisodeProgressDaoMixin {
  EpisodeProgressDao(super.db);

  Stream<List<EpisodeProgressData>> watchForShow(int tmdbId) {
    return (select(episodeProgress)..where((e) => e.tmdbId.equals(tmdbId)))
        .watch();
  }

  /// Watched `(season, episode)` pairs, so the checklist can tick boxes
  /// without a lookup per row.
  Stream<Set<(int, int)>> watchWatchedEpisodes(int tmdbId) {
    return watchForShow(tmdbId)
        .map((rows) => rows.map((r) => (r.season, r.episode)).toSet());
  }

  Future<void> markWatched(
    int tmdbId,
    int season,
    int episode, {
    DateTime? watchedAt,
  }) async {
    final stamp = watchedAt?.toUtc() ?? DateTime.now().toUtc();

    await into(episodeProgress).insert(
      EpisodeProgressCompanion.insert(
        tmdbId: tmdbId,
        season: season,
        episode: episode,
        watchedAt: stamp,
      ),
      // Re-marking an already-watched episode should update, not fail.
      onConflict: DoUpdate(
        (_) => EpisodeProgressCompanion(watchedAt: Value(stamp)),
        target: [
          episodeProgress.tmdbId,
          episodeProgress.season,
          episodeProgress.episode,
        ],
      ),
    );
  }

  Future<int> markUnwatched(int tmdbId, int season, int episode) {
    return (delete(episodeProgress)
          ..where((e) =>
              e.tmdbId.equals(tmdbId) &
              e.season.equals(season) &
              e.episode.equals(episode)))
        .go();
  }

  /// Marks a whole season watched in one transaction, so a failure partway
  /// cannot leave a season half-ticked.
  Future<void> markSeasonWatched(
    int tmdbId,
    int season,
    List<int> episodeNumbers,
  ) {
    return transaction(() async {
      for (final episode in episodeNumbers) {
        await markWatched(tmdbId, season, episode);
      }
    });
  }

  Future<int> markSeasonUnwatched(int tmdbId, int season) {
    return (delete(episodeProgress)
          ..where((e) => e.tmdbId.equals(tmdbId) & e.season.equals(season)))
        .go();
  }

  Future<int> watchedCountForShow(int tmdbId) async {
    final expr = episodeProgress.episode.count();
    final query = selectOnly(episodeProgress)
      ..addColumns([expr])
      ..where(episodeProgress.tmdbId.equals(tmdbId));
    final row = await query.getSingle();
    return row.read(expr) ?? 0;
  }

  Stream<int> watchWatchedCount(int tmdbId) {
    return watchForShow(tmdbId).map((rows) => rows.length);
  }

  /// Clears a show's progress — used when a title leaves the library.
  Future<int> clearShow(int tmdbId) {
    return (delete(episodeProgress)..where((e) => e.tmdbId.equals(tmdbId)))
        .go();
  }
}
