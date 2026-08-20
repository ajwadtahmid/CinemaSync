/// Compile-time configuration.
///
/// The TMDB token itself lives only as a server-side secret on the proxy —
/// that never changes. [clientToken] below is a different, weaker thing: a
/// single static value shared by every install, checked by the Worker only
/// to keep the URL from being a free-for-all if someone finds it. It is
/// baked into the app binary and extractable by anyone who decompiles it, so
/// it is a deterrent against casual scraping, not an identity or an
/// authentication scheme — every install presents the same value, so the
/// proxy still cannot tell two users apart.
class AppConfig {
  const AppConfig._();

  /// Base URL of the stateless TMDB proxy.
  ///
  /// Overridable at build time with
  /// `--dart-define=CINEMASYNC_PROXY_BASE_URL=…`, and at runtime in Settings,
  /// so nobody is forced to trust the default host.
  static const String proxyBaseUrl = String.fromEnvironment(
    'CINEMASYNC_PROXY_BASE_URL',
    defaultValue: 'https://cinemasync-tmdb-proxy.ajwad.workers.dev',
  );

  /// Shared secret sent with every proxy request except `/health`.
  ///
  /// Must match the Worker's `CLIENT_TOKEN` secret exactly. Overridable at
  /// build time with `--dart-define=CINEMASYNC_CLIENT_TOKEN=…` — set both
  /// sides to the same value when rotating it.
  static const String clientToken = String.fromEnvironment(
    'CINEMASYNC_CLIENT_TOKEN',
    defaultValue: '2d73a5bef2d4467b52e75d92b3e44180e8b9b4fc83d5c336b716f6bc02bc4987',
  );

  /// TMDB's image CDN. Artwork is fetched from here directly — never through
  /// the proxy — so the proxy operator never sees what a user is looking at.
  static const String tmdbImageBase = 'https://image.tmdb.org/t/p';

  /// Filename of the on-device database.
  static const String databaseName = 'cinemasync';
}
