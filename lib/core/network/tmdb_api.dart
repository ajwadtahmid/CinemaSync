import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/models/genre.dart';
import '../../shared/models/media_type.dart';
import '../../shared/models/title_detail.dart';
import '../../shared/models/title_summary.dart';
import '../../shared/models/tv_episode.dart';
import 'dio_client.dart';

/// A thin, typed client over the TMDB endpoints the app uses, via the proxy.
///
/// Every path here must also be on the proxy's allowlist
/// (`extra/tmdb-proxy/src/index.ts`) or it comes back 400. That coupling is
/// deliberate: adding an endpoint should require a conscious decision on both
/// sides rather than silently widening what the proxy will forward.
///
/// Methods throw [DioException]/[FormatException]; callers wrap them with
/// `mapError` into typed failures rather than letting them reach the UI.
class TmdbApi {
  TmdbApi(this._dio);

  final Dio _dio;

  /// Everything the detail screen needs, in one round trip.
  static const _appendToResponse =
      'videos,credits,watch/providers,recommendations,similar,'
      'release_dates,content_ratings,external_ids,keywords';

  // ---- browse ----

  /// Trending titles. [mediaType] null means movies and TV together.
  Future<List<TitleSummary>> trending({
    MediaType? mediaType,
    String window = 'week',
    int page = 1,
  }) async {
    final segment = mediaType?.tmdbValue ?? 'all';
    final res = await _dio.get<Map<String, dynamic>>(
      '/trending/$segment/$window',
      queryParameters: {'page': page},
    );
    return _parseResults(res.data, fallbackType: mediaType);
  }

  /// Filtered movie discovery. Powers the Phase 3 Discover deck as well as
  /// the browse rails.
  Future<List<TitleSummary>> discoverMovies({
    List<int>? genres,
    int? runtimeMin,
    int? runtimeMax,
    int? yearMin,
    int? yearMax,
    double? minRating,
    int? voteCountMin,
    String sortBy = 'popularity.desc',
    int page = 1,
  }) async {
    final res = await _dio.get<Map<String, dynamic>>(
      '/discover/movie',
      queryParameters: {
        if (genres != null && genres.isNotEmpty) 'with_genres': genres.join(','),
        'with_runtime.gte': ?runtimeMin,
        'with_runtime.lte': ?runtimeMax,
        if (yearMin != null) 'primary_release_date.gte': '$yearMin-01-01',
        if (yearMax != null) 'primary_release_date.lte': '$yearMax-12-31',
        'vote_average.gte': ?minRating,
        'vote_count.gte': ?voteCountMin,
        'sort_by': sortBy,
        'page': page,
      },
    );
    return _parseResults(res.data, fallbackType: MediaType.movie);
  }

  /// Filtered TV discovery. TMDB uses different date keys for TV than movies.
  Future<List<TitleSummary>> discoverTv({
    List<int>? genres,
    int? runtimeMin,
    int? runtimeMax,
    int? yearMin,
    int? yearMax,
    double? minRating,
    int? voteCountMin,
    String sortBy = 'popularity.desc',
    int page = 1,
  }) async {
    final res = await _dio.get<Map<String, dynamic>>(
      '/discover/tv',
      queryParameters: {
        if (genres != null && genres.isNotEmpty) 'with_genres': genres.join(','),
        'with_runtime.gte': ?runtimeMin,
        'with_runtime.lte': ?runtimeMax,
        if (yearMin != null) 'first_air_date.gte': '$yearMin-01-01',
        if (yearMax != null) 'first_air_date.lte': '$yearMax-12-31',
        'vote_average.gte': ?minRating,
        'vote_count.gte': ?voteCountMin,
        'sort_by': sortBy,
        'page': page,
      },
    );
    return _parseResults(res.data, fallbackType: MediaType.tv);
  }

  /// Highly-rated titles, via discover rather than TMDB's `/top_rated` path —
  /// which is not on the proxy allowlist, and which gives no control over the
  /// vote-count floor that keeps obscure 10/10s out of the rail.
  Future<List<TitleSummary>> topRatedDiscover(
    MediaType mediaType, {
    int page = 1,
  }) {
    return mediaType == MediaType.movie
        ? discoverMovies(
            minRating: 8,
            voteCountMin: 500,
            sortBy: 'vote_average.desc',
            page: page,
          )
        : discoverTv(
            minRating: 8,
            voteCountMin: 500,
            sortBy: 'vote_average.desc',
            page: page,
          );
  }

