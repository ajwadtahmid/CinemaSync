import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../shared/models/media_type.dart';
import '../../../shared/models/title_summary.dart';
import '../data/catalog_repository.dart';

/// Trending across movies and TV — the default browse rail.
final trendingProvider = FutureProvider.autoDispose<List<TitleSummary>>((ref) {
  return ref.watch(catalogRepositoryProvider).trending();
});

final topRatedMoviesProvider =
    FutureProvider.autoDispose<List<TitleSummary>>((ref) {
  return ref.watch(catalogRepositoryProvider).topRated(MediaType.movie);
});

final topRatedTvProvider =
    FutureProvider.autoDispose<List<TitleSummary>>((ref) {
  return ref.watch(catalogRepositoryProvider).topRated(MediaType.tv);
});

/// The raw text in the search field, updated on every keystroke.
class SearchQuery extends Notifier<String> {
  @override
  String build() => '';

  void update(String value) => state = value;

  void clear() => state = '';
}

final searchQueryProvider =
    NotifierProvider<SearchQuery, String>(SearchQuery.new);

/// The query actually sent to the network, debounced.
///
/// Search-as-you-type would otherwise fire a request per character — wasteful
/// for us, rude to TMDB, and it hands the proxy traffic it has no reason to
/// see. Each keystroke rebuilds this provider, discarding the previous
/// delay's result.
final _debouncedQueryProvider = FutureProvider.autoDispose<String>((ref) async {
  final query = ref.watch(searchQueryProvider);
  if (query.trim().isEmpty) return '';

  await Future<void>.delayed(AppDurations.debounce);
  return query;
});

/// Search results for the debounced query. An empty query yields an empty list
/// rather than an error, so the idle state is not a failure state.
final searchResultsProvider =
    FutureProvider.autoDispose<List<TitleSummary>>((ref) async {
  final query = await ref.watch(_debouncedQueryProvider.future);
  if (query.trim().isEmpty) return const [];

  // Hold results briefly so returning from a detail screen does not re-issue
  // the same search.
  final link = ref.keepAlive();
  final timer = Timer(const Duration(minutes: 2), link.close);
  ref.onDispose(timer.cancel);

  return ref.watch(catalogRepositoryProvider).search(query);
});
