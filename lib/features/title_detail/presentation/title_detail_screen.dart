import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/error/failure.dart';
import '../../../core/network/tmdb_image.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_opacity.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/models/cast_member.dart';
import '../../../shared/models/media_type.dart';
import '../../../shared/models/title_detail.dart';
import '../../../shared/widgets/app_loader.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/tmdb_attribution.dart';
import '../../catalog/presentation/poster_rail.dart';
import '../../episodes/presentation/season_list.dart';
import '../../library/application/library_providers.dart';
import '../../library/data/library_repository.dart';
import '../../library/presentation/entry_detail_sheet.dart';
import '../../lists/presentation/add_to_list_sheet.dart';
import '../application/title_detail_providers.dart';

/// Everything TMDB knows about one title.
///
/// Adding to the library lands in Phase 2, when the library exists; the action
/// is present but disabled rather than absent, so the screen's shape does not
/// change under the user later.
class TitleDetailScreen extends ConsumerWidget {
  const TitleDetailScreen({
    super.key,
    required this.id,
    required this.mediaType,
  });

  final int id;
  final MediaType mediaType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail =
        ref.watch(titleDetailProvider((id: id, mediaType: mediaType)));

    return Scaffold(
      body: detail.when(
        loading: () => const _DetailScaffold(child: AppLoader()),
        error: (error, _) => _DetailScaffold(
          child: ErrorView(
            message: error is Failure
                ? error.message
                : 'This title could not be loaded.',
            onRetry: () => ref.invalidate(
              titleDetailProvider((id: id, mediaType: mediaType)),
            ),
          ),
        ),
        data: (title) => _DetailBody(title: title),
      ),
    );
  }
}

