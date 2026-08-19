// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CastMember _$CastMemberFromJson(Map<String, dynamic> json) => _CastMember(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  character: json['character'] as String?,
  profilePath: json['profile_path'] as String?,
);

Map<String, dynamic> _$CastMemberToJson(_CastMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'character': instance.character,
      'profile_path': instance.profilePath,
    };
