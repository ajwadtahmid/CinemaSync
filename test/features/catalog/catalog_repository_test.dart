import 'dart:convert';

import 'package:cinema_sync/core/db/database.dart';
import 'package:cinema_sync/core/error/failure.dart';
import 'package:cinema_sync/core/network/tmdb_api.dart';
import 'package:cinema_sync/features/catalog/data/catalog_repository.dart';
import 'package:cinema_sync/shared/models/media_type.dart';
import 'package:dio/dio.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

/// Serves canned JSON, and can be switched to fail so the offline path can be
/// exercised without unplugging anything.
class _StubAdapter implements HttpClientAdapter {
  _StubAdapter(this.responses);

  final Map<String, Object> responses;
  bool offline = false;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (offline) {
      throw DioException.connectionError(
        requestOptions: options,
        reason: 'simulated offline',
      );
    }
    final body = responses[options.path];
    final headers = {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    };
    if (body == null) {
      return ResponseBody.fromString('{}', 404, headers: headers);
    }
    return ResponseBody.fromString(jsonEncode(body), 200, headers: headers);
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  late AppDatabase db;
  late _StubAdapter adapter;
  late CatalogRepository repo;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    adapter = _StubAdapter({
      '/trending/all/week': {
        'results': [
          {
            'id': 27205,
            'media_type': 'movie',
            'title': 'Inception',
            'release_date': '2010-07-16',
            'genre_ids': [28, 878],
            'vote_average': 8.4,
          },
        ],
      },
      '/movie/27205': {
        'id': 27205,
        'title': 'Inception',
        'runtime': 148,
        'external_ids': {'imdb_id': 'tt1375666'},
        'credits': {
          'cast': [
            {'id': 6193, 'name': 'Leonardo DiCaprio'},
          ],
        },
      },
    });

    final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8787/tmdb'))
      ..httpClientAdapter = adapter;
    repo = CatalogRepository(api: TmdbApi(dio), titles: db.titlesDao);
  });

  tearDown(() => db.close());

  group('caching', () {
    test('browsing writes encountered titles into the local cache', () async {
      expect(await db.select(db.titles).get(), isEmpty);

      await repo.trending();

      final cached = await db.select(db.titles).get();
      expect(cached, hasLength(1));
      expect(cached.single.tmdbId, 27205);
      expect(cached.single.mediaType, MediaType.movie);
      expect(cached.single.title, 'Inception');
      expect(cached.single.year, 2010);
      expect(jsonDecode(cached.single.genreIds), [28, 878]);
      expect(cached.single.cachedAt.isUtc, isTrue);
    });

    test('opening a detail caches runtime and imdb id', () async {
      await repo.detail(27205, MediaType.movie);

      final cached = await db.titlesDao.byKey(27205, MediaType.movie);
      expect(cached!.runtime, 148);
      expect(cached.imdbId, 'tt1375666');
    });

    test('re-browsing updates rather than duplicating a cached title',
        () async {
      await repo.trending();
      await repo.trending();

      expect(await db.select(db.titles).get(), hasLength(1));
    });
  });

  group('offline behaviour', () {
    test('a previously viewed title still opens with no network', () async {
      await repo.detail(27205, MediaType.movie);
      adapter.offline = true;

      final offlineDetail = await repo.detail(27205, MediaType.movie);

      expect(offlineDetail.title, 'Inception');
      expect(offlineDetail.runtime, 148);
      // Cast was never cached, so it is genuinely absent — the UI must not
      // present this as "this film has no cast".
      expect(offlineDetail.cast, isEmpty);
    });

    test('a never-seen title fails with a typed network failure', () async {
      adapter.offline = true;

      expect(
        () => repo.detail(999999, MediaType.movie),
        throwsA(isA<NetworkFailure>()),
      );
    });

    test('isCached distinguishes seen from unseen titles', () async {
      await repo.trending();

      expect(await repo.isCached(27205, MediaType.movie), isTrue);
      expect(await repo.isCached(27205, MediaType.tv), isFalse);
      expect(await repo.isCached(999999, MediaType.movie), isFalse);
    });
  });

  group('search', () {
    test('an empty query never reaches the network', () async {
      adapter.offline = true;

      expect(await repo.search('   '), isEmpty);
    });
  });
}
