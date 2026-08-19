import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/db/daos/titles_dao.dart';
import '../../../core/db/database.dart';
import '../../../core/network/error_mapper.dart';
import '../../../core/network/tmdb_api.dart';
import '../../../shared/models/genre.dart';
import '../../../shared/models/media_type.dart';
import '../../../shared/models/title_detail.dart';
import '../../../shared/models/title_summary.dart';
import 'title_cache_mapper.dart';

/// Reads the TMDB catalogue and keeps a local copy of what the user has seen.
///
/// Everything returned here passes through the cache on the way in, so a title
/// the user has already encountered still renders when the network is gone.
/// Failures are typed: callers never see a `DioException`.
class CatalogRepository {
  CatalogRepository({required TmdbApi api, required TitlesDao titles})
      : _api = api,
        _titles = titles;

  final TmdbApi _api;
  final TitlesDao _titles;

  Future<List<TitleSummary>> trending({MediaType? mediaType, int page = 1}) {
    return _fetchAndCache(
      () => _api.trending(mediaType: mediaType, page: page),
    );
  }

  Future<List<TitleSummary>> topRated(MediaType mediaType, {int page = 1}) {
    return _fetchAndCache(() => _api.topRatedDiscover(mediaType, page: page));
  }

  Future<List<TitleSummary>> search(String query, {int page = 1}) {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return Future.value(const []);
    return _fetchAndCache(() => _api.searchMulti(trimmed, page: page));
  }

  Future<List<Genre>> genres(MediaType mediaType) async {
    try {
      return await _api.genres(mediaType);
    } catch (e) {
      throw mapError(e);
    }
  }

  /// Full details for a title.
  ///
  /// On a network failure this falls back to the cached row if we have one, so
  /// opening a previously viewed title offline shows what we know rather than
  /// an error. The fallback carries no cast, videos or providers — those were
  /// never cached — so the UI should present it as partial rather than imply
  /// the cast list is genuinely empty.
  Future<TitleDetail> detail(
    int id,
    MediaType mediaType, {
    String watchProviderRegion = 'US',
  }) async {
    try {
      final detail = await _api.detail(
        id,
        mediaType,
        watchProviderRegion: watchProviderRegion,
      );
      await _titles.upsertAll([detail.toCacheRow()]);
      return detail;
    } catch (e) {
      final failure = mapError(e);
      final cached = await _titles.byKey(id, mediaType);
      if (cached != null) return _detailFromCache(cached);
      throw failure;
    }
  }

  /// Whether a title is readable offline — lets the UI choose between an error
  /// state and a degraded-but-useful one.
  Future<bool> isCached(int id, MediaType mediaType) async {
    return await _titles.byKey(id, mediaType) != null;
  }

  Future<List<TitleSummary>> _fetchAndCache(
    Future<List<TitleSummary>> Function() fetch,
  ) async {
    try {
      final results = await fetch();
      if (results.isNotEmpty) {
        await _titles.upsertAll(results.map((t) => t.toCacheRow()));
      }
      return results;
    } catch (e) {
      throw mapError(e);
    }
  }

  TitleDetail _detailFromCache(Title row) {
    final summary = row.toSummary();
    return TitleDetail(
      id: summary.id,
      mediaType: summary.mediaType,
      title: summary.title,
      overview: summary.overview,
      posterPath: summary.posterPath,
      backdropPath: summary.backdropPath,
      voteAverage: summary.voteAverage,
      releaseDate: summary.releaseDate,
      runtime: row.runtime,
      imdbId: row.imdbId,
    );
  }
}

final catalogRepositoryProvider = Provider<CatalogRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return CatalogRepository(
    api: ref.watch(tmdbApiProvider),
    titles: db.titlesDao,
  );
});
