import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';
part 'video.g.dart';

/// A TMDB video entry (trailer, teaser, clip, …).
@freezed
abstract class Video with _$Video {
  const factory Video({
    required String id,
    required String key,
    required String name,
    required String site,
    required String type,
    @Default(false) bool official,
  }) = _Video;

  const Video._();

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  /// Whether this video is a YouTube-hosted trailer that can be embedded.
  bool get isYoutubeTrailer =>
      site.toLowerCase() == 'youtube' && type.toLowerCase() == 'trailer';
}
