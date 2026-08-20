// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_season.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TvSeason _$TvSeasonFromJson(Map<String, dynamic> json) => _TvSeason(
  seasonNumber: (json['seasonNumber'] as num).toInt(),
  name: json['name'] as String,
  episodeCount: (json['episodeCount'] as num).toInt(),
  airDate: json['airDate'] as String?,
  posterPath: json['posterPath'] as String?,
);

Map<String, dynamic> _$TvSeasonToJson(_TvSeason instance) => <String, dynamic>{
  'seasonNumber': instance.seasonNumber,
  'name': instance.name,
  'episodeCount': instance.episodeCount,
  'airDate': instance.airDate,
  'posterPath': instance.posterPath,
};
