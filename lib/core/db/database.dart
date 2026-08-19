import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/app_config.dart';
import '../../shared/models/deck_mode.dart';
import '../../shared/models/entry_status.dart';
import '../../shared/models/list_sort_preference.dart';
import '../../shared/models/media_type.dart';
import '../../shared/models/swipe_direction.dart';
import 'daos/library_dao.dart';
import 'daos/titles_dao.dart';
import 'tables.dart';

part 'database.g.dart';

/// The on-device database.
///
/// This is the source of truth for everything personal — library, ratings,
/// notes, lists, swipes, buddies and matches. It is not a cache of a server;
/// no server holds a copy. The only table here that *is* a cache is [Titles].
@DriftDatabase(
  tables: [
    Titles,
    LibraryEntries,
    EpisodeProgress,
    Dismissed,
    UserLists,
    UserListItems,
    Swipes,
    Buddies,
    BuddyExclusions,
    BuddyRightSwipes,
    Matches,
    Preferences,
  ],
  daos: [TitlesDao, LibraryDao],
)
class AppDatabase extends _$AppDatabase {
  /// Opens the on-disk database. Pass an executor to override — tests use
  /// `NativeDatabase.memory()`.
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        onUpgrade: (m, from, to) async {
          // Schema is at version 1; no upgrades exist yet. Every future change
          // bumps schemaVersion and adds a step here plus a migration test.
        },
        beforeOpen: (details) async {
          // Required for the ON DELETE CASCADE on the buddy tables to fire.
          // SQLite defaults this to off on every connection.
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );

  static QueryExecutor _openConnection() =>
      driftDatabase(name: AppConfig.databaseName);
}

/// The app-wide database handle.
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});
