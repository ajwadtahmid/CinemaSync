// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TitleDetail _$TitleDetailFromJson(Map<String, dynamic> json) => _TitleDetail(
  id: (json['id'] as num).toInt(),
  mediaType: $enumDecode(_$MediaTypeEnumMap, json['mediaType']),
  title: json['title'] as String,
  overview: json['overview'] as String? ?? '',
  posterPath: json['posterPath'] as String?,
  backdropPath: json['backdropPath'] as String?,
  voteAverage: (json['voteAverage'] as num?)?.toDouble() ?? 0,
  releaseDate: json['releaseDate'] as String?,
  tagline: json['tagline'] as String?,
  runtime: (json['runtime'] as num?)?.toInt(),
  certification: json['certification'] as String?,
  imdbId: json['imdbId'] as String?,
  genres:
      (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Genre>[],
  cast:
      (json['cast'] as List<dynamic>?)
          ?.map((e) => CastMember.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CastMember>[],
  videos:
      (json['videos'] as List<dynamic>?)
          ?.map((e) => Video.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Video>[],
  watchProviders:
      (json['watchProviders'] as List<dynamic>?)
          ?.map((e) => WatchProvider.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <WatchProvider>[],
  recommendations:
      (json['recommendations'] as List<dynamic>?)
          ?.map((e) => TitleSummary.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TitleSummary>[],
  similar:
      (json['similar'] as List<dynamic>?)
          ?.map((e) => TitleSummary.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TitleSummary>[],
  keywords:
      (json['keywords'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  seasons:
      (json['seasons'] as List<dynamic>?)
          ?.map((e) => TvSeason.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TvSeason>[],
);

Map<String, dynamic> _$TitleDetailToJson(_TitleDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mediaType': _$MediaTypeEnumMap[instance.mediaType]!,
      'title': instance.title,
      'overview': instance.overview,
      'posterPath': instance.posterPath,
      'backdropPath': instance.backdropPath,
      'voteAverage': instance.voteAverage,
      'releaseDate': instance.releaseDate,
      'tagline': instance.tagline,
      'runtime': instance.runtime,
      'certification': instance.certification,
      'imdbId': instance.imdbId,
      'genres': instance.genres,
      'cast': instance.cast,
      'videos': instance.videos,
      'watchProviders': instance.watchProviders,
      'recommendations': instance.recommendations,
      'similar': instance.similar,
      'keywords': instance.keywords,
      'seasons': instance.seasons,
    };

const _$MediaTypeEnumMap = {MediaType.movie: 'movie', MediaType.tv: 'tv'};
