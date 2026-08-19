import 'package:freezed_annotation/freezed_annotation.dart';

import 'media_type.dart';

part 'title_summary.freezed.dart';
part 'title_summary.g.dart';

/// A lightweight title used in lists, decks, and search results.
///
/// TMDB names fields differently for movies (`title`/`release_date`) and TV
/// (`name`/`first_air_date`); [TitleSummary.fromTmdb] normalizes them. The
/// generated `fromJson`/`toJson` use this normalized shape and are what the
/// local Drift cache stores.
@freezed
abstract class TitleSummary with _$TitleSummary {
  const factory TitleSummary({
    required int id,
    required MediaType mediaType,
    required String title,
    @Default('') String overview,
    String? posterPath,
    String? backdropPath,
    @Default(0) double voteAverage,
    String? releaseDate,
    @Default(<int>[]) List<int> genreIds,
  }) = _TitleSummary;

  const TitleSummary._();

  factory TitleSummary.fromJson(Map<String, dynamic> json) =>
      _$TitleSummaryFromJson(json);

  /// Parse a TMDB discover/list result for a known [mediaType].
  factory TitleSummary.fromTmdb(
    Map<String, dynamic> json,
    MediaType mediaType,
  ) {
    return TitleSummary(
      // TMDB sends int ids, but parse through `num` defensively so a
      // float id can never crash an ingest.
      id: (json['id'] as num).toInt(),
      mediaType: mediaType,
      title: (json['title'] ?? json['name'] ?? '') as String,
      overview: (json['overview'] ?? '') as String,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0,
      releaseDate: (json['release_date'] ?? json['first_air_date']) as String?,
      // whereType drops any null/non-int genre id instead of throwing
      // mid-parse — one malformed entry should not lose the whole page.
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.whereType<int>().toList() ??
              const [],
    );
  }

  /// Parse a TMDB `/search/multi` result, reading the embedded `media_type`.
  /// Returns null for non-movie/tv results (e.g. `person`).
  static TitleSummary? fromTmdbMulti(Map<String, dynamic> json) {
    final type = json['media_type'] as String?;
    if (type != 'movie' && type != 'tv') return null;
    return TitleSummary.fromTmdb(json, MediaType.fromTmdb(type));
  }

  /// The release/first-air year, if known.
  int? get year {
    final date = releaseDate;
    if (date == null || date.length < 4) return null;
    return int.tryParse(date.substring(0, 4));
  }
}
