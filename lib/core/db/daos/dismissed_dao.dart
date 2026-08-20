import 'package:drift/drift.dart';

import '../../../shared/models/media_type.dart';
import '../database.dart';
import '../tables.dart';

part 'dismissed_dao.g.dart';

/// "Never show me this again" — permanent and global.
///
/// Distinct from a left-swipe, which is only a pass. A dismissal applies
/// across every deck and every buddy, so it is stored once rather than per
/// context.
@DriftAccessor(tables: [Dismissed])
class DismissedDao extends DatabaseAccessor<AppDatabase>
    with _$DismissedDaoMixin {
  DismissedDao(super.db);

  Future<void> dismiss(int tmdbId, MediaType mediaType) async {
    await into(dismissed).insertOnConflictUpdate(
      DismissedCompanion.insert(
        tmdbId: tmdbId,
        mediaType: mediaType,
        createdAt: DateTime.now().toUtc(),
      ),
    );
  }

  /// Dismissal is permanent by design, but not irreversible by accident — the
  /// user can undo one they did not mean.
  Future<int> undismiss(int tmdbId, MediaType mediaType) {
    return (delete(dismissed)
          ..where((d) =>
              d.tmdbId.equals(tmdbId) & d.mediaType.equalsValue(mediaType)))
        .go();
  }

  Future<bool> isDismissed(int tmdbId, MediaType mediaType) async {
    final row = await (select(dismissed)
          ..where((d) =>
              d.tmdbId.equals(tmdbId) & d.mediaType.equalsValue(mediaType)))
        .getSingleOrNull();
    return row != null;
  }

  Stream<bool> watchIsDismissed(int tmdbId, MediaType mediaType) {
    return (select(dismissed)
          ..where((d) =>
              d.tmdbId.equals(tmdbId) & d.mediaType.equalsValue(mediaType)))
        .watchSingleOrNull()
        .map((row) => row != null);
  }

  Stream<List<DismissedData>> watchAll() => select(dismissed).watch();

  /// The exclusion set used when building decks.
  Future<Set<(int, MediaType)>> dismissedKeys() async {
    final rows = await select(dismissed).get();
    return rows.map((r) => (r.tmdbId, r.mediaType)).toSet();
  }
}
