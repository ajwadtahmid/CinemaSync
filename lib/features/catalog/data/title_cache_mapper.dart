import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../core/db/database.dart';
import '../../../shared/models/title_detail.dart';
import '../../../shared/models/title_summary.dart';

/// Converts TMDB models into rows for the local `Titles` cache.
///
/// This table is the only part of the database that is a cache rather than the
/// source of truth. It exists so a title the user has already seen still
/// renders with no network — not so the app can hold a copy of TMDB. Only
/// titles actually encountered are written.
extension TitleSummaryCache on TitleSummary {
  TitlesCompanion toCacheRow({DateTime? now}) {
    return TitlesCompanion.insert(
      tmdbId: id,
      mediaType: mediaType,
      title: title,
      year: Value(year),
      overview: Value(overview.isEmpty ? null : overview),
      posterPath: Value(posterPath),
      backdropPath: Value(backdropPath),
      voteAverage: Value(voteAverage),
      genreIds: Value(jsonEncode(genreIds)),
      cachedAt: now ?? DateTime.now().toUtc(),
    );
  }
}

extension TitleDetailCache on TitleDetail {
  TitlesCompanion toCacheRow({DateTime? now}) {
    return TitlesCompanion.insert(
      tmdbId: id,
      mediaType: mediaType,
      title: title,
      year: Value(year),
      overview: Value(overview.isEmpty ? null : overview),
      posterPath: Value(posterPath),
      backdropPath: Value(backdropPath),
      runtime: Value(runtime),
      voteAverage: Value(voteAverage),
      imdbId: Value(imdbId),
      genreIds: Value(jsonEncode(genres.map((g) => g.id).toList())),
      cachedAt: now ?? DateTime.now().toUtc(),
    );
  }
}

/// Rebuilds a [TitleSummary] from a cached row, for offline rendering.
extension CachedTitleToSummary on Title {
  TitleSummary toSummary() {
    return TitleSummary(
      id: tmdbId,
      mediaType: mediaType,
      title: title,
      overview: overview ?? '',
      posterPath: posterPath,
      backdropPath: backdropPath,
      voteAverage: voteAverage ?? 0,
      // The cache stores the parsed year, not TMDB's full date string. Rebuild
      // a date-shaped value so `year` still resolves; the day and month were
      // never displayed anywhere.
      releaseDate: year == null ? null : '$year-01-01',
      genreIds:
          (jsonDecode(genreIds) as List<dynamic>).whereType<int>().toList(),
    );
  }
}
