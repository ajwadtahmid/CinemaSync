import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../shared/models/tv_season.dart';
import '../application/episode_providers.dart';
import 'episode_checklist_sheet.dart';

/// Season list on a TV title's detail screen. Each row shows how many of that
/// season's episodes are watched; tapping opens the episode checklist.
class SeasonList extends ConsumerWidget {
  const SeasonList({super.key, required this.tvId, required this.seasons});

  final int tvId;
  final List<TvSeason> seasons;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (seasons.isEmpty) return const SizedBox.shrink();

    final watched = ref.watch(watchedEpisodesProvider(tvId)).value ?? {};
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.xl,
            AppSpacing.lg,
            AppSpacing.sm,
          ),
          child: Text('Seasons', style: theme.textTheme.titleMedium),
        ),
        for (final season in seasons)
          _SeasonTile(tvId: tvId, season: season, watched: watched),
      ],
    );
  }
}

class _SeasonTile extends StatelessWidget {
  const _SeasonTile({
    required this.tvId,
    required this.season,
    required this.watched,
  });

  final int tvId;
  final TvSeason season;
  final Set<(int, int)> watched;

  @override
  Widget build(BuildContext context) {
    final watchedInSeason =
        watched.where((pair) => pair.$1 == season.seasonNumber).length;
    final total = season.episodeCount;
    final subtitle =
        total == 0 ? 'No episode data' : '$watchedInSeason of $total watched';

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      title: Text(season.name),
      subtitle: Text(subtitle),
      trailing: total == 0
          ? const Icon(Icons.chevron_right)
          : SizedBox(
              width: 40,
              child: LinearProgressIndicator(
                value: watchedInSeason / total,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
      onTap: () => showEpisodeChecklistSheet(
        context,
        tvId: tvId,
        season: season.seasonNumber,
        seasonName: season.name,
      ),
    );
  }
}
