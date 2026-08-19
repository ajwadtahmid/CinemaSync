import 'package:drift/drift.dart';

import '../../shared/models/deck_mode.dart';
import '../../shared/models/entry_status.dart';
import '../../shared/models/list_sort_preference.dart';
import '../../shared/models/media_type.dart';
import '../../shared/models/swipe_direction.dart';

// Enum columns use `textEnum`, which persists the enum's `name` rather than its
// index. Names survive reordering of the enum declaration; indices do not.
//
// All timestamps are stored as UTC.

// ---------------------------------------------------------------------------
// Cached TMDB metadata — NOT user data.
//
// Only titles the user has actually encountered are cached, keyed by
// (tmdbId, mediaType). The catalog is never stored wholesale.
// ---------------------------------------------------------------------------

@TableIndex(name: 'idx_titles_cached_at', columns: {#cachedAt})
class Titles extends Table {
  IntColumn get tmdbId => integer()();
  TextColumn get mediaType => textEnum<MediaType>()();
  TextColumn get title => text()();
  TextColumn get originalTitle => text().nullable()();
  IntColumn get year => integer().nullable()();
  TextColumn get overview => text().nullable()();
  TextColumn get posterPath => text().nullable()();
  TextColumn get backdropPath => text().nullable()();
  IntColumn get runtime => integer().nullable()();

  /// JSON array of TMDB genre ids, e.g. `[18,80]`.
  TextColumn get genreIds => text().withDefault(const Constant('[]'))();
  RealColumn get voteAverage => real().nullable()();
  TextColumn get imdbId => text().nullable()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {tmdbId, mediaType};
}

// ---------------------------------------------------------------------------
// The user's library — THE user data. This is the source of truth, not a cache.
// ---------------------------------------------------------------------------

@TableIndex(name: 'idx_library_status', columns: {#status})
@TableIndex(name: 'idx_library_title', columns: {#tmdbId, #mediaType})
class LibraryEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tmdbId => integer()();
  TextColumn get mediaType => textEnum<MediaType>()();
  TextColumn get status => textEnum<EntryStatus>()();

  /// 0.5–10 in half steps, per implementation plan §5.1.
  ///
  /// The range and the half-step quantization are enforced here in SQL *and*
  /// in [LibraryDao], so neither Dart nor a raw statement can be the hole in
  /// the guarantee. Silently rounding a user's imported rating would corrupt
  /// their history, so violations are rejected rather than coerced.
  RealColumn get rating => real().nullable().check(
        const CustomExpression<bool>(
          'rating IS NULL OR (rating >= 0.5 AND rating <= 10.0 '
          'AND rating * 2 = CAST(rating * 2 AS INTEGER))',
        ),
      )();
  DateTimeColumn get watchedAt => dateTime().nullable()();
  TextColumn get notes => text().nullable()();
  IntColumn get rewatchCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {tmdbId, mediaType},
      ];
}

class EpisodeProgress extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// TV only, so no mediaType column — the pair is implicitly (tmdbId, tv).
  IntColumn get tmdbId => integer()();
  IntColumn get season => integer()();
  IntColumn get episode => integer()();
  DateTimeColumn get watchedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {tmdbId, season, episode},
      ];
}

/// A permanent, global "never show me this again". Applies across every deck
/// and every buddy.
class Dismissed extends Table {
  IntColumn get tmdbId => integer()();
  TextColumn get mediaType => textEnum<MediaType>()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {tmdbId, mediaType};
}

// ---------------------------------------------------------------------------
// Custom lists.
// ---------------------------------------------------------------------------

class UserLists extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();

  /// Position of the list itself among the user's lists.
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();

  /// Per-list ordering preference, so each list can sort independently.
  TextColumn get sortPreference =>
      textEnum<ListSortPreference>().withDefault(const Constant('manual'))();
  DateTimeColumn get createdAt => dateTime()();
}

class UserListItems extends Table {
  IntColumn get listId =>
      integer().references(UserLists, #id, onDelete: KeyAction.cascade)();
  IntColumn get tmdbId => integer()();
  TextColumn get mediaType => textEnum<MediaType>()();

  /// Hand-ordered position, authoritative when the list's sortPreference is
  /// [ListSortPreference.manual].
  IntColumn get position => integer()();

  /// Why this title is on this list — distinct from the library entry's notes,
  /// which are about the title itself rather than its membership here.
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {listId, tmdbId, mediaType};
}

// ---------------------------------------------------------------------------
// Swipes.
// ---------------------------------------------------------------------------

@TableIndex(name: 'idx_swipes_deck', columns: {#deckMode, #buddyId})
class Swipes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tmdbId => integer()();
  TextColumn get mediaType => textEnum<MediaType>()();
  TextColumn get direction => textEnum<SwipeDirection>()();
  TextColumn get deckMode => textEnum<DeckMode>()();

  /// Set only when deckMode is [DeckMode.buddy].
  IntColumn get buddyId => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();
}

// ---------------------------------------------------------------------------
// Buddies (Phase 5). Defined now so there is one schema rather than a painful
// migration later.
// ---------------------------------------------------------------------------

class Buddies extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// A user-chosen label. Purely local — there is no account behind a buddy.
  TextColumn get displayName => text()();

  /// Derived from the pairing code via HKDF. Carries no user information.
  TextColumn get roomId => text().unique()();

  /// A pointer into platform secure storage. NEVER the key itself: encryption
  /// keys must not live in the SQLite file.
  TextColumn get keyRef => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastSyncedAt => dateTime().nullable()();
}

/// The partner's opaque keyed hashes, replaced wholesale on each sync.
class BuddyExclusions extends Table {
  IntColumn get buddyId =>
      integer().references(Buddies, #id, onDelete: KeyAction.cascade)();
  TextColumn get hash => text()();

  @override
  Set<Column> get primaryKey => {buddyId, hash};
}

/// The partner's right-swipes, replaced wholesale on each sync.
class BuddyRightSwipes extends Table {
  IntColumn get buddyId =>
      integer().references(Buddies, #id, onDelete: KeyAction.cascade)();
  IntColumn get tmdbId => integer()();
  TextColumn get mediaType => textEnum<MediaType>()();

  @override
  Set<Column> get primaryKey => {buddyId, tmdbId, mediaType};
}

@TableIndex(name: 'idx_matches_buddy', columns: {#buddyId})
class Matches extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get buddyId =>
      integer().references(Buddies, #id, onDelete: KeyAction.cascade)();
  IntColumn get tmdbId => integer()();
  TextColumn get mediaType => textEnum<MediaType>()();
  DateTimeColumn get matchedAt => dateTime()();
  BoolColumn get dismissed => boolean().withDefault(const Constant(false))();

  @override
  List<Set<Column>> get uniqueKeys => [
        {buddyId, tmdbId, mediaType},
      ];
}

// ---------------------------------------------------------------------------
// Preferences — taste settings, proxy URL override, last-export timestamp.
//
// A key/value table rather than a schema, so adding a preference never needs a
// migration. Kept in SQLite (not shared_preferences) so a single file holds all
// local state and one export can capture it.
// ---------------------------------------------------------------------------

class Preferences extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}
