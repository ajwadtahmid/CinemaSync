import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_episode.freezed.dart';
part 'tv_episode.g.dart';

/// A single TV episode from a TMDB season detail response
/// (`/tv/{id}/season/{n}`).
@freezed
abstract class TvEpisode with _$TvEpisode {
  const factory TvEpisode({
    required int id,
    required int episodeNumber,
    required String name,
    @Default('') String overview,
    String? airDate,
    String? stillPath,
    int? runtime,
    @Default(0) double voteAverage,
  }) = _TvEpisode;

  const TvEpisode._();

  factory TvEpisode.fromJson(Map<String, dynamic> json) =>
      _$TvEpisodeFromJson(json);

  factory TvEpisode.fromTmdb(Map<String, dynamic> json) {
    return TvEpisode(
      id: (json['id'] as num).toInt(),
      episodeNumber: (json['episode_number'] as num?)?.toInt() ?? 0,
      name: (json['name'] as String?) ?? '',
      overview: (json['overview'] as String?) ?? '',
      airDate: json['air_date'] as String?,
      stillPath: json['still_path'] as String?,
      runtime: (json['runtime'] as num?)?.toInt(),
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0,
    );
  }

  int? get year {
    final date = airDate;
    if (date == null || date.length < 4) return null;
    return int.tryParse(date.substring(0, 4));
  }
}
