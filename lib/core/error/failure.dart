/// Typed failures returned by repositories.
///
/// Repositories return these rather than throwing raw exceptions at the UI, so
/// a screen can decide what to render without knowing whether the underlying
/// problem came from dio, SQLite, or a parser.
///
/// Every [message] is safe to show a user: no stack traces, no URLs, no
/// exception text. The original error is kept in [cause] for tests and local
/// debugging — it is never rendered, and never sent anywhere, because there is
/// no crash reporter in this app by design.
sealed class Failure {
  const Failure(this.message, [this.cause]);

  /// User-facing, already phrased for display.
  final String message;

  /// The underlying error, for tests and debugging only.
  final Object? cause;

  @override
  String toString() => '$runtimeType: $message';
}

/// The device could not reach the network, or the request timed out.
///
/// Distinct from [ServerFailure] because it is usually the user's connection,
/// and because most of this app keeps working offline — a network failure is
/// often not worth an error surface at all.
class NetworkFailure extends Failure {
  const NetworkFailure(super.message, [super.cause]);
}

/// The proxy or TMDB responded with an error status.
class ServerFailure extends Failure {
  const ServerFailure(super.message, this.statusCode, [super.cause]);

  final int? statusCode;
}

/// The requested title or resource does not exist.
class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message, [super.cause]);
}

/// A response arrived but did not match the shape we expected.
///
/// Worth its own type: it means TMDB changed something or the proxy is
/// returning something unexpected, which is a different problem from the
/// network being down and deserves a different response from us.
class ParseFailure extends Failure {
  const ParseFailure(super.message, [super.cause]);
}

/// Anything not covered above.
class UnknownFailure extends Failure {
  const UnknownFailure(super.message, [super.cause]);
}
