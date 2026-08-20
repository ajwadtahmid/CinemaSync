import 'dart:convert';

import 'package:cinema_sync/core/config/app_config.dart';
import 'package:cinema_sync/core/network/dio_client.dart';
import 'package:cinema_sync/core/network/tmdb_api.dart';
import 'package:cinema_sync/shared/models/media_type.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// Serves canned JSON for a given path, so parsing is tested without a network
/// or a live TMDB token.
class _StubAdapter implements HttpClientAdapter {
  _StubAdapter(this.responses);

  final Map<String, Object> responses;
  final List<RequestOptions> requests = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final body = responses[options.path];
    final headers = {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    };

    if (body == null) {
      return ResponseBody.fromString(
        '{"status_message":"Not Found"}',
        404,
        headers: headers,
      );
    }
    return ResponseBody.fromString(jsonEncode(body), 200, headers: headers);
  }

  @override
  void close({bool force = false}) {}
}

TmdbApi _apiWith(_StubAdapter adapter) {
  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8787/tmdb'))
    ..httpClientAdapter = adapter;
  return TmdbApi(dio);
}

void main() {
  group('discover parsing', () {
    test('maps a movie result, normalising title and date', () async {
      final adapter = _StubAdapter({
        '/discover/movie': {
          'results': [
            {
              'id': 27205,
              'title': 'Inception',
              'overview': 'A thief who steals corporate secrets.',
              'poster_path': '/poster.jpg',
              'vote_average': 8.4,
              'release_date': '2010-07-16',
              'genre_ids': [28, 878],
            },
          ],
        },
      });

      final results = await _apiWith(adapter).discoverMovies();

      expect(results, hasLength(1));
      final title = results.single;
      expect(title.id, 27205);
      expect(title.mediaType, MediaType.movie);
      expect(title.title, 'Inception');
      expect(title.year, 2010);
      expect(title.voteAverage, 8.4);
      expect(title.genreIds, [28, 878]);
    });

    test("maps a TV result from TMDB's name/first_air_date fields", () async {
      final adapter = _StubAdapter({
        '/discover/tv': {
          'results': [
            {
              'id': 1396,
              'name': 'Breaking Bad',
              'first_air_date': '2008-01-20',
            },
          ],
        },
      });

      final results = await _apiWith(adapter).discoverTv();

      expect(results.single.title, 'Breaking Bad');
      expect(results.single.mediaType, MediaType.tv);
      expect(results.single.year, 2008);
    });

    test('drops a malformed genre id instead of losing the whole page',
        () async {
      final adapter = _StubAdapter({
        '/discover/movie': {
          'results': [
            {
              'id': 1,
              'title': 'Odd',
              'genre_ids': [28, null, 'nonsense', 878],
            },
          ],
        },
      });

      final results = await _apiWith(adapter).discoverMovies();

      expect(results.single.genreIds, [28, 878]);
    });

    test('omits absent filters from the query rather than sending nulls',
        () async {
      final adapter = _StubAdapter({
        '/discover/movie': {'results': <dynamic>[]},
      });

      await _apiWith(adapter).discoverMovies(genres: [18], minRating: 7.5);

      final params = adapter.requests.single.queryParameters;
      expect(params['with_genres'], '18');
      expect(params['vote_average.gte'], 7.5);
      expect(params.containsKey('with_runtime.gte'), isFalse);
      expect(params.containsKey('vote_count.gte'), isFalse);
    });
  });

  group('search', () {
    test('keeps movies and TV but drops people', () async {
      final adapter = _StubAdapter({
        '/search/multi': {
          'results': [
            {'id': 1, 'media_type': 'movie', 'title': 'A Movie'},
            {'id': 2, 'media_type': 'person', 'name': 'An Actor'},
            {'id': 3, 'media_type': 'tv', 'name': 'A Show'},
          ],
        },
      });

      final results = await _apiWith(adapter).searchMulti('a');

      expect(results.map((t) => t.id), [1, 3]);
      expect(results.map((t) => t.mediaType), [MediaType.movie, MediaType.tv]);
    });
  });

  group('detail parsing', () {
    test('extracts runtime, cast, trailer, providers and certification',
        () async {
      final adapter = _StubAdapter({
        '/movie/27205': {
          'id': 27205,
          'title': 'Inception',
          'runtime': 148,
          'tagline': 'Your mind is the scene of the crime.',
          'genres': [
            {'id': 28, 'name': 'Action'},
          ],
          'credits': {
            'cast': [
              {'id': 6193, 'name': 'Leonardo DiCaprio', 'character': 'Cobb'},
            ],
          },
          'videos': {
            'results': [
              {
                'id': 'v1',
                'key': 'abc123',
                'name': 'Trailer',
                'site': 'YouTube',
                'type': 'Trailer',
                'official': true,
              },
            ],
          },
          'watch/providers': {
            'results': {
              'US': {
                'flatrate': [
                  {'provider_id': 8, 'provider_name': 'Netflix'},
                ],
              },
            },
          },
          'release_dates': {
            'results': [
              {
                'iso_3166_1': 'US',
                'release_dates': [
                  {'certification': 'PG-13', 'type': 3},
                ],
              },
            ],
          },
          'external_ids': {'imdb_id': 'tt1375666'},
        },
      });

      final detail = await _apiWith(adapter).detail(27205, MediaType.movie);

      expect(detail.runtime, 148);
      expect(detail.genres.single.name, 'Action');
      expect(detail.cast.single.name, 'Leonardo DiCaprio');
      expect(detail.trailer?.key, 'abc123');
      expect(detail.watchProviders.single.providerName, 'Netflix');
      expect(detail.certification, 'PG-13');
      expect(detail.imdbId, 'tt1375666');
    });

    test('takes TV runtime from episode_run_time', () async {
      final adapter = _StubAdapter({
        '/tv/1396': {
          'id': 1396,
          'name': 'Breaking Bad',
          'episode_run_time': [47],
        },
      });

      final detail = await _apiWith(adapter).detail(1396, MediaType.tv);

      expect(detail.runtime, 47);
      expect(detail.title, 'Breaking Bad');
    });

    test('parses seasons and drops season 0 (Specials)', () async {
      final adapter = _StubAdapter({
        '/tv/1396': {
          'id': 1396,
          'name': 'Breaking Bad',
          'seasons': [
            {'season_number': 0, 'name': 'Specials', 'episode_count': 3},
            {'season_number': 1, 'name': 'Season 1', 'episode_count': 7},
            {'season_number': 2, 'name': 'Season 2', 'episode_count': 13},
          ],
        },
      });

      final detail = await _apiWith(adapter).detail(1396, MediaType.tv);

      expect(detail.seasons.map((s) => s.seasonNumber), [1, 2]);
      expect(detail.seasons.first.episodeCount, 7);
    });

    test('requests every append_to_response section in one round trip',
        () async {
      final adapter = _StubAdapter({
        '/movie/1': {'id': 1, 'title': 'X'},
      });

      await _apiWith(adapter).detail(1, MediaType.movie);

      final append = adapter
          .requests.single.queryParameters['append_to_response'] as String;
      for (final section in [
        'videos',
        'credits',
        'watch/providers',
        'recommendations',
        'similar',
        'external_ids',
      ]) {
        expect(append, contains(section));
      }
    });
  });

  group('findByImdbId', () {
    test('resolves a movie result', () async {
      final adapter = _StubAdapter({
        '/find/tt1375666': {
          'movie_results': [
            {'id': 27205, 'title': 'Inception'},
          ],
          'tv_results': <dynamic>[],
        },
      });

      final found = await _apiWith(adapter).findByImdbId('tt1375666');

      expect(found?.id, 27205);
      expect(found?.mediaType, MediaType.movie);
    });

    test('returns null when nothing matches', () async {
      final adapter = _StubAdapter({
        '/find/tt0000000': {
          'movie_results': <dynamic>[],
          'tv_results': <dynamic>[],
        },
      });

      expect(await _apiWith(adapter).findByImdbId('tt0000000'), isNull);
    });
  });

  group('privacy invariants', () {
    test('sends no identifying header on any request', () async {
      final adapter = _StubAdapter({
        '/discover/movie': {'results': <dynamic>[]},
      });

      await _apiWith(adapter).discoverMovies();

      final headers = adapter.requests.single.headers.keys
          .map((k) => k.toLowerCase())
          .toSet();
      // Anything that could correlate two requests to one person.
      for (final forbidden in [
        'authorization',
        'apikey',
        'x-api-key',
        'cookie',
        'x-device-id',
        'x-install-id',
      ]) {
        expect(
          headers,
          isNot(contains(forbidden)),
          reason: 'the proxy must not be able to identify a caller',
        );
      }
    });

    test('the real dio provider carries the shared client token', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final headers = container.read(tmdbDioProvider).options.headers;

      expect(
        headers['X-CinemaSync-Token'],
        equals(AppConfig.clientToken),
        reason: 'the proxy rejects unauthenticated callers with 401',
      );
      // Static and shared: the token gatekeeps the proxy without letting it
      // tell two installs apart. A per-install value here would be an
      // identifier and would break the privacy invariant above.
      expect(AppConfig.clientToken, isNotEmpty);
    });

    test('never targets api.themoviedb.org directly', () async {
      final adapter = _StubAdapter({
        '/discover/movie': {'results': <dynamic>[]},
      });

      await _apiWith(adapter).discoverMovies();

      expect(adapter.requests.single.uri.host, 'localhost');
      expect(
        adapter.requests.single.uri.toString(),
        isNot(contains('api.themoviedb.org')),
      );
    });
  });

  group('tv season episodes', () {
    test('parses a season\'s episode list', () async {
      final adapter = _StubAdapter({
        '/tv/1396/season/1': {
          'episodes': [
            {
              'id': 1,
              'episode_number': 1,
              'name': 'Pilot',
              'runtime': 58,
            },
            {
              'id': 2,
              'episode_number': 2,
              'name': "Cat's in the Bag...",
              'runtime': 48,
            },
          ],
        },
      });

      final episodes = await _apiWith(adapter).tvSeasonEpisodes(1396, 1);

      expect(episodes.map((e) => e.episodeNumber), [1, 2]);
      expect(episodes.first.name, 'Pilot');
      expect(episodes.first.runtime, 58);
    });
  });
}
