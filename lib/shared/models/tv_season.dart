import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_season.freezed.dart';
part 'tv_season.g.dart';

/// A TV season entry from the TMDB show detail response.
///
/// Present in the same `/tv/{id}` payload as [TitleDetail] — no
/// `append_to_response` needed — so listing seasons costs no extra request.
@freezed
abstract class TvSeason with _$TvSeason {
  const factory TvSeason({
    required int seasonNumber,
    required String name,
    required int episodeCount,
    String? airDate,
    String? posterPath,
  }) = _TvSeason;

  const TvSeason._();

  factory TvSeason.fromJson(Map<String, dynamic> json) =>
      _$TvSeasonFromJson(json);

  factory TvSeason.fromTmdb(Map<String, dynamic> json) {
    final number = (json['season_number'] as num?)?.toInt() ?? 0;
    final name = json['name'] as String?;
    return TvSeason(
      seasonNumber: number,
      name: (name != null && name.isNotEmpty) ? name : 'Season $number',
      episodeCount: (json['episode_count'] as num?)?.toInt() ?? 0,
      airDate: json['air_date'] as String?,
      posterPath: json['poster_path'] as String?,
    );
  }

  int? get year {
    final date = airDate;
    if (date == null || date.length < 4) return null;
    return int.tryParse(date.substring(0, 4));
  }
}
