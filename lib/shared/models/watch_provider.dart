import 'package:freezed_annotation/freezed_annotation.dart';

part 'watch_provider.freezed.dart';
part 'watch_provider.g.dart';

/// A streaming/rental provider where a title is available to watch.
@freezed
abstract class WatchProvider with _$WatchProvider {
  const factory WatchProvider({
    @JsonKey(name: 'provider_id') required int providerId,
    @JsonKey(name: 'provider_name') required String providerName,
    @JsonKey(name: 'logo_path') String? logoPath,
  }) = _WatchProvider;

  factory WatchProvider.fromJson(Map<String, dynamic> json) =>
      _$WatchProviderFromJson(json);
}