  // ---- search ----

  /// Multi-search across movies and TV. People are filtered out rather than
  /// rendered as broken title cards.
  Future<List<TitleSummary>> searchMulti(String query, {int page = 1}) async {
    final res = await _dio.get<Map<String, dynamic>>(
      '/search/multi',
      queryParameters: {'query': query, 'page': page},
    );
    final results = (res.data?['results'] as List<dynamic>?) ?? const [];
    return results
        .whereType<Map<String, dynamic>>()
        .map(TitleSummary.fromTmdbMulti)
        .whereType<TitleSummary>()
        .toList();
  }

  // ---- detail ----

  /// Full details for either media type, in a single request.
  Future<TitleDetail> detail(
    int id,
    MediaType mediaType, {
    String watchProviderRegion = 'US',
  }) async {
    final res = await _dio.get<Map<String, dynamic>>(
      '/${mediaType.tmdbValue}/$id',
      queryParameters: {'append_to_response': _appendToResponse},
    );
    return TitleDetail.fromTmdb(
      res.data!,
      mediaType,
      watchProviderRegion: watchProviderRegion,
    );
  }

  /// Resolve an IMDb id (e.g. "tt1375666") to a TMDB title.
  ///
  /// This is the exact-match path for the Phase 4 CSV importers — an IMDb id
  /// maps unambiguously, where a title-and-year search does not.
  Future<TitleSummary?> findByImdbId(String imdbId) async {
    final res = await _dio.get<Map<String, dynamic>>(
      '/find/$imdbId',
      queryParameters: {'external_source': 'imdb_id'},
    );
    final data = res.data;
    if (data == null) return null;

    final movies = (data['movie_results'] as List<dynamic>?) ?? const [];
    if (movies.isNotEmpty) {
      return TitleSummary.fromTmdb(
        movies.first as Map<String, dynamic>,
        MediaType.movie,
      );
    }
    final tv = (data['tv_results'] as List<dynamic>?) ?? const [];
    if (tv.isNotEmpty) {
      return TitleSummary.fromTmdb(
        tv.first as Map<String, dynamic>,
        MediaType.tv,
      );
    }
    return null;
  }

  // ---- tv seasons ----

  /// Episodes for one season of a TV show. Seasons themselves come from
  /// [TitleDetail.seasons] — already present in the base `/tv/{id}` payload —
  /// so this is only needed once a specific season is opened.
  Future<List<TvEpisode>> tvSeasonEpisodes(int tvId, int seasonNumber) async {
    final res = await _dio.get<Map<String, dynamic>>(
      '/tv/$tvId/season/$seasonNumber',
    );
    final episodes = (res.data?['episodes'] as List<dynamic>?) ?? const [];
    return episodes
        .whereType<Map<String, dynamic>>()
        .map(TvEpisode.fromTmdb)
        .toList();
  }

  // ---- genres ----

  /// The genre id → name map for a media type. Cached on device by callers;
  /// this list changes about never.
  Future<List<Genre>> genres(MediaType mediaType) async {
    final res = await _dio.get<Map<String, dynamic>>(
      '/genre/${mediaType.tmdbValue}/list',
    );
    final list = (res.data?['genres'] as List<dynamic>?) ?? const [];
    return list.whereType<Map<String, dynamic>>().map(Genre.fromJson).toList();
  }

  // ---- internals ----

  /// Parses a TMDB paginated `results` array.
  ///
  /// [fallbackType] is used when the entries carry no `media_type` of their
  /// own, which is the case for every endpoint except `/trending/all`.
  List<TitleSummary> _parseResults(
    Map<String, dynamic>? data, {
    MediaType? fallbackType,
  }) {
    final results = (data?['results'] as List<dynamic>?) ?? const [];
    return results
        .whereType<Map<String, dynamic>>()
        .map((json) {
          if (fallbackType != null) {
            return TitleSummary.fromTmdb(json, fallbackType);
          }
          // Mixed feed: trust each entry's own media_type, and drop people.
          return TitleSummary.fromTmdbMulti(json);
        })
        .whereType<TitleSummary>()
        .toList();
  }
}

final tmdbApiProvider = Provider<TmdbApi>((ref) {
  return TmdbApi(ref.watch(tmdbDioProvider));
});
