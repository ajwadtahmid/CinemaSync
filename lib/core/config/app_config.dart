/// Compile-time configuration.
///
/// There are no secrets here and there never will be: the TMDB token lives
/// only as a server-side secret on the proxy. Everything below is either a
/// public URL or a user-overridable default.
class AppConfig {
  const AppConfig._();

  /// Base URL of the stateless TMDB proxy.
  ///
  /// Overridable at build time with
  /// `--dart-define=CINEMASYNC_PROXY_BASE_URL=…`, and at runtime in Settings,
  /// so nobody is forced to trust the default host. Phase 1 replaces this
  /// placeholder with the deployed Cloudflare Worker URL.
  static const String proxyBaseUrl = String.fromEnvironment(
    'CINEMASYNC_PROXY_BASE_URL',
    defaultValue: 'http://localhost:8787',
  );

  /// TMDB's image CDN. Artwork is fetched from here directly — never through
  /// the proxy — so the proxy operator never sees what a user is looking at.
  static const String tmdbImageBase = 'https://image.tmdb.org/t/p';

  /// Filename of the on-device database.
  static const String databaseName = 'cinemasync';
}
