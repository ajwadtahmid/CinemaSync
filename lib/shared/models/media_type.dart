import 'package:json_annotation/json_annotation.dart';

/// The kind of title. A title's identity is always the pair
/// `(tmdb_id, media_type)` — never the id alone.
enum MediaType {
  @JsonValue('movie')
  movie,
  @JsonValue('tv')
  tv;

  /// The value TMDB uses in paths and `media_type` fields. Also the value
  /// stored in the database and written to the export format, so it must not
  /// change without a schema migration.
  String get tmdbValue => name;

  /// Human-readable label.
  String get label => switch (this) {
        MediaType.movie => 'Movie',
        MediaType.tv => 'TV',
      };

  /// Parse a TMDB `media_type` string, defaulting to [MediaType.movie].
  static MediaType fromTmdb(String? value) =>
      value == 'tv' ? MediaType.tv : MediaType.movie;
}
