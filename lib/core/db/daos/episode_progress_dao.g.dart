// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_progress_dao.dart';

// ignore_for_file: type=lint
mixin _$EpisodeProgressDaoMixin on DatabaseAccessor<AppDatabase> {
  $EpisodeProgressTable get episodeProgress => attachedDatabase.episodeProgress;
  EpisodeProgressDaoManager get managers => EpisodeProgressDaoManager(this);
}

class EpisodeProgressDaoManager {
  final _$EpisodeProgressDaoMixin _db;
  EpisodeProgressDaoManager(this._db);
  $$EpisodeProgressTableTableManager get episodeProgress =>
      $$EpisodeProgressTableTableManager(
        _db.attachedDatabase,
        _db.episodeProgress,
      );
}
