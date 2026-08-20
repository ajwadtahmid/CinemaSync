import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/tmdb_api.dart';
import '../../../shared/models/tv_episode.dart';
import '../data/episode_progress_repository.dart';

/// Episodes for one season. Kept alive briefly so reopening the same season
/// after closing the sheet does not re-fetch.
final tvSeasonEpisodesProvider = FutureProvider.autoDispose
    .family<List<TvEpisode>, ({int tvId, int season})>((ref, key) {
  final link = ref.keepAlive();
  Future<void>.delayed(const Duration(minutes: 5), link.close);

  return ref.watch(tmdbApiProvider).tvSeasonEpisodes(key.tvId, key.season);
});

/// Watched `(season, episode)` pairs for a show.
final watchedEpisodesProvider =
    StreamProvider.autoDispose.family<Set<(int, int)>, int>((ref, tvId) {
  return ref
      .watch(episodeProgressRepositoryProvider)
      .watchWatchedEpisodes(tvId);
});

/// Total watched episodes across all seasons, for a progress summary.
final watchedEpisodeCountProvider =
    StreamProvider.autoDispose.family<int, int>((ref, tvId) {
  return ref.watch(episodeProgressRepositoryProvider).watchWatchedCount(tvId);
});
