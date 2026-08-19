import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/app_config.dart';

/// Overridable proxy base URL.
///
/// Defaults to [AppConfig.proxyBaseUrl]; Settings will override this so a user
/// can point the app at their own proxy instead of trusting ours.
final proxyBaseUrlProvider = Provider<String>((ref) => AppConfig.proxyBaseUrl);

/// A [Dio] configured to talk to the CinemaSync TMDB proxy.
///
/// Two invariants are enforced here rather than left to convention:
///
///  1. **No TMDB key.** The client has never held one; the proxy attaches it.
///  2. **No identifier of any kind.** No API key, device id, install id,
///     session, cookie, or auth header is sent — so the proxy cannot correlate
///     two requests as the same person even if it wanted to. Anything added to
///     `headers` below must be justified against that.
final tmdbDioProvider = Provider<Dio>((ref) {
  final baseUrl = ref.watch(proxyBaseUrlProvider);

  final dio = Dio(
    BaseOptions(
      // The proxy namespaces TMDB under /tmdb; /health sits outside it.
      baseUrl: '$baseUrl/tmdb',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 20),
      responseType: ResponseType.json,
      headers: const {'Accept': 'application/json'},
    ),
  );

  dio.interceptors.add(_RetryInterceptor(dio));
  ref.onDispose(dio.close);
  return dio;
});

/// Retries transient failures with exponential backoff.
///
/// Only idempotent GETs are retried, and only for causes that are plausibly
/// temporary — timeouts, connection drops, and 5xx/429 from upstream. A 4xx is
/// never retried: it means we asked for the wrong thing, and asking again more
/// slowly will not fix it.
class _RetryInterceptor extends Interceptor {
  _RetryInterceptor(this._dio);

  final Dio _dio;

  static const maxAttempts = 3;
  static const _retryableStatuses = {429, 500, 502, 503, 504};

  bool _isRetryable(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return true;
      case DioExceptionType.badResponse:
        return _retryableStatuses.contains(e.response?.statusCode);
      case DioExceptionType.transformTimeout:
        // Decoding took too long, which means the payload was large rather
        // than the network being flaky. Retrying just decodes it again.
        return false;
      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return false;
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    final attempt = (options.extra['retry_attempt'] as int? ?? 0) + 1;

    if (options.method != 'GET' ||
        attempt >= maxAttempts ||
        !_isRetryable(err)) {
      return handler.next(err);
    }

    // 400ms, 800ms, … — enough to ride out a blip without stalling the UI.
    final delay =
        Duration(milliseconds: 400 * math.pow(2, attempt - 1).toInt());
    await Future<void>.delayed(delay);

    options.extra['retry_attempt'] = attempt;
    try {
      final response = await _dio.fetch<dynamic>(options);
      return handler.resolve(response);
    } on DioException catch (e) {
      return handler.next(e);
    }
  }
}
