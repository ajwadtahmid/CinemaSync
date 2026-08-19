import 'package:freezed_annotation/freezed_annotation.dart';

import 'cast_member.dart';
import 'genre.dart';
import 'media_type.dart';
import 'title_summary.dart';
import 'video.dart';
import 'watch_provider.dart';

part 'title_detail.freezed.dart';
part 'title_detail.g.dart';

/// Full details for a single title, parsed from a TMDB detail response with
/// `append_to_response=videos,credits,watch/providers,recommendations,similar,`
/// `release_dates,content_ratings,external_ids,keywords`.
@freezed
abstract class TitleDetail with _$TitleDetail {
  const factory TitleDetail({
    required int id,
    required MediaType mediaType,
    required String title,
    @Default('') String overview,
    String? posterPath,
    String? backdropPath,
    @Default(0) double voteAverage,
    String? releaseDate,
    String? tagline,
    int? runtime,

    /// Age certification for the user's region (e.g. "PG-13", "TV-MA"), if TMDB
    /// has one. From `release_dates` (movie) / `content_ratings` (tv).
    String? certification,

    /// IMDb id (e.g. "tt0133093") from `external_ids`, for a "View on IMDb"
    /// link — and the exact-match key used by the Phase 4 CSV importers.
    String? imdbId,
    @Default(<Genre>[]) List<Genre> genres,
    @Default(<CastMember>[]) List<CastMember> cast,
    @Default(<Video>[]) List<Video> videos,
    @Default(<WatchProvider>[]) List<WatchProvider> watchProviders,
    @Default(<TitleSummary>[]) List<TitleSummary> recommendations,
    @Default(<TitleSummary>[]) List<TitleSummary> similar,
    @Default(<String>[]) List<String> keywords,
  }) = _TitleDetail;

  const TitleDetail._();

  factory TitleDetail.fromJson(Map<String, dynamic> json) =>
      _$TitleDetailFromJson(json);

  /// Parse a TMDB movie/tv detail response for the given [mediaType].
  /// [watchProviderRegion] selects which region's "flatrate" providers to use.
  factory TitleDetail.fromTmdb(
    Map<String, dynamic> json,
    MediaType mediaType, {
    String watchProviderRegion = 'US',
  }) {
    // Runtime: movies use `runtime`; TV uses `episode_run_time` (a list).
    int? runtime;
    if (json['runtime'] != null) {
      runtime = (json['runtime'] as num).toInt();
    } else if (json['episode_run_time'] is List &&
        (json['episode_run_time'] as List).isNotEmpty) {
      runtime = ((json['episode_run_time'] as List).first as num).toInt();
    }

    final genres = (json['genres'] as List<dynamic>?)
            ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
            .toList() ??
        const <Genre>[];

    final cast = ((json['credits']?['cast']) as List<dynamic>?)
            ?.take(15)
            .map((e) => CastMember.fromJson(e as Map<String, dynamic>))
            .toList() ??
        const <CastMember>[];

    final videos = ((json['videos']?['results']) as List<dynamic>?)
            ?.map((e) => Video.fromJson(e as Map<String, dynamic>))
            .toList() ??
        const <Video>[];

    // watch/providers -> results -> <REGION> -> flatrate[]
    final providersForRegion = (json['watch/providers']?['results']
        ?[watchProviderRegion]) as Map<String, dynamic>?;
    final watchProviders = ((providersForRegion?['flatrate']) as List<dynamic>?)
            ?.map((e) => WatchProvider.fromJson(e as Map<String, dynamic>))
            .toList() ??
        const <WatchProvider>[];

    List<TitleSummary> parseSummaries(dynamic node) =>
        ((node?['results']) as List<dynamic>?)
            ?.map((e) =>
                TitleSummary.fromTmdb(e as Map<String, dynamic>, mediaType))
            .toList() ??
        const <TitleSummary>[];

    // Movie certification: release_dates -> results -> <REGION> -> release_dates
    // -> certification (prefer theatrical, type 3). Empty strings are skipped.
    String? movieCert(List<dynamic>? results, String region) {
      for (final e in (results ?? const []).whereType<Map<String, dynamic>>()) {
        if (e['iso_3166_1'] != region) continue;
        String? fallback;
        for (final rd in ((e['release_dates'] as List<dynamic>?) ?? const [])
            .whereType<Map<String, dynamic>>()) {
          final c = (rd['certification'] as String?)?.trim();
          if (c == null || c.isEmpty) continue;
          if (rd['type'] == 3) return c;
          fallback ??= c;
        }
        return fallback;
      }
      return null;
    }

    // TV certification: content_ratings -> results -> <REGION> -> rating.
    String? tvCert(List<dynamic>? results, String region) {
      for (final e in (results ?? const []).whereType<Map<String, dynamic>>()) {
        if (e['iso_3166_1'] != region) continue;
        final r = (e['rating'] as String?)?.trim();
        return (r == null || r.isEmpty) ? null : r;
      }
      return null;
    }

    String? certification;
    if (mediaType == MediaType.movie) {
      final results = json['release_dates']?['results'] as List<dynamic>?;
      certification =
          movieCert(results, watchProviderRegion) ?? movieCert(results, 'US');
    } else {
      final results = json['content_ratings']?['results'] as List<dynamic>?;
      certification =
          tvCert(results, watchProviderRegion) ?? tvCert(results, 'US');
    }

    final rawImdb =
        (json['external_ids']?['imdb_id'] ?? json['imdb_id']) as String?;
    final imdbId = (rawImdb != null && rawImdb.isNotEmpty) ? rawImdb : null;

    // keywords: movies use keywords.keywords; TV uses keywords.results.
    final kwNode = json['keywords'] as Map<String, dynamic>?;
    final kwList =
        (kwNode?['keywords'] ?? kwNode?['results']) as List<dynamic>?;
    final keywords = (kwList ?? const [])
        .whereType<Map<String, dynamic>>()
        .map((e) => e['name'] as String?)
        .whereType<String>()
        .take(12)
        .toList();

    return TitleDetail(
      id: (json['id'] as num).toInt(),
      mediaType: mediaType,
      title: (json['title'] ?? json['name'] ?? '') as String,
      overview: (json['overview'] ?? '') as String,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0,
      releaseDate: (json['release_date'] ?? json['first_air_date']) as String?,
      tagline: json['tagline'] as String?,
      runtime: runtime,
      certification: certification,
      imdbId: imdbId,
      genres: genres,
      cast: cast,
      videos: videos,
      watchProviders: watchProviders,
      recommendations: parseSummaries(json['recommendations']),
      similar: parseSummaries(json['similar']),
      keywords: keywords,
    );
  }

  /// The release/first-air year, if known.
  int? get year {
    final date = releaseDate;
    if (date == null || date.length < 4) return null;
    return int.tryParse(date.substring(0, 4));
  }

  /// The best embeddable trailer, if any — an official YouTube trailer wins,
  /// otherwise any YouTube trailer.
  Video? get trailer {
    for (final v in videos) {
      if (v.isYoutubeTrailer && v.official) return v;
    }
    for (final v in videos) {
      if (v.isYoutubeTrailer) return v;
    }
    return null;
  }

  /// A condensed [TitleSummary] view of this detail.
  TitleSummary get asSummary => TitleSummary(
        id: id,
        mediaType: mediaType,
        title: title,
        overview: overview,
        posterPath: posterPath,
        backdropPath: backdropPath,
        voteAverage: voteAverage,
        releaseDate: releaseDate,
        genreIds: genres.map((g) => g.id).toList(),
      );
}
