import 'package:dio/dio.dart';

import '../error/failure.dart';

/// Maps low-level exceptions (dio, parsing) to user-safe [Failure]s.
///
/// Nothing from the underlying error reaches the returned message — no URLs,
/// no status text, no stack traces. The original is carried in `cause` for
/// tests only.
Failure mapError(Object error) {
  if (error is Failure) return error;

  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return NetworkFailure('The request timed out. Please try again.', error);

      case DioExceptionType.connectionError:
        return NetworkFailure(
          "Couldn't reach the catalogue. Check your connection.",
          error,
        );

      case DioExceptionType.badResponse:
        final status = error.response?.statusCode;
        if (status == 404) {
          return NotFoundFailure('That title could not be found.', error);
        }
        if (status == 400) {
          // The proxy refuses paths outside its allowlist. If a user ever sees
          // this, the app asked for an endpoint the proxy was not told about —
          // a bug on our side, not something they can act on.
          return ServerFailure(
            'The app requested something the server does not allow.',
            status,
            error,
          );
        }
        if (status == 429) {
          return ServerFailure(
            'Too many requests right now. Try again in a moment.',
            status,
            error,
          );
        }
        return ServerFailure(
          'The catalogue is having trouble right now.',
          status,
          error,
        );

      case DioExceptionType.cancel:
        return UnknownFailure('The request was cancelled.', error);

      case DioExceptionType.badCertificate:
        return NetworkFailure("The server's certificate was rejected.", error);

      case DioExceptionType.unknown:
        return NetworkFailure('Network error. Please try again.', error);
    }
  }

  if (error is FormatException || error is TypeError) {
    return ParseFailure('Unexpected data from the catalogue.', error);
  }

  return UnknownFailure('Something went wrong.', error);
}
