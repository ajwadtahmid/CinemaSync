import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/error/failure.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/models/tv_episode.dart';
import '../../../shared/widgets/app_loader.dart';
import '../../../shared/widgets/error_view.dart';
import '../application/episode_providers.dart';
import '../data/episode_progress_repository.dart';

/// Opens the episode checklist for one season.
Future<void> showEpisodeChecklistSheet(
  BuildContext context, {
  required int tvId,
  required int season,
  required String seasonName,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => EpisodeChecklistSheet(
      tvId: tvId,
      season: season,
      seasonName: seasonName,
    ),
  );
}

/// A per-episode checklist, plus a bulk "mark season watched" action.
class EpisodeChecklistSheet extends ConsumerWidget {
  const EpisodeChecklistSheet({
    super.key,
    required this.tvId,
    required this.season,
    required this.seasonName,
  });

  final int tvId;
  final int season;
  final String seasonName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final episodesAsync =
        ref.watch(tvSeasonEpisodesProvider((tvId: tvId, season: season)));
    final watched = ref.watch(watchedEpisodesProvider(tvId)).value ?? {};
    final repo = ref.read(episodeProgressRepositoryProvider);

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return episodesAsync.when(
          loading: () => const AppLoader(),
          error: (error, _) => ErrorView(
            message: error is Failure
                ? error.message
                : 'Episodes could not be loaded.',
            onRetry: () => ref.invalidate(
              tvSeasonEpisodesProvider((tvId: tvId, season: season)),
            ),
          ),
          data: (episodes) {
            final allWatched = episodes.isNotEmpty &&
                episodes
                    .every((e) => watched.contains((season, e.episodeNumber)));

            return ListView(
              controller: scrollController,
              padding: const EdgeInsets.all(AppSpacing.lg),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        seasonName,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    TextButton(
                      onPressed: episodes.isEmpty
                          ? null
                          : () => allWatched
                              ? repo.markSeasonUnwatched(tvId, season)
                              : repo.markSeasonWatched(
                                  tvId,
                                  season,
                                  episodes
                                      .map((e) => e.episodeNumber)
                                      .toList(),
                                ),
                      child: Text(
                        allWatched ? 'Mark all unwatched' : 'Mark all watched',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                for (final episode in episodes)
                  _EpisodeTile(
                    episode: episode,
                    isWatched:
                        watched.contains((season, episode.episodeNumber)),
                    onChanged: (value) => value
                        ? repo.markEpisodeWatched(
                            tvId,
                            season,
                            episode.episodeNumber,
                          )
                        : repo.markEpisodeUnwatched(
                            tvId,
                            season,
                            episode.episodeNumber,
                          ),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}

class _EpisodeTile extends StatelessWidget {
  const _EpisodeTile({
    required this.episode,
    required this.isWatched,
    required this.onChanged,
  });

  final TvEpisode episode;
  final bool isWatched;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isWatched,
      onChanged: (value) => onChanged(value ?? false),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      title: Text('${episode.episodeNumber}. ${episode.name}'),
      subtitle:
          episode.runtime == null ? null : Text('${episode.runtime} min'),
    );
  }
}
