// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Video _$VideoFromJson(Map<String, dynamic> json) => _Video(
  id: json['id'] as String,
  key: json['key'] as String,
  name: json['name'] as String,
  site: json['site'] as String,
  type: json['type'] as String,
  official: json['official'] as bool? ?? false,
);

Map<String, dynamic> _$VideoToJson(_Video instance) => <String, dynamic>{
  'id': instance.id,
  'key': instance.key,
  'name': instance.name,
  'site': instance.site,
  'type': instance.type,
  'official': instance.official,
};