/// Keeps a back button available while loading or failing, so a slow or dead
/// network never traps the user on a blank screen.
class _DetailScaffold extends StatelessWidget {
  const _DetailScaffold({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: BackButton(onPressed: () => context.pop()),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _DetailBody extends ConsumerWidget {
  const _DetailBody({required this.title});

  final TitleDetail title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final backdrop = TmdbImage.backdrop(title.backdropPath);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: backdrop == null ? kToolbarHeight : 240,
          pinned: true,
          flexibleSpace: backdrop == null
              ? null
              : FlexibleSpaceBar(
                  background: _Backdrop(url: backdrop),
                  collapseMode: CollapseMode.parallax,
                ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title.title, style: theme.textTheme.headlineSmall),
                const SizedBox(height: AppSpacing.sm),
                _MetaRow(title: title),
                if (title.tagline != null && title.tagline!.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    title.tagline!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
                const SizedBox(height: AppSpacing.lg),
                Row(
                  children: [
                    Expanded(
                      child: _AddToLibraryButton(
                        id: title.id,
                        mediaType: title.mediaType,
                        title: title.title,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    IconButton(
                      tooltip: 'Add to list',
                      icon: const Icon(Icons.playlist_add),
                      onPressed: () => showAddToListSheet(
                        context,
                        id: title.id,
                        mediaType: title.mediaType,
                        title: title.title,
                      ),
                    ),
                    _DismissButton(id: title.id, mediaType: title.mediaType),
                  ],
                ),
                if (title.genres.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.lg),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      for (final genre in title.genres)
                        Chip(label: Text(genre.name)),
                    ],
                  ),
                ],
                if (title.overview.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.xl),
                  Text('Synopsis', style: theme.textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.sm),
                  Text(title.overview, style: theme.textTheme.bodyLarge),
                ],
                if (title.trailer != null) ...[
                  const SizedBox(height: AppSpacing.xl),
                  _TrailerLink(youtubeKey: title.trailer!.key),
                ],
                if (title.watchProviders.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.xl),
                  Text('Streaming on', style: theme.textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.md),
                  Wrap(
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.md,
                    children: [
                      for (final provider in title.watchProviders)
                        _ProviderChip(
                          name: provider.providerName,
                          logoPath: provider.logoPath,
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
        if (title.cast.isNotEmpty)
          SliverToBoxAdapter(child: _CastRail(cast: title.cast)),
        if (title.mediaType == MediaType.tv && title.seasons.isNotEmpty)
          SliverToBoxAdapter(
            child: SeasonList(tvId: title.id, seasons: title.seasons),
          ),
        if (title.similar.isNotEmpty)
          SliverToBoxAdapter(
            child: PosterRail(
              heading: 'Similar titles',
              titles: AsyncValue.data(title.similar),
              onTitleTap: (summary) => context.push(
                titleDetailPath(summary.id, summary.mediaType),
              ),
            ),
          ),
        const SliverToBoxAdapter(child: TmdbAttribution()),
      ],
    );
  }
}

class _Backdrop extends StatelessWidget {
  const _Backdrop({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImage(imageUrl: url, fit: BoxFit.cover),
        // Keeps the app-bar controls legible over arbitrary artwork.
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: AppOpacity.scrim),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({required this.title});

  final TitleDetail title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final parts = <String>[
      title.mediaType.label,
      if (title.year != null) '${title.year}',
      if (title.runtime != null) '${title.runtime} min',
      if (title.certification != null) title.certification!,
    ];

    return Row(
      children: [
        if (title.voteAverage > 0) ...[
          const Icon(Icons.star_rounded, size: 18, color: AppColors.rating),
          const SizedBox(width: AppSpacing.xs),
          Text(
            title.voteAverage.toStringAsFixed(1),
            style: theme.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(width: AppSpacing.md),
        ],
        Expanded(
          child: Text(
            parts.join(' · '),
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
        ),
      ],
    );
  }
}

/// Adds the title to the watchlist, or — once tracked — opens the entry
/// editor so status/rating/notes are one tap away rather than a second trip
/// through the library screen.
class _AddToLibraryButton extends ConsumerWidget {
  const _AddToLibraryButton({
    required this.id,
    required this.mediaType,
    required this.title,
  });

  final int id;
  final MediaType mediaType;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entryAsync =
        ref.watch(libraryEntryProvider((id: id, mediaType: mediaType)));
    final entry = entryAsync.value;

    if (entry == null) {
      return OutlinedButton.icon(
        onPressed: () => ref
            .read(libraryRepositoryProvider)
            .add(id, mediaType),
        icon: const Icon(Icons.add, size: 18),
        label: const Text('Add to library'),
      );
    }

    return OutlinedButton.icon(
      onPressed: () => showEntryDetailSheet(
        context,
        id: id,
        mediaType: mediaType,
        title: title,
      ),
      icon: const Icon(Icons.check, size: 18),
      label: Text(entry.status.label),
    );
  }
}

/// The permanent "never show me this" action. Distinct from removing a
/// library entry: dismissing works on titles that were never tracked at all,
/// and excludes them from every future Discover deck.
class _DismissButton extends ConsumerWidget {
  const _DismissButton({required this.id, required this.mediaType});

  final int id;
  final MediaType mediaType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDismissed =
        ref.watch(isDismissedProvider((id: id, mediaType: mediaType))).value ??
            false;
    final repo = ref.read(libraryRepositoryProvider);

    return IconButton(
      tooltip: isDismissed ? 'Undo dismiss' : 'Never show me this',
      icon: Icon(isDismissed ? Icons.visibility_off : Icons.visibility_off_outlined),
      onPressed: () => isDismissed
          ? repo.undismiss(id, mediaType)
          : repo.dismiss(id, mediaType),
    );
  }
}

class _TrailerLink extends StatelessWidget {
  const _TrailerLink({required this.youtubeKey});

  final String youtubeKey;

  @override
  Widget build(BuildContext context) {
    final url = 'https://www.youtube.com/watch?v=$youtubeKey';

    // No url_launcher dependency yet, and adding a package just to open a link
    // is not worth the audit — copying the URL is honest and works everywhere.
    return OutlinedButton.icon(
      onPressed: () async {
        await Clipboard.setData(ClipboardData(text: url));
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Trailer link copied')),
        );
      },
      icon: const Icon(Icons.play_circle_outline, size: 18),
      label: const Text('Copy trailer link'),
    );
  }
}

class _ProviderChip extends StatelessWidget {
  const _ProviderChip({required this.name, this.logoPath});

  final String name;
  final String? logoPath;

  @override
  Widget build(BuildContext context) {
    final logo = TmdbImage.url(logoPath, size: TmdbImageSize.w92);

    return Chip(
      avatar: logo == null
          ? null
          : ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.sm),
              child: CachedNetworkImage(imageUrl: logo, fit: BoxFit.cover),
            ),
      label: Text(name),
    );
  }
}

class _CastRail extends StatelessWidget {
  const _CastRail({required this.cast});

  final List<CastMember> cast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.xl,
            AppSpacing.lg,
            AppSpacing.md,
          ),
          child: Text('Cast', style: theme.textTheme.titleMedium),
        ),
        SizedBox(
          height: 168,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            itemCount: cast.length,
            separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.md),
            itemBuilder: (context, index) {
              final member = cast[index];
              final photo = TmdbImage.profile(member.profilePath);

              return Semantics(
                label: member.character == null
                    ? member.name
                    : '${member.name} as ${member.character}',
                child: ExcludeSemantics(
                  child: SizedBox(
                    width: 90,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(AppRadius.md),
                          child: SizedBox(
                            width: 90,
                            height: 110,
                            child: photo == null
                                ? ColoredBox(
                                    color:
                                        theme.colorScheme.surfaceContainerHigh,
                                    child: Icon(
                                      Icons.person_outline,
                                      color: theme.colorScheme.onSurfaceVariant,
                                    ),
                                  )
                                : CachedNetworkImage(
                                    imageUrl: photo,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          member.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
