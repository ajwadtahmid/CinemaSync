// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TvEpisode _$TvEpisodeFromJson(Map<String, dynamic> json) => _TvEpisode(
  id: (json['id'] as num).toInt(),
  episodeNumber: (json['episodeNumber'] as num).toInt(),
  name: json['name'] as String,
  overview: json['overview'] as String? ?? '',
  airDate: json['airDate'] as String?,
  stillPath: json['stillPath'] as String?,
  runtime: (json['runtime'] as num?)?.toInt(),
  voteAverage: (json['voteAverage'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$TvEpisodeToJson(_TvEpisode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'episodeNumber': instance.episodeNumber,
      'name': instance.name,
      'overview': instance.overview,
      'airDate': instance.airDate,
      'stillPath': instance.stillPath,
      'runtime': instance.runtime,
      'voteAverage': instance.voteAverage,
    };
