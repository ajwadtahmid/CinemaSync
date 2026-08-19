// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TitleSummary _$TitleSummaryFromJson(Map<String, dynamic> json) =>
    _TitleSummary(
      id: (json['id'] as num).toInt(),
      mediaType: $enumDecode(_$MediaTypeEnumMap, json['mediaType']),
      title: json['title'] as String,
      overview: json['overview'] as String? ?? '',
      posterPath: json['posterPath'] as String?,
      backdropPath: json['backdropPath'] as String?,
      voteAverage: (json['voteAverage'] as num?)?.toDouble() ?? 0,
      releaseDate: json['releaseDate'] as String?,
      genreIds:
          (json['genreIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const <int>[],
    );

Map<String, dynamic> _$TitleSummaryToJson(_TitleSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mediaType': _$MediaTypeEnumMap[instance.mediaType]!,
      'title': instance.title,
      'overview': instance.overview,
      'posterPath': instance.posterPath,
      'backdropPath': instance.backdropPath,
      'voteAverage': instance.voteAverage,
      'releaseDate': instance.releaseDate,
      'genreIds': instance.genreIds,
    };

const _$MediaTypeEnumMap = {MediaType.movie: 'movie', MediaType.tv: 'tv'};
