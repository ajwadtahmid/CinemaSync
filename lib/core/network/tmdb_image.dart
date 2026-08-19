import '../config/app_config.dart';

/// Available TMDB image sizes (a subset of TMDB's configuration).
enum TmdbImageSize {
  w92('w92'),
  w154('w154'),
  w185('w185'),
  w342('w342'),
  w500('w500'),
  w780('w780'),
  original('original');

  const TmdbImageSize(this.value);

  final String value;
}

/// Builds full image URLs from TMDB image `path` values.
///
/// Images are served directly from TMDB's CDN to the device and are never
/// proxied. Routing them through the proxy would hand its operator a record of
/// every poster a user looked at — far more revealing than the metadata
/// queries the proxy already forwards.
class TmdbImage {
  const TmdbImage._();

  /// Returns the full CDN URL for [path], or null when [path] is null/empty.
  static String? url(String? path, {TmdbImageSize size = TmdbImageSize.w500}) {
    if (path == null || path.isEmpty) return null;
    final normalized = path.startsWith('/') ? path : '/$path';
    return '${AppConfig.tmdbImageBase}/${size.value}$normalized';
  }

  /// Poster-optimized URL (defaults to w342).
  static String? poster(String? path,
          {TmdbImageSize size = TmdbImageSize.w342}) =>
      url(path, size: size);

  /// Backdrop-optimized URL (defaults to w780).
  static String? backdrop(String? path,
          {TmdbImageSize size = TmdbImageSize.w780}) =>
      url(path, size: size);

  /// Profile-photo URL (defaults to w185).
  static String? profile(String? path,
          {TmdbImageSize size = TmdbImageSize.w185}) =>
      url(path, size: size);
}
