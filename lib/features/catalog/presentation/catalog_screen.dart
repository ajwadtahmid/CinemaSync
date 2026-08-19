import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/error/failure.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/models/title_summary.dart';
import '../../../shared/widgets/app_loader.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/poster_card.dart';
import '../../../shared/widgets/tmdb_attribution.dart';
import '../application/catalog_providers.dart';
import 'poster_rail.dart';

/// Browse and search the TMDB catalogue.
///
/// Shows curated rails until the user types, then swaps to search results.
/// Both surfaces render TMDB data, so attribution is present for both.
class CatalogScreen extends ConsumerStatefulWidget {
  const CatalogScreen({super.key});

  @override
  ConsumerState<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends ConsumerState<CatalogScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: ref.read(searchQueryProvider));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = ref.watch(searchQueryProvider);
    final isSearching = query.trim().isNotEmpty;

    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              0,
              AppSpacing.lg,
              AppSpacing.md,
            ),
            child: TextField(
              controller: _controller,
              autocorrect: false,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Search movies and TV',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: isSearching
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        tooltip: 'Clear search',
                        onPressed: () {
                          _controller.clear();
                          ref.read(searchQueryProvider.notifier).clear();
                        },
                      )
                    : null,
              ),
              onChanged: (value) =>
                  ref.read(searchQueryProvider.notifier).update(value),
            ),
          ),
          Expanded(
            child: isSearching ? const _SearchResults() : const _BrowseRails(),
          ),
          const TmdbAttribution(compact: true),
        ],
      ),
    );
  }
}

void _openTitle(BuildContext context, TitleSummary title) {
  context.push(titleDetailPath(title.id, title.mediaType));
}

class _BrowseRails extends ConsumerWidget {
  const _BrowseRails();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void open(TitleSummary title) => _openTitle(context, title);

    return ListView(
      children: [
        PosterRail(
          heading: 'Trending this week',
          titles: ref.watch(trendingProvider),
          onTitleTap: open,
        ),
        PosterRail(
          heading: 'Top rated films',
          titles: ref.watch(topRatedMoviesProvider),
          onTitleTap: open,
        ),
        PosterRail(
          heading: 'Top rated TV',
          titles: ref.watch(topRatedTvProvider),
          onTitleTap: open,
        ),
        const SizedBox(height: AppSpacing.xl),
      ],
    );
  }
}

class _SearchResults extends ConsumerWidget {
  const _SearchResults();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(searchResultsProvider);

    return results.when(
      loading: () => const AppLoader(),
      error: (error, _) => ErrorView(
        message:
            error is Failure ? error.message : 'Search could not be completed.',
        onRetry: () => ref.invalidate(searchResultsProvider),
      ),
      data: (titles) {
        if (titles.isEmpty) {
          return const EmptyState(
            icon: Icons.search_off,
            title: 'No matches',
            message: 'Try a different spelling, or a shorter search.',
          );
        }
        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 140,
            childAspectRatio: 0.48,
            crossAxisSpacing: AppSpacing.md,
            mainAxisSpacing: AppSpacing.lg,
          ),
          itemCount: titles.length,
          itemBuilder: (context, index) {
            final title = titles[index];
            return PosterCard(
              title: title.title,
              mediaType: title.mediaType,
              posterPath: title.posterPath,
              year: title.year,
              onTap: () => _openTitle(context, title),
            );
          },
        );
      },
    );
  }
}
