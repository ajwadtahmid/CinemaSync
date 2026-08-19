// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WatchProvider _$WatchProviderFromJson(Map<String, dynamic> json) =>
    _WatchProvider(
      providerId: (json['provider_id'] as num).toInt(),
      providerName: json['provider_name'] as String,
      logoPath: json['logo_path'] as String?,
    );

Map<String, dynamic> _$WatchProviderToJson(_WatchProvider instance) =>
    <String, dynamic>{
      'provider_id': instance.providerId,
      'provider_name': instance.providerName,
      'logo_path': instance.logoPath,
    };
