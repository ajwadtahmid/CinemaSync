// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TitlesTable extends Titles with TableInfo<$TitlesTable, Title> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TitlesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tmdbIdMeta = const VerificationMeta('tmdbId');
  @override
  late final GeneratedColumn<int> tmdbId = GeneratedColumn<int>(
    'tmdb_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<MediaType, String> mediaType =
      GeneratedColumn<String>(
        'media_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<MediaType>($TitlesTable.$convertermediaType);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _originalTitleMeta = const VerificationMeta(
    'originalTitle',
  );
  @override
  late final GeneratedColumn<String> originalTitle = GeneratedColumn<String>(
    'original_title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _overviewMeta = const VerificationMeta(
    'overview',
  );
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
    'overview',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _posterPathMeta = const VerificationMeta(
    'posterPath',
  );
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
    'poster_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _backdropPathMeta = const VerificationMeta(
    'backdropPath',
  );
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
    'backdrop_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _runtimeMeta = const VerificationMeta(
    'runtime',
  );
  @override
  late final GeneratedColumn<int> runtime = GeneratedColumn<int>(
    'runtime',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genreIdsMeta = const VerificationMeta(
    'genreIds',
  );
  @override
  late final GeneratedColumn<String> genreIds = GeneratedColumn<String>(
    'genre_ids',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _voteAverageMeta = const VerificationMeta(
    'voteAverage',
  );
  @override
  late final GeneratedColumn<double> voteAverage = GeneratedColumn<double>(
    'vote_average',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imdbIdMeta = const VerificationMeta('imdbId');
  @override
  late final GeneratedColumn<String> imdbId = GeneratedColumn<String>(
    'imdb_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    tmdbId,
    mediaType,
    title,
    originalTitle,
    year,
    overview,
    posterPath,
    backdropPath,
    runtime,
    genreIds,
    voteAverage,
    imdbId,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'titles';
  @override
  VerificationContext validateIntegrity(
    Insertable<Title> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tmdb_id')) {
      context.handle(
        _tmdbIdMeta,
        tmdbId.isAcceptableOrUnknown(data['tmdb_id']!, _tmdbIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tmdbIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('original_title')) {
      context.handle(
        _originalTitleMeta,
        originalTitle.isAcceptableOrUnknown(
          data['original_title']!,
          _originalTitleMeta,
        ),
      );
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    }
    if (data.containsKey('overview')) {
      context.handle(
        _overviewMeta,
        overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta),
      );
    }
    if (data.containsKey('poster_path')) {
      context.handle(
        _posterPathMeta,
        posterPath.isAcceptableOrUnknown(data['poster_path']!, _posterPathMeta),
      );
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
        _backdropPathMeta,
        backdropPath.isAcceptableOrUnknown(
          data['backdrop_path']!,
          _backdropPathMeta,
        ),
      );
    }
    if (data.containsKey('runtime')) {
      context.handle(
        _runtimeMeta,
        runtime.isAcceptableOrUnknown(data['runtime']!, _runtimeMeta),
      );
    }
    if (data.containsKey('genre_ids')) {
      context.handle(
        _genreIdsMeta,
        genreIds.isAcceptableOrUnknown(data['genre_ids']!, _genreIdsMeta),
      );
    }
    if (data.containsKey('vote_average')) {
      context.handle(
        _voteAverageMeta,
        voteAverage.isAcceptableOrUnknown(
          data['vote_average']!,
          _voteAverageMeta,
        ),
      );
    }
    if (data.containsKey('imdb_id')) {
      context.handle(
        _imdbIdMeta,
        imdbId.isAcceptableOrUnknown(data['imdb_id']!, _imdbIdMeta),
      );
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tmdbId, mediaType};
  @override
  Title map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Title(
      tmdbId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tmdb_id'],
      )!,
      mediaType: $TitlesTable.$convertermediaType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}media_type'],
        )!,
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      originalTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}original_title'],
      ),
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      ),
      overview: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}overview'],
      ),
      posterPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}poster_path'],
      ),
      backdropPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}backdrop_path'],
      ),
      runtime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}runtime'],
      ),
      genreIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}genre_ids'],
      )!,
      voteAverage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vote_average'],
      ),
      imdbId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}imdb_id'],
      ),
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $TitlesTable createAlias(String alias) {
    return $TitlesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MediaType, String, String> $convertermediaType =
      const EnumNameConverter<MediaType>(MediaType.values);
}

class Title extends DataClass implements Insertable<Title> {
  final int tmdbId;
  final MediaType mediaType;
  final String title;
  final String? originalTitle;
  final int? year;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final int? runtime;

  /// JSON array of TMDB genre ids, e.g. `[18,80]`.
  final String genreIds;
  final double? voteAverage;
  final String? imdbId;
  final DateTime cachedAt;
  const Title({
    required this.tmdbId,
    required this.mediaType,
    required this.title,
    this.originalTitle,
    this.year,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.runtime,
    required this.genreIds,
    this.voteAverage,
    this.imdbId,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['tmdb_id'] = Variable<int>(tmdbId);
    {
      map['media_type'] = Variable<String>(
        $TitlesTable.$convertermediaType.toSql(mediaType),
      );
    }
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || originalTitle != null) {
      map['original_title'] = Variable<String>(originalTitle);
    }
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<int>(year);
    }
    if (!nullToAbsent || overview != null) {
      map['overview'] = Variable<String>(overview);
    }
    if (!nullToAbsent || posterPath != null) {
      map['poster_path'] = Variable<String>(posterPath);
    }
    if (!nullToAbsent || backdropPath != null) {
      map['backdrop_path'] = Variable<String>(backdropPath);
    }
    if (!nullToAbsent || runtime != null) {
      map['runtime'] = Variable<int>(runtime);
    }
    map['genre_ids'] = Variable<String>(genreIds);
    if (!nullToAbsent || voteAverage != null) {
      map['vote_average'] = Variable<double>(voteAverage);
    }
    if (!nullToAbsent || imdbId != null) {
      map['imdb_id'] = Variable<String>(imdbId);
    }
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  TitlesCompanion toCompanion(bool nullToAbsent) {
    return TitlesCompanion(
      tmdbId: Value(tmdbId),
      mediaType: Value(mediaType),
      title: Value(title),
      originalTitle: originalTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(originalTitle),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      overview: overview == null && nullToAbsent
          ? const Value.absent()
          : Value(overview),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      runtime: runtime == null && nullToAbsent
          ? const Value.absent()
          : Value(runtime),
      genreIds: Value(genreIds),
      voteAverage: voteAverage == null && nullToAbsent
          ? const Value.absent()
          : Value(voteAverage),
      imdbId: imdbId == null && nullToAbsent
          ? const Value.absent()
          : Value(imdbId),
      cachedAt: Value(cachedAt),
    );
  }

  factory Title.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Title(
      tmdbId: serializer.fromJson<int>(json['tmdbId']),
      mediaType: $TitlesTable.$convertermediaType.fromJson(
        serializer.fromJson<String>(json['mediaType']),
      ),
      title: serializer.fromJson<String>(json['title']),
      originalTitle: serializer.fromJson<String?>(json['originalTitle']),
      year: serializer.fromJson<int?>(json['year']),
      overview: serializer.fromJson<String?>(json['overview']),
      posterPath: serializer.fromJson<String?>(json['posterPath']),
      backdropPath: serializer.fromJson<String?>(json['backdropPath']),
      runtime: serializer.fromJson<int?>(json['runtime']),
      genreIds: serializer.fromJson<String>(json['genreIds']),
      voteAverage: serializer.fromJson<double?>(json['voteAverage']),
      imdbId: serializer.fromJson<String?>(json['imdbId']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tmdbId': serializer.toJson<int>(tmdbId),
      'mediaType': serializer.toJson<String>(
        $TitlesTable.$convertermediaType.toJson(mediaType),
      ),
      'title': serializer.toJson<String>(title),
      'originalTitle': serializer.toJson<String?>(originalTitle),
      'year': serializer.toJson<int?>(year),
      'overview': serializer.toJson<String?>(overview),
      'posterPath': serializer.toJson<String?>(posterPath),
      'backdropPath': serializer.toJson<String?>(backdropPath),
      'runtime': serializer.toJson<int?>(runtime),
      'genreIds': serializer.toJson<String>(genreIds),
      'voteAverage': serializer.toJson<double?>(voteAverage),
      'imdbId': serializer.toJson<String?>(imdbId),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  Title copyWith({
    int? tmdbId,
    MediaType? mediaType,
    String? title,
    Value<String?> originalTitle = const Value.absent(),
    Value<int?> year = const Value.absent(),
    Value<String?> overview = const Value.absent(),
    Value<String?> posterPath = const Value.absent(),
    Value<String?> backdropPath = const Value.absent(),
    Value<int?> runtime = const Value.absent(),
    String? genreIds,
    Value<double?> voteAverage = const Value.absent(),
    Value<String?> imdbId = const Value.absent(),
    DateTime? cachedAt,
  }) => Title(
    tmdbId: tmdbId ?? this.tmdbId,
    mediaType: mediaType ?? this.mediaType,
    title: title ?? this.title,
    originalTitle: originalTitle.present
        ? originalTitle.value
        : this.originalTitle,
    year: year.present ? year.value : this.year,
    overview: overview.present ? overview.value : this.overview,
    posterPath: posterPath.present ? posterPath.value : this.posterPath,
    backdropPath: backdropPath.present ? backdropPath.value : this.backdropPath,
    runtime: runtime.present ? runtime.value : this.runtime,
    genreIds: genreIds ?? this.genreIds,
    voteAverage: voteAverage.present ? voteAverage.value : this.voteAverage,
    imdbId: imdbId.present ? imdbId.value : this.imdbId,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  Title copyWithCompanion(TitlesCompanion data) {
    return Title(
      tmdbId: data.tmdbId.present ? data.tmdbId.value : this.tmdbId,
      mediaType: data.mediaType.present ? data.mediaType.value : this.mediaType,
      title: data.title.present ? data.title.value : this.title,
      originalTitle: data.originalTitle.present
          ? data.originalTitle.value
          : this.originalTitle,
      year: data.year.present ? data.year.value : this.year,
      overview: data.overview.present ? data.overview.value : this.overview,
      posterPath: data.posterPath.present
          ? data.posterPath.value
          : this.posterPath,
      backdropPath: data.backdropPath.present
          ? data.backdropPath.value
          : this.backdropPath,
      runtime: data.runtime.present ? data.runtime.value : this.runtime,
      genreIds: data.genreIds.present ? data.genreIds.value : this.genreIds,
      voteAverage: data.voteAverage.present
          ? data.voteAverage.value
          : this.voteAverage,
      imdbId: data.imdbId.present ? data.imdbId.value : this.imdbId,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Title(')
          ..write('tmdbId: $tmdbId, ')
          ..write('mediaType: $mediaType, ')
          ..write('title: $title, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('year: $year, ')
          ..write('overview: $overview, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('runtime: $runtime, ')
          ..write('genreIds: $genreIds, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('imdbId: $imdbId, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    tmdbId,
    mediaType,
    title,
    originalTitle,
    year,
    overview,
    posterPath,
    backdropPath,
    runtime,
    genreIds,
    voteAverage,
    imdbId,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Title &&
          other.tmdbId == this.tmdbId &&
          other.mediaType == this.mediaType &&
          other.title == this.title &&
          other.originalTitle == this.originalTitle &&
          other.year == this.year &&
          other.overview == this.overview &&
          other.posterPath == this.posterPath &&
          other.backdropPath == this.backdropPath &&
          other.runtime == this.runtime &&
          other.genreIds == this.genreIds &&
          other.voteAverage == this.voteAverage &&
          other.imdbId == this.imdbId &&
          other.cachedAt == this.cachedAt);
}

class TitlesCompanion extends UpdateCompanion<Title> {
  final Value<int> tmdbId;
  final Value<MediaType> mediaType;
  final Value<String> title;
  final Value<String?> originalTitle;
  final Value<int?> year;
  final Value<String?> overview;
  final Value<String?> posterPath;
  final Value<String?> backdropPath;
  final Value<int?> runtime;
  final Value<String> genreIds;
  final Value<double?> voteAverage;
  final Value<String?> imdbId;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const TitlesCompanion({
    this.tmdbId = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.title = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.year = const Value.absent(),
    this.overview = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.runtime = const Value.absent(),
    this.genreIds = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.imdbId = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TitlesCompanion.insert({
    required int tmdbId,
    required MediaType mediaType,
    required String title,
    this.originalTitle = const Value.absent(),
    this.year = const Value.absent(),
    this.overview = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.runtime = const Value.absent(),
    this.genreIds = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.imdbId = const Value.absent(),
    required DateTime cachedAt,
    this.rowid = const Value.absent(),
  }) : tmdbId = Value(tmdbId),
       mediaType = Value(mediaType),
       title = Value(title),
       cachedAt = Value(cachedAt);
  static Insertable<Title> custom({
    Expression<int>? tmdbId,
    Expression<String>? mediaType,
    Expression<String>? title,
    Expression<String>? originalTitle,
    Expression<int>? year,
    Expression<String>? overview,
    Expression<String>? posterPath,
    Expression<String>? backdropPath,
    Expression<int>? runtime,
    Expression<String>? genreIds,
    Expression<double>? voteAverage,
    Expression<String>? imdbId,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (tmdbId != null) 'tmdb_id': tmdbId,
      if (mediaType != null) 'media_type': mediaType,
      if (title != null) 'title': title,
      if (originalTitle != null) 'original_title': originalTitle,
      if (year != null) 'year': year,
      if (overview != null) 'overview': overview,
      if (posterPath != null) 'poster_path': posterPath,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (runtime != null) 'runtime': runtime,
      if (genreIds != null) 'genre_ids': genreIds,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (imdbId != null) 'imdb_id': imdbId,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TitlesCompanion copyWith({
    Value<int>? tmdbId,
    Value<MediaType>? mediaType,
    Value<String>? title,
    Value<String?>? originalTitle,
    Value<int?>? year,
    Value<String?>? overview,
    Value<String?>? posterPath,
    Value<String?>? backdropPath,
    Value<int?>? runtime,
    Value<String>? genreIds,
    Value<double?>? voteAverage,
    Value<String?>? imdbId,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return TitlesCompanion(
      tmdbId: tmdbId ?? this.tmdbId,
      mediaType: mediaType ?? this.mediaType,
      title: title ?? this.title,
      originalTitle: originalTitle ?? this.originalTitle,
      year: year ?? this.year,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      runtime: runtime ?? this.runtime,
      genreIds: genreIds ?? this.genreIds,
      voteAverage: voteAverage ?? this.voteAverage,
      imdbId: imdbId ?? this.imdbId,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tmdbId.present) {
      map['tmdb_id'] = Variable<int>(tmdbId.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<String>(
        $TitlesTable.$convertermediaType.toSql(mediaType.value),
      );
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (originalTitle.present) {
      map['original_title'] = Variable<String>(originalTitle.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (runtime.present) {
      map['runtime'] = Variable<int>(runtime.value);
    }
    if (genreIds.present) {
      map['genre_ids'] = Variable<String>(genreIds.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double>(voteAverage.value);
    }
    if (imdbId.present) {
      map['imdb_id'] = Variable<String>(imdbId.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TitlesCompanion(')
          ..write('tmdbId: $tmdbId, ')
          ..write('mediaType: $mediaType, ')
          ..write('title: $title, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('year: $year, ')
          ..write('overview: $overview, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('runtime: $runtime, ')
          ..write('genreIds: $genreIds, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('imdbId: $imdbId, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LibraryEntriesTable extends LibraryEntries
    with TableInfo<$LibraryEntriesTable, LibraryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LibraryEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _tmdbIdMeta = const VerificationMeta('tmdbId');
  @override
  late final GeneratedColumn<int> tmdbId = GeneratedColumn<int>(
    'tmdb_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<MediaType, String> mediaType =
      GeneratedColumn<String>(
        'media_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<MediaType>($LibraryEntriesTable.$convertermediaType);
  @override
  late final GeneratedColumnWithTypeConverter<EntryStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<EntryStatus>($LibraryEntriesTable.$converterstatus);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    true,
    check: () => const CustomExpression<bool>(
      'rating IS NULL OR (rating >= 0.5 AND rating <= 10.0 '
      'AND rating * 2 = CAST(rating * 2 AS INTEGER))',
    ),
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _watchedAtMeta = const VerificationMeta(
    'watchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> watchedAt = GeneratedColumn<DateTime>(
    'watched_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rewatchCountMeta = const VerificationMeta(
    'rewatchCount',
  );
  @override
  late final GeneratedColumn<int> rewatchCount = GeneratedColumn<int>(
    'rewatch_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tmdbId,
    mediaType,
    status,
    rating,
    watchedAt,
    notes,
    rewatchCount,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'library_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<LibraryEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tmdb_id')) {
      context.handle(
        _tmdbIdMeta,
        tmdbId.isAcceptableOrUnknown(data['tmdb_id']!, _tmdbIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tmdbIdMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('watched_at')) {
      context.handle(
        _watchedAtMeta,
        watchedAt.isAcceptableOrUnknown(data['watched_at']!, _watchedAtMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('rewatch_count')) {
      context.handle(
        _rewatchCountMeta,
        rewatchCount.isAcceptableOrUnknown(
          data['rewatch_count']!,
          _rewatchCountMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {tmdbId, mediaType},
  ];
  @override
  LibraryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LibraryEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tmdbId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tmdb_id'],
      )!,
      mediaType: $LibraryEntriesTable.$convertermediaType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}media_type'],
        )!,
      ),
      status: $LibraryEntriesTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      ),
      watchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}watched_at'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      rewatchCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rewatch_count'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $LibraryEntriesTable createAlias(String alias) {
    return $LibraryEntriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MediaType, String, String> $convertermediaType =
      const EnumNameConverter<MediaType>(MediaType.values);
  static JsonTypeConverter2<EntryStatus, String, String> $converterstatus =
      const EnumNameConverter<EntryStatus>(EntryStatus.values);
}

class LibraryEntry extends DataClass implements Insertable<LibraryEntry> {
  final int id;
  final int tmdbId;
  final MediaType mediaType;
  final EntryStatus status;

  /// 0.5–10 in half steps, per implementation plan §5.1.
  ///
  /// The range and the half-step quantization are enforced here in SQL *and*
  /// in [LibraryDao], so neither Dart nor a raw statement can be the hole in
  /// the guarantee. Silently rounding a user's imported rating would corrupt
  /// their history, so violations are rejected rather than coerced.
  final double? rating;
  final DateTime? watchedAt;
  final String? notes;
  final int rewatchCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  const LibraryEntry({
    required this.id,
    required this.tmdbId,
    required this.mediaType,
    required this.status,
    this.rating,
    this.watchedAt,
    this.notes,
    required this.rewatchCount,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tmdb_id'] = Variable<int>(tmdbId);
    {
      map['media_type'] = Variable<String>(
        $LibraryEntriesTable.$convertermediaType.toSql(mediaType),
      );
    }
    {
      map['status'] = Variable<String>(
        $LibraryEntriesTable.$converterstatus.toSql(status),
      );
    }
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<double>(rating);
    }
    if (!nullToAbsent || watchedAt != null) {
      map['watched_at'] = Variable<DateTime>(watchedAt);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['rewatch_count'] = Variable<int>(rewatchCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  LibraryEntriesCompanion toCompanion(bool nullToAbsent) {
    return LibraryEntriesCompanion(
      id: Value(id),
      tmdbId: Value(tmdbId),
      mediaType: Value(mediaType),
      status: Value(status),
      rating: rating == null && nullToAbsent
          ? const Value.absent()
          : Value(rating),
      watchedAt: watchedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(watchedAt),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      rewatchCount: Value(rewatchCount),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory LibraryEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LibraryEntry(
      id: serializer.fromJson<int>(json['id']),
      tmdbId: serializer.fromJson<int>(json['tmdbId']),
      mediaType: $LibraryEntriesTable.$convertermediaType.fromJson(
        serializer.fromJson<String>(json['mediaType']),
      ),
      status: $LibraryEntriesTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      rating: serializer.fromJson<double?>(json['rating']),
      watchedAt: serializer.fromJson<DateTime?>(json['watchedAt']),
      notes: serializer.fromJson<String?>(json['notes']),
      rewatchCount: serializer.fromJson<int>(json['rewatchCount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tmdbId': serializer.toJson<int>(tmdbId),
      'mediaType': serializer.toJson<String>(
        $LibraryEntriesTable.$convertermediaType.toJson(mediaType),
      ),
      'status': serializer.toJson<String>(
        $LibraryEntriesTable.$converterstatus.toJson(status),
      ),
      'rating': serializer.toJson<double?>(rating),
      'watchedAt': serializer.toJson<DateTime?>(watchedAt),
      'notes': serializer.toJson<String?>(notes),
      'rewatchCount': serializer.toJson<int>(rewatchCount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  LibraryEntry copyWith({
    int? id,
    int? tmdbId,
    MediaType? mediaType,
    EntryStatus? status,
    Value<double?> rating = const Value.absent(),
    Value<DateTime?> watchedAt = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    int? rewatchCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => LibraryEntry(
    id: id ?? this.id,
    tmdbId: tmdbId ?? this.tmdbId,
    mediaType: mediaType ?? this.mediaType,
    status: status ?? this.status,
    rating: rating.present ? rating.value : this.rating,
    watchedAt: watchedAt.present ? watchedAt.value : this.watchedAt,
    notes: notes.present ? notes.value : this.notes,
    rewatchCount: rewatchCount ?? this.rewatchCount,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  LibraryEntry copyWithCompanion(LibraryEntriesCompanion data) {
    return LibraryEntry(
      id: data.id.present ? data.id.value : this.id,
      tmdbId: data.tmdbId.present ? data.tmdbId.value : this.tmdbId,
      mediaType: data.mediaType.present ? data.mediaType.value : this.mediaType,
      status: data.status.present ? data.status.value : this.status,
      rating: data.rating.present ? data.rating.value : this.rating,
      watchedAt: data.watchedAt.present ? data.watchedAt.value : this.watchedAt,
      notes: data.notes.present ? data.notes.value : this.notes,
      rewatchCount: data.rewatchCount.present
          ? data.rewatchCount.value
          : this.rewatchCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LibraryEntry(')
          ..write('id: $id, ')
          ..write('tmdbId: $tmdbId, ')
          ..write('mediaType: $mediaType, ')
          ..write('status: $status, ')
          ..write('rating: $rating, ')
          ..write('watchedAt: $watchedAt, ')
          ..write('notes: $notes, ')
          ..write('rewatchCount: $rewatchCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    tmdbId,
    mediaType,
    status,
    rating,
    watchedAt,
    notes,
    rewatchCount,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LibraryEntry &&
          other.id == this.id &&
          other.tmdbId == this.tmdbId &&
          other.mediaType == this.mediaType &&
          other.status == this.status &&
          other.rating == this.rating &&
          other.watchedAt == this.watchedAt &&
          other.notes == this.notes &&
          other.rewatchCount == this.rewatchCount &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class LibraryEntriesCompanion extends UpdateCompanion<LibraryEntry> {
  final Value<int> id;
  final Value<int> tmdbId;
  final Value<MediaType> mediaType;
  final Value<EntryStatus> status;
  final Value<double?> rating;
  final Value<DateTime?> watchedAt;
  final Value<String?> notes;
  final Value<int> rewatchCount;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const LibraryEntriesCompanion({
    this.id = const Value.absent(),
    this.tmdbId = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.status = const Value.absent(),
    this.rating = const Value.absent(),
    this.watchedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.rewatchCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  LibraryEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int tmdbId,
    required MediaType mediaType,
    required EntryStatus status,
    this.rating = const Value.absent(),
    this.watchedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.rewatchCount = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : tmdbId = Value(tmdbId),
       mediaType = Value(mediaType),
       status = Value(status),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<LibraryEntry> custom({
    Expression<int>? id,
    Expression<int>? tmdbId,
    Expression<String>? mediaType,
    Expression<String>? status,
    Expression<double>? rating,
    Expression<DateTime>? watchedAt,
    Expression<String>? notes,
    Expression<int>? rewatchCount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tmdbId != null) 'tmdb_id': tmdbId,
      if (mediaType != null) 'media_type': mediaType,
      if (status != null) 'status': status,
      if (rating != null) 'rating': rating,
      if (watchedAt != null) 'watched_at': watchedAt,
      if (notes != null) 'notes': notes,
      if (rewatchCount != null) 'rewatch_count': rewatchCount,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  LibraryEntriesCompanion copyWith({
    Value<int>? id,
    Value<int>? tmdbId,
    Value<MediaType>? mediaType,
    Value<EntryStatus>? status,
    Value<double?>? rating,
    Value<DateTime?>? watchedAt,
    Value<String?>? notes,
    Value<int>? rewatchCount,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return LibraryEntriesCompanion(
      id: id ?? this.id,
      tmdbId: tmdbId ?? this.tmdbId,
      mediaType: mediaType ?? this.mediaType,
      status: status ?? this.status,
      rating: rating ?? this.rating,
      watchedAt: watchedAt ?? this.watchedAt,
      notes: notes ?? this.notes,
      rewatchCount: rewatchCount ?? this.rewatchCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tmdbId.present) {
      map['tmdb_id'] = Variable<int>(tmdbId.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<String>(
        $LibraryEntriesTable.$convertermediaType.toSql(mediaType.value),
      );
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $LibraryEntriesTable.$converterstatus.toSql(status.value),
      );
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (watchedAt.present) {
      map['watched_at'] = Variable<DateTime>(watchedAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rewatchCount.present) {
      map['rewatch_count'] = Variable<int>(rewatchCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LibraryEntriesCompanion(')
          ..write('id: $id, ')
          ..write('tmdbId: $tmdbId, ')
          ..write('mediaType: $mediaType, ')
          ..write('status: $status, ')
          ..write('rating: $rating, ')
          ..write('watchedAt: $watchedAt, ')
          ..write('notes: $notes, ')
          ..write('rewatchCount: $rewatchCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $EpisodeProgressTable extends EpisodeProgress
    with TableInfo<$EpisodeProgressTable, EpisodeProgressData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EpisodeProgressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _tmdbIdMeta = const VerificationMeta('tmdbId');
  @override
  late final GeneratedColumn<int> tmdbId = GeneratedColumn<int>(
    'tmdb_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seasonMeta = const VerificationMeta('season');
  @override
  late final GeneratedColumn<int> season = GeneratedColumn<int>(
    'season',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _episodeMeta = const VerificationMeta(
    'episode',
  );
  @override
  late final GeneratedColumn<int> episode = GeneratedColumn<int>(
    'episode',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _watchedAtMeta = const VerificationMeta(
    'watchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> watchedAt = GeneratedColumn<DateTime>(
    'watched_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tmdbId,
    season,
    episode,
    watchedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'episode_progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<EpisodeProgressData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tmdb_id')) {
      context.handle(
        _tmdbIdMeta,
        tmdbId.isAcceptableOrUnknown(data['tmdb_id']!, _tmdbIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tmdbIdMeta);
    }
    if (data.containsKey('season')) {
      context.handle(
        _seasonMeta,
        season.isAcceptableOrUnknown(data['season']!, _seasonMeta),
      );
    } else if (isInserting) {
      context.missing(_seasonMeta);
    }
    if (data.containsKey('episode')) {
      context.handle(
        _episodeMeta,
        episode.isAcceptableOrUnknown(data['episode']!, _episodeMeta),
      );
    } else if (isInserting) {
      context.missing(_episodeMeta);
    }
    if (data.containsKey('watched_at')) {
      context.handle(
        _watchedAtMeta,
        watchedAt.isAcceptableOrUnknown(data['watched_at']!, _watchedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_watchedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {tmdbId, season, episode},
  ];
  @override
  EpisodeProgressData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EpisodeProgressData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tmdbId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tmdb_id'],
      )!,
      season: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}season'],
      )!,
      episode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episode'],
      )!,
      watchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}watched_at'],
      )!,
    );
  }

  @override
  $EpisodeProgressTable createAlias(String alias) {
    return $EpisodeProgressTable(attachedDatabase, alias);
  }
}

class EpisodeProgressData extends DataClass
    implements Insertable<EpisodeProgressData> {
  final int id;

  /// TV only, so no mediaType column — the pair is implicitly (tmdbId, tv).
  final int tmdbId;
  final int season;
  final int episode;
  final DateTime watchedAt;
  const EpisodeProgressData({
    required this.id,
    required this.tmdbId,
    required this.season,
    required this.episode,
    required this.watchedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tmdb_id'] = Variable<int>(tmdbId);
    map['season'] = Variable<int>(season);
    map['episode'] = Variable<int>(episode);
    map['watched_at'] = Variable<DateTime>(watchedAt);
    return map;
  }

  EpisodeProgressCompanion toCompanion(bool nullToAbsent) {
    return EpisodeProgressCompanion(
      id: Value(id),
      tmdbId: Value(tmdbId),
      season: Value(season),
      episode: Value(episode),
      watchedAt: Value(watchedAt),
    );
  }

  factory EpisodeProgressData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EpisodeProgressData(
      id: serializer.fromJson<int>(json['id']),
      tmdbId: serializer.fromJson<int>(json['tmdbId']),
      season: serializer.fromJson<int>(json['season']),
      episode: serializer.fromJson<int>(json['episode']),
      watchedAt: serializer.fromJson<DateTime>(json['watchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tmdbId': serializer.toJson<int>(tmdbId),
      'season': serializer.toJson<int>(season),
      'episode': serializer.toJson<int>(episode),
      'watchedAt': serializer.toJson<DateTime>(watchedAt),
    };
  }

  EpisodeProgressData copyWith({
    int? id,
    int? tmdbId,
    int? season,
    int? episode,
    DateTime? watchedAt,
  }) => EpisodeProgressData(
    id: id ?? this.id,
    tmdbId: tmdbId ?? this.tmdbId,
    season: season ?? this.season,
    episode: episode ?? this.episode,
    watchedAt: watchedAt ?? this.watchedAt,
  );
  EpisodeProgressData copyWithCompanion(EpisodeProgressCompanion data) {
    return EpisodeProgressData(
      id: data.id.present ? data.id.value : this.id,
      tmdbId: data.tmdbId.present ? data.tmdbId.value : this.tmdbId,
      season: data.season.present ? data.season.value : this.season,
      episode: data.episode.present ? data.episode.value : this.episode,
      watchedAt: data.watchedAt.present ? data.watchedAt.value : this.watchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EpisodeProgressData(')
          ..write('id: $id, ')
          ..write('tmdbId: $tmdbId, ')
          ..write('season: $season, ')
          ..write('episode: $episode, ')
          ..write('watchedAt: $watchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tmdbId, season, episode, watchedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EpisodeProgressData &&
          other.id == this.id &&
          other.tmdbId == this.tmdbId &&
          other.season == this.season &&
          other.episode == this.episode &&
          other.watchedAt == this.watchedAt);
}

class EpisodeProgressCompanion extends UpdateCompanion<EpisodeProgressData> {
  final Value<int> id;
  final Value<int> tmdbId;
  final Value<int> season;
  final Value<int> episode;
  final Value<DateTime> watchedAt;
  const EpisodeProgressCompanion({
    this.id = const Value.absent(),
    this.tmdbId = const Value.absent(),
    this.season = const Value.absent(),
    this.episode = const Value.absent(),
    this.watchedAt = const Value.absent(),
  });
  EpisodeProgressCompanion.insert({
    this.id = const Value.absent(),
    required int tmdbId,
    required int season,
    required int episode,
    required DateTime watchedAt,
  }) : tmdbId = Value(tmdbId),
       season = Value(season),
       episode = Value(episode),
       watchedAt = Value(watchedAt);
  static Insertable<EpisodeProgressData> custom({
    Expression<int>? id,
    Expression<int>? tmdbId,
    Expression<int>? season,
    Expression<int>? episode,
    Expression<DateTime>? watchedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tmdbId != null) 'tmdb_id': tmdbId,
      if (season != null) 'season': season,
      if (episode != null) 'episode': episode,
      if (watchedAt != null) 'watched_at': watchedAt,
    });
  }

  EpisodeProgressCompanion copyWith({
    Value<int>? id,
    Value<int>? tmdbId,
    Value<int>? season,
    Value<int>? episode,
    Value<DateTime>? watchedAt,
  }) {
    return EpisodeProgressCompanion(
      id: id ?? this.id,
      tmdbId: tmdbId ?? this.tmdbId,
      season: season ?? this.season,
      episode: episode ?? this.episode,
      watchedAt: watchedAt ?? this.watchedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tmdbId.present) {
      map['tmdb_id'] = Variable<int>(tmdbId.value);
    }
    if (season.present) {
      map['season'] = Variable<int>(season.value);
    }
    if (episode.present) {
      map['episode'] = Variable<int>(episode.value);
    }
    if (watchedAt.present) {
      map['watched_at'] = Variable<DateTime>(watchedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EpisodeProgressCompanion(')
          ..write('id: $id, ')
          ..write('tmdbId: $tmdbId, ')
          ..write('season: $season, ')
          ..write('episode: $episode, ')
          ..write('watchedAt: $watchedAt')
          ..write(')'))
        .toString();
  }
}

class $DismissedTable extends Dismissed
    with TableInfo<$DismissedTable, DismissedData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DismissedTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tmdbIdMeta = const VerificationMeta('tmdbId');
  @override
  late final GeneratedColumn<int> tmdbId = GeneratedColumn<int>(
    'tmdb_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<MediaType, String> mediaType =
      GeneratedColumn<String>(
        'media_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<MediaType>($DismissedTable.$convertermediaType);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [tmdbId, mediaType, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dismissed';
  @override
  VerificationContext validateIntegrity(
    Insertable<DismissedData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tmdb_id')) {
      context.handle(
        _tmdbIdMeta,
        tmdbId.isAcceptableOrUnknown(data['tmdb_id']!, _tmdbIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tmdbIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tmdbId, mediaType};
  @override
  DismissedData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DismissedData(
      tmdbId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tmdb_id'],
      )!,
      mediaType: $DismissedTable.$convertermediaType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}media_type'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DismissedTable createAlias(String alias) {
    return $DismissedTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MediaType, String, String> $convertermediaType =
      const EnumNameConverter<MediaType>(MediaType.values);
}

class DismissedData extends DataClass implements Insertable<DismissedData> {
  final int tmdbId;
  final MediaType mediaType;
  final DateTime createdAt;
  const DismissedData({
    required this.tmdbId,
    required this.mediaType,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['tmdb_id'] = Variable<int>(tmdbId);
    {
      map['media_type'] = Variable<String>(
        $DismissedTable.$convertermediaType.toSql(mediaType),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DismissedCompanion toCompanion(bool nullToAbsent) {
    return DismissedCompanion(
      tmdbId: Value(tmdbId),
      mediaType: Value(mediaType),
      createdAt: Value(createdAt),
    );
  }

  factory DismissedData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DismissedData(
      tmdbId: serializer.fromJson<int>(json['tmdbId']),
      mediaType: $DismissedTable.$convertermediaType.fromJson(
        serializer.fromJson<String>(json['mediaType']),
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tmdbId': serializer.toJson<int>(tmdbId),
      'mediaType': serializer.toJson<String>(
        $DismissedTable.$convertermediaType.toJson(mediaType),
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DismissedData copyWith({
    int? tmdbId,
    MediaType? mediaType,
    DateTime? createdAt,
  }) => DismissedData(
    tmdbId: tmdbId ?? this.tmdbId,
    mediaType: mediaType ?? this.mediaType,
    createdAt: createdAt ?? this.createdAt,
  );
  DismissedData copyWithCompanion(DismissedCompanion data) {
    return DismissedData(
      tmdbId: data.tmdbId.present ? data.tmdbId.value : this.tmdbId,
      mediaType: data.mediaType.present ? data.mediaType.value : this.mediaType,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DismissedData(')
          ..write('tmdbId: $tmdbId, ')
          ..write('mediaType: $mediaType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(tmdbId, mediaType, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DismissedData &&
          other.tmdbId == this.tmdbId &&
          other.mediaType == this.mediaType &&
          other.createdAt == this.createdAt);
}

class DismissedCompanion extends UpdateCompanion<DismissedData> {
  final Value<int> tmdbId;
  final Value<MediaType> mediaType;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const DismissedCompanion({
    this.tmdbId = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DismissedCompanion.insert({
    required int tmdbId,
    required MediaType mediaType,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : tmdbId = Value(tmdbId),
       mediaType = Value(mediaType),
       createdAt = Value(createdAt);
  static Insertable<DismissedData> custom({
    Expression<int>? tmdbId,
    Expression<String>? mediaType,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (tmdbId != null) 'tmdb_id': tmdbId,
      if (mediaType != null) 'media_type': mediaType,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DismissedCompanion copyWith({
    Value<int>? tmdbId,
    Value<MediaType>? mediaType,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return DismissedCompanion(
      tmdbId: tmdbId ?? this.tmdbId,
      mediaType: mediaType ?? this.mediaType,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tmdbId.present) {
      map['tmdb_id'] = Variable<int>(tmdbId.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<String>(
        $DismissedTable.$convertermediaType.toSql(mediaType.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DismissedCompanion(')
          ..write('tmdbId: $tmdbId, ')
          ..write('mediaType: $mediaType, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserListsTable extends UserLists
    with TableInfo<$UserListsTable, UserList> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserListsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  late final GeneratedColumnWithTypeConverter<ListSortPreference, String>
  sortPreference = GeneratedColumn<String>(
    'sort_preference',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('manual'),
  ).withConverter<ListSortPreference>($UserListsTable.$convertersortPreference);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    sortOrder,
    sortPreference,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_lists';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserList> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserList map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserList(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      sortPreference: $UserListsTable.$convertersortPreference.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sort_preference'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UserListsTable createAlias(String alias) {
    return $UserListsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ListSortPreference, String, String>
  $convertersortPreference = const EnumNameConverter<ListSortPreference>(
    ListSortPreference.values,
  );
}

class UserList extends DataClass implements Insertable<UserList> {
  final int id;
  final String name;
  final String? description;

  /// Position of the list itself among the user's lists.
  final int sortOrder;

  /// Per-list ordering preference, so each list can sort independently.
  final ListSortPreference sortPreference;
  final DateTime createdAt;
  const UserList({
    required this.id,
    required this.name,
    this.description,
    required this.sortOrder,
    required this.sortPreference,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    {
      map['sort_preference'] = Variable<String>(
        $UserListsTable.$convertersortPreference.toSql(sortPreference),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UserListsCompanion toCompanion(bool nullToAbsent) {
    return UserListsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      sortOrder: Value(sortOrder),
      sortPreference: Value(sortPreference),
      createdAt: Value(createdAt),
    );
  }

  factory UserList.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserList(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      sortPreference: $UserListsTable.$convertersortPreference.fromJson(
        serializer.fromJson<String>(json['sortPreference']),
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'sortPreference': serializer.toJson<String>(
        $UserListsTable.$convertersortPreference.toJson(sortPreference),
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  UserList copyWith({
    int? id,
    String? name,
    Value<String?> description = const Value.absent(),
    int? sortOrder,
    ListSortPreference? sortPreference,
    DateTime? createdAt,
  }) => UserList(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    sortOrder: sortOrder ?? this.sortOrder,
    sortPreference: sortPreference ?? this.sortPreference,
    createdAt: createdAt ?? this.createdAt,
  );
  UserList copyWithCompanion(UserListsCompanion data) {
    return UserList(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      sortPreference: data.sortPreference.present
          ? data.sortPreference.value
          : this.sortPreference,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserList(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('sortPreference: $sortPreference, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, sortOrder, sortPreference, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserList &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.sortOrder == this.sortOrder &&
          other.sortPreference == this.sortPreference &&
          other.createdAt == this.createdAt);
}

class UserListsCompanion extends UpdateCompanion<UserList> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<int> sortOrder;
  final Value<ListSortPreference> sortPreference;
  final Value<DateTime> createdAt;
  const UserListsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.sortPreference = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  UserListsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.sortPreference = const Value.absent(),
    required DateTime createdAt,
  }) : name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<UserList> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? sortOrder,
    Expression<String>? sortPreference,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (sortPreference != null) 'sort_preference': sortPreference,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  UserListsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<int>? sortOrder,
    Value<ListSortPreference>? sortPreference,
    Value<DateTime>? createdAt,
  }) {
    return UserListsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      sortOrder: sortOrder ?? this.sortOrder,
      sortPreference: sortPreference ?? this.sortPreference,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (sortPreference.present) {
      map['sort_preference'] = Variable<String>(
        $UserListsTable.$convertersortPreference.toSql(sortPreference.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserListsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('sortPreference: $sortPreference, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $UserListItemsTable extends UserListItems
    with TableInfo<$UserListItemsTable, UserListItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserListItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _listIdMeta = const VerificationMeta('listId');
  @override
  late final GeneratedColumn<int> listId = GeneratedColumn<int>(
    'list_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_lists (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _tmdbIdMeta = const VerificationMeta('tmdbId');
  @override
  late final GeneratedColumn<int> tmdbId = GeneratedColumn<int>(
    'tmdb_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<MediaType, String> mediaType =
      GeneratedColumn<String>(
        'media_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<MediaType>($UserListItemsTable.$convertermediaType);
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    listId,
    tmdbId,
    mediaType,
    position,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_list_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserListItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('list_id')) {
      context.handle(
        _listIdMeta,
        listId.isAcceptableOrUnknown(data['list_id']!, _listIdMeta),
      );
    } else if (isInserting) {
      context.missing(_listIdMeta);
    }
    if (data.containsKey('tmdb_id')) {
      context.handle(
        _tmdbIdMeta,
        tmdbId.isAcceptableOrUnknown(data['tmdb_id']!, _tmdbIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tmdbIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {listId, tmdbId, mediaType};
  @override
  UserListItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserListItem(
      listId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}list_id'],
      )!,
      tmdbId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tmdb_id'],
      )!,
      mediaType: $UserListItemsTable.$convertermediaType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}media_type'],
        )!,
      ),
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $UserListItemsTable createAlias(String alias) {
    return $UserListItemsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MediaType, String, String> $convertermediaType =
      const EnumNameConverter<MediaType>(MediaType.values);
}

class UserListItem extends DataClass implements Insertable<UserListItem> {
  final int listId;
  final int tmdbId;
  final MediaType mediaType;

  /// Hand-ordered position, authoritative when the list's sortPreference is
  /// [ListSortPreference.manual].
  final int position;

  /// Why this title is on this list — distinct from the library entry's notes,
  /// which are about the title itself rather than its membership here.
  final String? notes;
  const UserListItem({
    required this.listId,
    required this.tmdbId,
    required this.mediaType,
    required this.position,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['list_id'] = Variable<int>(listId);
    map['tmdb_id'] = Variable<int>(tmdbId);
    {
      map['media_type'] = Variable<String>(
        $UserListItemsTable.$convertermediaType.toSql(mediaType),
      );
    }
    map['position'] = Variable<int>(position);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  UserListItemsCompanion toCompanion(bool nullToAbsent) {
    return UserListItemsCompanion(
      listId: Value(listId),
      tmdbId: Value(tmdbId),
      mediaType: Value(mediaType),
      position: Value(position),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory UserListItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserListItem(
      listId: serializer.fromJson<int>(json['listId']),
      tmdbId: serializer.fromJson<int>(json['tmdbId']),
      mediaType: $UserListItemsTable.$convertermediaType.fromJson(
        serializer.fromJson<String>(json['mediaType']),
      ),
      position: serializer.fromJson<int>(json['position']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'listId': serializer.toJson<int>(listId),
      'tmdbId': serializer.toJson<int>(tmdbId),
      'mediaType': serializer.toJson<String>(
        $UserListItemsTable.$convertermediaType.toJson(mediaType),
      ),
      'position': serializer.toJson<int>(position),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  UserListItem copyWith({
    int? listId,
    int? tmdbId,
    MediaType? mediaType,
    int? position,
    Value<String?> notes = const Value.absent(),
  }) => UserListItem(
    listId: listId ?? this.listId,
    tmdbId: tmdbId ?? this.tmdbId,
    mediaType: mediaType ?? this.mediaType,
    position: position ?? this.position,
    notes: notes.present ? notes.value : this.notes,
  );
  UserListItem copyWithCompanion(UserListItemsCompanion data) {
    return UserListItem(
      listId: data.listId.present ? data.listId.value : this.listId,
      tmdbId: data.tmdbId.present ? data.tmdbId.value : this.tmdbId,
      mediaType: data.mediaType.present ? data.mediaType.value : this.mediaType,
      position: data.position.present ? data.position.value : this.position,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserListItem(')
          ..write('listId: $listId, ')
          ..write('tmdbId: $tmdbId, ')
          ..write('mediaType: $mediaType, ')
          ..write('position: $position, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(listId, tmdbId, mediaType, position, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserListItem &&
          other.listId == this.listId &&
          other.tmdbId == this.tmdbId &&
          other.mediaType == this.mediaType &&
          other.position == this.position &&
          other.notes == this.notes);
}

class UserListItemsCompanion extends UpdateCompanion<UserListItem> {
  final Value<int> listId;
  final Value<int> tmdbId;
  final Value<MediaType> mediaType;
  final Value<int> position;
  final Value<String?> notes;
  final Value<int> rowid;
  const UserListItemsCompanion({
    this.listId = const Value.absent(),
    this.tmdbId = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.position = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserListItemsCompanion.insert({
    required int listId,
    required int tmdbId,
    required MediaType mediaType,
    required int position,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : listId = Value(listId),
       tmdbId = Value(tmdbId),
       mediaType = Value(mediaType),
       position = Value(position);
  static Insertable<UserListItem> custom({
    Expression<int>? listId,
    Expression<int>? tmdbId,
    Expression<String>? mediaType,
    Expression<int>? position,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (listId != null) 'list_id': listId,
      if (tmdbId != null) 'tmdb_id': tmdbId,
      if (mediaType != null) 'media_type': mediaType,
      if (position != null) 'position': position,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserListItemsCompanion copyWith({
    Value<int>? listId,
    Value<int>? tmdbId,
    Value<MediaType>? mediaType,
    Value<int>? position,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return UserListItemsCompanion(
      listId: listId ?? this.listId,
      tmdbId: tmdbId ?? this.tmdbId,
      mediaType: mediaType ?? this.mediaType,
      position: position ?? this.position,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (listId.present) {
      map['list_id'] = Variable<int>(listId.value);
    }
    if (tmdbId.present) {
      map['tmdb_id'] = Variable<int>(tmdbId.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<String>(
        $UserListItemsTable.$convertermediaType.toSql(mediaType.value),
      );
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserListItemsCompanion(')
          ..write('listId: $listId, ')
          ..write('tmdbId: $tmdbId, ')
          ..write('mediaType: $mediaType, ')
          ..write('position: $position, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SwipesTable extends Swipes with TableInfo<$SwipesTable, Swipe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SwipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _tmdbIdMeta = const VerificationMeta('tmdbId');
  @override
  late final GeneratedColumn<int> tmdbId = GeneratedColumn<int>(
    'tmdb_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<MediaType, String> mediaType =
      GeneratedColumn<String>(
        'media_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<MediaType>($SwipesTable.$convertermediaType);
  @override
  late final GeneratedColumnWithTypeConverter<SwipeDirection, String>
  direction = GeneratedColumn<String>(
    'direction',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<SwipeDirection>($SwipesTable.$converterdirection);
  @override
  late final GeneratedColumnWithTypeConverter<DeckMode, String> deckMode =
      GeneratedColumn<String>(
        'deck_mode',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DeckMode>($SwipesTable.$converterdeckMode);
  static const VerificationMeta _buddyIdMeta = const VerificationMeta(
    'buddyId',
  );
  @override
  late final GeneratedColumn<int> buddyId = GeneratedColumn<int>(
    'buddy_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tmdbId,
    mediaType,
    direction,
    deckMode,
    buddyId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'swipes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Swipe> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tmdb_id')) {
      context.handle(
        _tmdbIdMeta,
        tmdbId.isAcceptableOrUnknown(data['tmdb_id']!, _tmdbIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tmdbIdMeta);
    }
    if (data.containsKey('buddy_id')) {
      context.handle(
        _buddyIdMeta,
        buddyId.isAcceptableOrUnknown(data['buddy_id']!, _buddyIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Swipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Swipe(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tmdbId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tmdb_id'],
      )!,
      mediaType: $SwipesTable.$convertermediaType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}media_type'],
        )!,
      ),
      direction: $SwipesTable.$converterdirection.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}direction'],
        )!,
      ),
      deckMode: $SwipesTable.$converterdeckMode.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}deck_mode'],
        )!,
      ),
      buddyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}buddy_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SwipesTable createAlias(String alias) {
    return $SwipesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MediaType, String, String> $convertermediaType =
      const EnumNameConverter<MediaType>(MediaType.values);
  static JsonTypeConverter2<SwipeDirection, String, String>
  $converterdirection = const EnumNameConverter<SwipeDirection>(
    SwipeDirection.values,
  );
  static JsonTypeConverter2<DeckMode, String, String> $converterdeckMode =
      const EnumNameConverter<DeckMode>(DeckMode.values);
}

class Swipe extends DataClass implements Insertable<Swipe> {
  final int id;
  final int tmdbId;
  final MediaType mediaType;
  final SwipeDirection direction;
  final DeckMode deckMode;

  /// Set only when deckMode is [DeckMode.buddy].
  final int? buddyId;
  final DateTime createdAt;
  const Swipe({
    required this.id,
    required this.tmdbId,
    required this.mediaType,
    required this.direction,
    required this.deckMode,
    this.buddyId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tmdb_id'] = Variable<int>(tmdbId);
    {
      map['media_type'] = Variable<String>(
        $SwipesTable.$convertermediaType.toSql(mediaType),
      );
    }
    {
      map['direction'] = Variable<String>(
        $SwipesTable.$converterdirection.toSql(direction),
      );
    }
    {
      map['deck_mode'] = Variable<String>(
        $SwipesTable.$converterdeckMode.toSql(deckMode),
      );
    }
    if (!nullToAbsent || buddyId != null) {
      map['buddy_id'] = Variable<int>(buddyId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SwipesCompanion toCompanion(bool nullToAbsent) {
    return SwipesCompanion(
      id: Value(id),
      tmdbId: Value(tmdbId),
      mediaType: Value(mediaType),
      direction: Value(direction),
      deckMode: Value(deckMode),
      buddyId: buddyId == null && nullToAbsent
          ? const Value.absent()
          : Value(buddyId),
      createdAt: Value(createdAt),
    );
  }

  factory Swipe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Swipe(
      id: serializer.fromJson<int>(json['id']),
      tmdbId: serializer.fromJson<int>(json['tmdbId']),
      mediaType: $SwipesTable.$convertermediaType.fromJson(
        serializer.fromJson<String>(json['mediaType']),
      ),
      direction: $SwipesTable.$converterdirection.fromJson(
        serializer.fromJson<String>(json['direction']),
      ),
      deckMode: $SwipesTable.$converterdeckMode.fromJson(
        serializer.fromJson<String>(json['deckMode']),
      ),
      buddyId: serializer.fromJson<int?>(json['buddyId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tmdbId': serializer.toJson<int>(tmdbId),
      'mediaType': serializer.toJson<String>(
        $SwipesTable.$convertermediaType.toJson(mediaType),
      ),
      'direction': serializer.toJson<String>(
        $SwipesTable.$converterdirection.toJson(direction),
      ),
      'deckMode': serializer.toJson<String>(
        $SwipesTable.$converterdeckMode.toJson(deckMode),
      ),
      'buddyId': serializer.toJson<int?>(buddyId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Swipe copyWith({
    int? id,
    int? tmdbId,
    MediaType? mediaType,
    SwipeDirection? direction,
    DeckMode? deckMode,
    Value<int?> buddyId = const Value.absent(),
    DateTime? createdAt,
  }) => Swipe(
    id: id ?? this.id,
    tmdbId: tmdbId ?? this.tmdbId,
    mediaType: mediaType ?? this.mediaType,
    direction: direction ?? this.direction,
    deckMode: deckMode ?? this.deckMode,
    buddyId: buddyId.present ? buddyId.value : this.buddyId,
    createdAt: createdAt ?? this.createdAt,
  );
  Swipe copyWithCompanion(SwipesCompanion data) {
    return Swipe(
      id: data.id.present ? data.id.value : this.id,
      tmdbId: data.tmdbId.present ? data.tmdbId.value : this.tmdbId,
      mediaType: data.mediaType.present ? data.mediaType.value : this.mediaType,
      direction: data.direction.present ? data.direction.value : this.direction,
      deckMode: data.deckMode.present ? data.deckMode.value : this.deckMode,
      buddyId: data.buddyId.present ? data.buddyId.value : this.buddyId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Swipe(')
          ..write('id: $id, ')
          ..write('tmdbId: $tmdbId, ')
          ..write('mediaType: $mediaType, ')
          ..write('direction: $direction, ')
          ..write('deckMode: $deckMode, ')
          ..write('buddyId: $buddyId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    tmdbId,
    mediaType,
    direction,
    deckMode,
    buddyId,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Swipe &&
          other.id == this.id &&
          other.tmdbId == this.tmdbId &&
          other.mediaType == this.mediaType &&
          other.direction == this.direction &&
          other.deckMode == this.deckMode &&
          other.buddyId == this.buddyId &&
          other.createdAt == this.createdAt);
}

class SwipesCompanion extends UpdateCompanion<Swipe> {
  final Value<int> id;
  final Value<int> tmdbId;
  final Value<MediaType> mediaType;
  final Value<SwipeDirection> direction;
  final Value<DeckMode> deckMode;
  final Value<int?> buddyId;
  final Value<DateTime> createdAt;
  const SwipesCompanion({
    this.id = const Value.absent(),
    this.tmdbId = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.direction = const Value.absent(),
    this.deckMode = const Value.absent(),
    this.buddyId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SwipesCompanion.insert({
    this.id = const Value.absent(),
    required int tmdbId,
    required MediaType mediaType,
    required SwipeDirection direction,
    required DeckMode deckMode,
    this.buddyId = const Value.absent(),
    required DateTime createdAt,
  }) : tmdbId = Value(tmdbId),
       mediaType = Value(mediaType),
       direction = Value(direction),
       deckMode = Value(deckMode),
       createdAt = Value(createdAt);
  static Insertable<Swipe> custom({
    Expression<int>? id,
    Expression<int>? tmdbId,
    Expression<String>? mediaType,
    Expression<String>? direction,
    Expression<String>? deckMode,
    Expression<int>? buddyId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tmdbId != null) 'tmdb_id': tmdbId,
      if (mediaType != null) 'media_type': mediaType,
      if (direction != null) 'direction': direction,
      if (deckMode != null) 'deck_mode': deckMode,
      if (buddyId != null) 'buddy_id': buddyId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SwipesCompanion copyWith({
    Value<int>? id,
    Value<int>? tmdbId,
    Value<MediaType>? mediaType,
    Value<SwipeDirection>? direction,
    Value<DeckMode>? deckMode,
    Value<int?>? buddyId,
    Value<DateTime>? createdAt,
  }) {
    return SwipesCompanion(
      id: id ?? this.id,
      tmdbId: tmdbId ?? this.tmdbId,
      mediaType: mediaType ?? this.mediaType,
      direction: direction ?? this.direction,
      deckMode: deckMode ?? this.deckMode,
      buddyId: buddyId ?? this.buddyId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tmdbId.present) {
      map['tmdb_id'] = Variable<int>(tmdbId.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<String>(
        $SwipesTable.$convertermediaType.toSql(mediaType.value),
      );
    }
    if (direction.present) {
      map['direction'] = Variable<String>(
        $SwipesTable.$converterdirection.toSql(direction.value),
      );
    }
    if (deckMode.present) {
      map['deck_mode'] = Variable<String>(
        $SwipesTable.$converterdeckMode.toSql(deckMode.value),
      );
    }
    if (buddyId.present) {
      map['buddy_id'] = Variable<int>(buddyId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SwipesCompanion(')
          ..write('id: $id, ')
          ..write('tmdbId: $tmdbId, ')
          ..write('mediaType: $mediaType, ')
          ..write('direction: $direction, ')
          ..write('deckMode: $deckMode, ')
          ..write('buddyId: $buddyId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $BuddiesTable extends Buddies with TableInfo<$BuddiesTable, Buddy> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BuddiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<String> roomId = GeneratedColumn<String>(
    'room_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _keyRefMeta = const VerificationMeta('keyRef');
  @override
  late final GeneratedColumn<String> keyRef = GeneratedColumn<String>(
    'key_ref',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastSyncedAtMeta = const VerificationMeta(
    'lastSyncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
    'last_synced_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    displayName,
    roomId,
    keyRef,
    createdAt,
    lastSyncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'buddies';
  @override
  VerificationContext validateIntegrity(
    Insertable<Buddy> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('room_id')) {
      context.handle(
        _roomIdMeta,
        roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('key_ref')) {
      context.handle(
        _keyRefMeta,
        keyRef.isAcceptableOrUnknown(data['key_ref']!, _keyRefMeta),
      );
    } else if (isInserting) {
      context.missing(_keyRefMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
        _lastSyncedAtMeta,
        lastSyncedAt.isAcceptableOrUnknown(
          data['last_synced_at']!,
          _lastSyncedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Buddy map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Buddy(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      roomId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}room_id'],
      )!,
      keyRef: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key_ref'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_synced_at'],
      ),
    );
  }

  @override
  $BuddiesTable createAlias(String alias) {
    return $BuddiesTable(attachedDatabase, alias);
  }
}

class Buddy extends DataClass implements Insertable<Buddy> {
  final int id;

  /// A user-chosen label. Purely local — there is no account behind a buddy.
  final String displayName;

  /// Derived from the pairing code via HKDF. Carries no user information.
  final String roomId;

  /// A pointer into platform secure storage. NEVER the key itself: encryption
  /// keys must not live in the SQLite file.
  final String keyRef;
  final DateTime createdAt;
  final DateTime? lastSyncedAt;
  const Buddy({
    required this.id,
    required this.displayName,
    required this.roomId,
    required this.keyRef,
    required this.createdAt,
    this.lastSyncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['display_name'] = Variable<String>(displayName);
    map['room_id'] = Variable<String>(roomId);
    map['key_ref'] = Variable<String>(keyRef);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    return map;
  }

  BuddiesCompanion toCompanion(bool nullToAbsent) {
    return BuddiesCompanion(
      id: Value(id),
      displayName: Value(displayName),
      roomId: Value(roomId),
      keyRef: Value(keyRef),
      createdAt: Value(createdAt),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
    );
  }

  factory Buddy.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Buddy(
      id: serializer.fromJson<int>(json['id']),
      displayName: serializer.fromJson<String>(json['displayName']),
      roomId: serializer.fromJson<String>(json['roomId']),
      keyRef: serializer.fromJson<String>(json['keyRef']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'displayName': serializer.toJson<String>(displayName),
      'roomId': serializer.toJson<String>(roomId),
      'keyRef': serializer.toJson<String>(keyRef),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
    };
  }

  Buddy copyWith({
    int? id,
    String? displayName,
    String? roomId,
    String? keyRef,
    DateTime? createdAt,
    Value<DateTime?> lastSyncedAt = const Value.absent(),
  }) => Buddy(
    id: id ?? this.id,
    displayName: displayName ?? this.displayName,
    roomId: roomId ?? this.roomId,
    keyRef: keyRef ?? this.keyRef,
    createdAt: createdAt ?? this.createdAt,
    lastSyncedAt: lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
  );
  Buddy copyWithCompanion(BuddiesCompanion data) {
    return Buddy(
      id: data.id.present ? data.id.value : this.id,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      roomId: data.roomId.present ? data.roomId.value : this.roomId,
      keyRef: data.keyRef.present ? data.keyRef.value : this.keyRef,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Buddy(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('roomId: $roomId, ')
          ..write('keyRef: $keyRef, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastSyncedAt: $lastSyncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, displayName, roomId, keyRef, createdAt, lastSyncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Buddy &&
          other.id == this.id &&
          other.displayName == this.displayName &&
          other.roomId == this.roomId &&
          other.keyRef == this.keyRef &&
          other.createdAt == this.createdAt &&
          other.lastSyncedAt == this.lastSyncedAt);
}

class BuddiesCompanion extends UpdateCompanion<Buddy> {
  final Value<int> id;
  final Value<String> displayName;
  final Value<String> roomId;
  final Value<String> keyRef;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastSyncedAt;
  const BuddiesCompanion({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.roomId = const Value.absent(),
    this.keyRef = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
  });
  BuddiesCompanion.insert({
    this.id = const Value.absent(),
    required String displayName,
    required String roomId,
    required String keyRef,
    required DateTime createdAt,
    this.lastSyncedAt = const Value.absent(),
  }) : displayName = Value(displayName),
       roomId = Value(roomId),
       keyRef = Value(keyRef),
       createdAt = Value(createdAt);
  static Insertable<Buddy> custom({
    Expression<int>? id,
    Expression<String>? displayName,
    Expression<String>? roomId,
    Expression<String>? keyRef,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastSyncedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (roomId != null) 'room_id': roomId,
      if (keyRef != null) 'key_ref': keyRef,
      if (createdAt != null) 'created_at': createdAt,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
    });
  }

  BuddiesCompanion copyWith({
    Value<int>? id,
    Value<String>? displayName,
    Value<String>? roomId,
    Value<String>? keyRef,
    Value<DateTime>? createdAt,
    Value<DateTime?>? lastSyncedAt,
  }) {
    return BuddiesCompanion(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      roomId: roomId ?? this.roomId,
      keyRef: keyRef ?? this.keyRef,
      createdAt: createdAt ?? this.createdAt,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<String>(roomId.value);
    }
    if (keyRef.present) {
      map['key_ref'] = Variable<String>(keyRef.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BuddiesCompanion(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('roomId: $roomId, ')
          ..write('keyRef: $keyRef, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastSyncedAt: $lastSyncedAt')
          ..write(')'))
        .toString();
  }
}

class $BuddyExclusionsTable extends BuddyExclusions
    with TableInfo<$BuddyExclusionsTable, BuddyExclusion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BuddyExclusionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _buddyIdMeta = const VerificationMeta(
    'buddyId',
  );
  @override
  late final GeneratedColumn<int> buddyId = GeneratedColumn<int>(
    'buddy_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES buddies (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _hashMeta = const VerificationMeta('hash');
  @override
  late final GeneratedColumn<String> hash = GeneratedColumn<String>(
    'hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [buddyId, hash];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'buddy_exclusions';
  @override
  VerificationContext validateIntegrity(
    Insertable<BuddyExclusion> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('buddy_id')) {
      context.handle(
        _buddyIdMeta,
        buddyId.isAcceptableOrUnknown(data['buddy_id']!, _buddyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_buddyIdMeta);
    }
    if (data.containsKey('hash')) {
      context.handle(
        _hashMeta,
        hash.isAcceptableOrUnknown(data['hash']!, _hashMeta),
      );
    } else if (isInserting) {
      context.missing(_hashMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {buddyId, hash};
  @override
  BuddyExclusion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BuddyExclusion(
      buddyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}buddy_id'],
      )!,
      hash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hash'],
      )!,
    );
  }

  @override
  $BuddyExclusionsTable createAlias(String alias) {
    return $BuddyExclusionsTable(attachedDatabase, alias);
  }
}

class BuddyExclusion extends DataClass implements Insertable<BuddyExclusion> {
  final int buddyId;
  final String hash;
  const BuddyExclusion({required this.buddyId, required this.hash});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['buddy_id'] = Variable<int>(buddyId);
    map['hash'] = Variable<String>(hash);
    return map;
  }

  BuddyExclusionsCompanion toCompanion(bool nullToAbsent) {
    return BuddyExclusionsCompanion(buddyId: Value(buddyId), hash: Value(hash));
  }

  factory BuddyExclusion.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BuddyExclusion(
      buddyId: serializer.fromJson<int>(json['buddyId']),
      hash: serializer.fromJson<String>(json['hash']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'buddyId': serializer.toJson<int>(buddyId),
      'hash': serializer.toJson<String>(hash),
    };
  }

  BuddyExclusion copyWith({int? buddyId, String? hash}) =>
      BuddyExclusion(buddyId: buddyId ?? this.buddyId, hash: hash ?? this.hash);
  BuddyExclusion copyWithCompanion(BuddyExclusionsCompanion data) {
    return BuddyExclusion(
      buddyId: data.buddyId.present ? data.buddyId.value : this.buddyId,
      hash: data.hash.present ? data.hash.value : this.hash,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BuddyExclusion(')
          ..write('buddyId: $buddyId, ')
          ..write('hash: $hash')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(buddyId, hash);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BuddyExclusion &&
          other.buddyId == this.buddyId &&
          other.hash == this.hash);
}

class BuddyExclusionsCompanion extends UpdateCompanion<BuddyExclusion> {
  final Value<int> buddyId;
  final Value<String> hash;
  final Value<int> rowid;
  const BuddyExclusionsCompanion({
    this.buddyId = const Value.absent(),
    this.hash = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BuddyExclusionsCompanion.insert({
    required int buddyId,
    required String hash,
    this.rowid = const Value.absent(),
  }) : buddyId = Value(buddyId),
       hash = Value(hash);
  static Insertable<BuddyExclusion> custom({
    Expression<int>? buddyId,
    Expression<String>? hash,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (buddyId != null) 'buddy_id': buddyId,
      if (hash != null) 'hash': hash,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BuddyExclusionsCompanion copyWith({
    Value<int>? buddyId,
    Value<String>? hash,
    Value<int>? rowid,
  }) {
    return BuddyExclusionsCompanion(
      buddyId: buddyId ?? this.buddyId,
      hash: hash ?? this.hash,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (buddyId.present) {
      map['buddy_id'] = Variable<int>(buddyId.value);
    }
    if (hash.present) {
      map['hash'] = Variable<String>(hash.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BuddyExclusionsCompanion(')
          ..write('buddyId: $buddyId, ')
          ..write('hash: $hash, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BuddyRightSwipesTable extends BuddyRightSwipes
    with TableInfo<$BuddyRightSwipesTable, BuddyRightSwipe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BuddyRightSwipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _buddyIdMeta = const VerificationMeta(
    'buddyId',
  );
  @override
  late final GeneratedColumn<int> buddyId = GeneratedColumn<int>(
    'buddy_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES buddies (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _tmdbIdMeta = const VerificationMeta('tmdbId');
  @override
  late final GeneratedColumn<int> tmdbId = GeneratedColumn<int>(
    'tmdb_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<MediaType, String> mediaType =
      GeneratedColumn<String>(
        'media_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<MediaType>($BuddyRightSwipesTable.$convertermediaType);
  @override
  List<GeneratedColumn> get $columns => [buddyId, tmdbId, mediaType];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'buddy_right_swipes';
  @override
  VerificationContext validateIntegrity(
    Insertable<BuddyRightSwipe> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('buddy_id')) {
      context.handle(
        _buddyIdMeta,
        buddyId.isAcceptableOrUnknown(data['buddy_id']!, _buddyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_buddyIdMeta);
    }
    if (data.containsKey('tmdb_id')) {
      context.handle(
        _tmdbIdMeta,
        tmdbId.isAcceptableOrUnknown(data['tmdb_id']!, _tmdbIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tmdbIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {buddyId, tmdbId, mediaType};
  @override
  BuddyRightSwipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BuddyRightSwipe(
      buddyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}buddy_id'],
      )!,
      tmdbId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tmdb_id'],
      )!,
      mediaType: $BuddyRightSwipesTable.$convertermediaType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}media_type'],
        )!,
      ),
    );
  }

  @override
  $BuddyRightSwipesTable createAlias(String alias) {
    return $BuddyRightSwipesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MediaType, String, String> $convertermediaType =
      const EnumNameConverter<MediaType>(MediaType.values);
}

class BuddyRightSwipe extends DataClass implements Insertable<BuddyRightSwipe> {
  final int buddyId;
  final int tmdbId;
  final MediaType mediaType;
  const BuddyRightSwipe({
    required this.buddyId,
    required this.tmdbId,
    required this.mediaType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['buddy_id'] = Variable<int>(buddyId);
    map['tmdb_id'] = Variable<int>(tmdbId);
    {
      map['media_type'] = Variable<String>(
        $BuddyRightSwipesTable.$convertermediaType.toSql(mediaType),
      );
    }
    return map;
  }

  BuddyRightSwipesCompanion toCompanion(bool nullToAbsent) {
    return BuddyRightSwipesCompanion(
      buddyId: Value(buddyId),
      tmdbId: Value(tmdbId),
      mediaType: Value(mediaType),
    );
  }

  factory BuddyRightSwipe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BuddyRightSwipe(
      buddyId: serializer.fromJson<int>(json['buddyId']),
      tmdbId: serializer.fromJson<int>(json['tmdbId']),
      mediaType: $BuddyRightSwipesTable.$convertermediaType.fromJson(
        serializer.fromJson<String>(json['mediaType']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'buddyId': serializer.toJson<int>(buddyId),
      'tmdbId': serializer.toJson<int>(tmdbId),
      'mediaType': serializer.toJson<String>(
        $BuddyRightSwipesTable.$convertermediaType.toJson(mediaType),
      ),
    };
  }

  BuddyRightSwipe copyWith({int? buddyId, int? tmdbId, MediaType? mediaType}) =>
      BuddyRightSwipe(
        buddyId: buddyId ?? this.buddyId,
        tmdbId: tmdbId ?? this.tmdbId,
        mediaType: mediaType ?? this.mediaType,
      );
  BuddyRightSwipe copyWithCompanion(BuddyRightSwipesCompanion data) {
    return BuddyRightSwipe(
      buddyId: data.buddyId.present ? data.buddyId.value : this.buddyId,
      tmdbId: data.tmdbId.present ? data.tmdbId.value : this.tmdbId,
      mediaType: data.mediaType.present ? data.mediaType.value : this.mediaType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BuddyRightSwipe(')
          ..write('buddyId: $buddyId, ')
          ..write('tmdbId: $tmdbId, ')
          ..write('mediaType: $mediaType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(buddyId, tmdbId, mediaType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BuddyRightSwipe &&
          other.buddyId == this.buddyId &&
          other.tmdbId == this.tmdbId &&
          other.mediaType == this.mediaType);
}

class BuddyRightSwipesCompanion extends UpdateCompanion<BuddyRightSwipe> {
  final Value<int> buddyId;
  final Value<int> tmdbId;
  final Value<MediaType> mediaType;
  final Value<int> rowid;
  const BuddyRightSwipesCompanion({
    this.buddyId = const Value.absent(),
    this.tmdbId = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BuddyRightSwipesCompanion.insert({
    required int buddyId,
    required int tmdbId,
    required MediaType mediaType,
    this.rowid = const Value.absent(),
  }) : buddyId = Value(buddyId),
       tmdbId = Value(tmdbId),
       mediaType = Value(mediaType);
  static Insertable<BuddyRightSwipe> custom({
    Expression<int>? buddyId,
    Expression<int>? tmdbId,
    Expression<String>? mediaType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (buddyId != null) 'buddy_id': buddyId,
      if (tmdbId != null) 'tmdb_id': tmdbId,
      if (mediaType != null) 'media_type': mediaType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BuddyRightSwipesCompanion copyWith({
    Value<int>? buddyId,
    Value<int>? tmdbId,
    Value<MediaType>? mediaType,
    Value<int>? rowid,
  }) {
    return BuddyRightSwipesCompanion(
      buddyId: buddyId ?? this.buddyId,
      tmdbId: tmdbId ?? this.tmdbId,
      mediaType: mediaType ?? this.mediaType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (buddyId.present) {
      map['buddy_id'] = Variable<int>(buddyId.value);
    }
    if (tmdbId.present) {
      map['tmdb_id'] = Variable<int>(tmdbId.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<String>(
        $BuddyRightSwipesTable.$convertermediaType.toSql(mediaType.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BuddyRightSwipesCompanion(')
          ..write('buddyId: $buddyId, ')
          ..write('tmdbId: $tmdbId, ')
          ..write('mediaType: $mediaType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MatchesTable extends Matches with TableInfo<$MatchesTable, Matche> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MatchesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _buddyIdMeta = const VerificationMeta(
    'buddyId',
  );
  @override
  late final GeneratedColumn<int> buddyId = GeneratedColumn<int>(
    'buddy_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES buddies (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _tmdbIdMeta = const VerificationMeta('tmdbId');
  @override
  late final GeneratedColumn<int> tmdbId = GeneratedColumn<int>(
    'tmdb_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<MediaType, String> mediaType =
      GeneratedColumn<String>(
        'media_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<MediaType>($MatchesTable.$convertermediaType);
  static const VerificationMeta _matchedAtMeta = const VerificationMeta(
    'matchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> matchedAt = GeneratedColumn<DateTime>(
    'matched_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dismissedMeta = const VerificationMeta(
    'dismissed',
  );
  @override
  late final GeneratedColumn<bool> dismissed = GeneratedColumn<bool>(
    'dismissed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("dismissed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    buddyId,
    tmdbId,
    mediaType,
    matchedAt,
    dismissed,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'matches';
  @override
  VerificationContext validateIntegrity(
    Insertable<Matche> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('buddy_id')) {
      context.handle(
        _buddyIdMeta,
        buddyId.isAcceptableOrUnknown(data['buddy_id']!, _buddyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_buddyIdMeta);
    }
    if (data.containsKey('tmdb_id')) {
      context.handle(
        _tmdbIdMeta,
        tmdbId.isAcceptableOrUnknown(data['tmdb_id']!, _tmdbIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tmdbIdMeta);
    }
    if (data.containsKey('matched_at')) {
      context.handle(
        _matchedAtMeta,
        matchedAt.isAcceptableOrUnknown(data['matched_at']!, _matchedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_matchedAtMeta);
    }
    if (data.containsKey('dismissed')) {
      context.handle(
        _dismissedMeta,
        dismissed.isAcceptableOrUnknown(data['dismissed']!, _dismissedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {buddyId, tmdbId, mediaType},
  ];
  @override
  Matche map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Matche(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      buddyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}buddy_id'],
      )!,
      tmdbId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tmdb_id'],
      )!,
      mediaType: $MatchesTable.$convertermediaType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}media_type'],
        )!,
      ),
      matchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}matched_at'],
      )!,
      dismissed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}dismissed'],
      )!,
    );
  }

  @override
  $MatchesTable createAlias(String alias) {
    return $MatchesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MediaType, String, String> $convertermediaType =
      const EnumNameConverter<MediaType>(MediaType.values);
}

class Matche extends DataClass implements Insertable<Matche> {
  final int id;
  final int buddyId;
  final int tmdbId;
  final MediaType mediaType;
  final DateTime matchedAt;
  final bool dismissed;
  const Matche({
    required this.id,
    required this.buddyId,
    required this.tmdbId,
    required this.mediaType,
    required this.matchedAt,
    required this.dismissed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['buddy_id'] = Variable<int>(buddyId);
    map['tmdb_id'] = Variable<int>(tmdbId);
    {
      map['media_type'] = Variable<String>(
        $MatchesTable.$convertermediaType.toSql(mediaType),
      );
    }
    map['matched_at'] = Variable<DateTime>(matchedAt);
    map['dismissed'] = Variable<bool>(dismissed);
    return map;
  }

  MatchesCompanion toCompanion(bool nullToAbsent) {
    return MatchesCompanion(
      id: Value(id),
      buddyId: Value(buddyId),
      tmdbId: Value(tmdbId),
      mediaType: Value(mediaType),
      matchedAt: Value(matchedAt),
      dismissed: Value(dismissed),
    );
  }

  factory Matche.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Matche(
      id: serializer.fromJson<int>(json['id']),
      buddyId: serializer.fromJson<int>(json['buddyId']),
      tmdbId: serializer.fromJson<int>(json['tmdbId']),
      mediaType: $MatchesTable.$convertermediaType.fromJson(
        serializer.fromJson<String>(json['mediaType']),
      ),
      matchedAt: serializer.fromJson<DateTime>(json['matchedAt']),
      dismissed: serializer.fromJson<bool>(json['dismissed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'buddyId': serializer.toJson<int>(buddyId),
      'tmdbId': serializer.toJson<int>(tmdbId),
      'mediaType': serializer.toJson<String>(
        $MatchesTable.$convertermediaType.toJson(mediaType),
      ),
      'matchedAt': serializer.toJson<DateTime>(matchedAt),
      'dismissed': serializer.toJson<bool>(dismissed),
    };
  }

  Matche copyWith({
    int? id,
    int? buddyId,
    int? tmdbId,
    MediaType? mediaType,
    DateTime? matchedAt,
    bool? dismissed,
  }) => Matche(
    id: id ?? this.id,
    buddyId: buddyId ?? this.buddyId,
    tmdbId: tmdbId ?? this.tmdbId,
    mediaType: mediaType ?? this.mediaType,
    matchedAt: matchedAt ?? this.matchedAt,
    dismissed: dismissed ?? this.dismissed,
  );
  Matche copyWithCompanion(MatchesCompanion data) {
    return Matche(
      id: data.id.present ? data.id.value : this.id,
      buddyId: data.buddyId.present ? data.buddyId.value : this.buddyId,
      tmdbId: data.tmdbId.present ? data.tmdbId.value : this.tmdbId,
      mediaType: data.mediaType.present ? data.mediaType.value : this.mediaType,
      matchedAt: data.matchedAt.present ? data.matchedAt.value : this.matchedAt,
      dismissed: data.dismissed.present ? data.dismissed.value : this.dismissed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Matche(')
          ..write('id: $id, ')
          ..write('buddyId: $buddyId, ')
          ..write('tmdbId: $tmdbId, ')
          ..write('mediaType: $mediaType, ')
          ..write('matchedAt: $matchedAt, ')
          ..write('dismissed: $dismissed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, buddyId, tmdbId, mediaType, matchedAt, dismissed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Matche &&
          other.id == this.id &&
          other.buddyId == this.buddyId &&
          other.tmdbId == this.tmdbId &&
          other.mediaType == this.mediaType &&
          other.matchedAt == this.matchedAt &&
          other.dismissed == this.dismissed);
}

class MatchesCompanion extends UpdateCompanion<Matche> {
  final Value<int> id;
  final Value<int> buddyId;
  final Value<int> tmdbId;
  final Value<MediaType> mediaType;
  final Value<DateTime> matchedAt;
  final Value<bool> dismissed;
  const MatchesCompanion({
    this.id = const Value.absent(),
    this.buddyId = const Value.absent(),
    this.tmdbId = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.matchedAt = const Value.absent(),
    this.dismissed = const Value.absent(),
  });
  MatchesCompanion.insert({
    this.id = const Value.absent(),
    required int buddyId,
    required int tmdbId,
    required MediaType mediaType,
    required DateTime matchedAt,
    this.dismissed = const Value.absent(),
  }) : buddyId = Value(buddyId),
       tmdbId = Value(tmdbId),
       mediaType = Value(mediaType),
       matchedAt = Value(matchedAt);
  static Insertable<Matche> custom({
    Expression<int>? id,
    Expression<int>? buddyId,
    Expression<int>? tmdbId,
    Expression<String>? mediaType,
    Expression<DateTime>? matchedAt,
    Expression<bool>? dismissed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (buddyId != null) 'buddy_id': buddyId,
      if (tmdbId != null) 'tmdb_id': tmdbId,
      if (mediaType != null) 'media_type': mediaType,
      if (matchedAt != null) 'matched_at': matchedAt,
      if (dismissed != null) 'dismissed': dismissed,
    });
  }

  MatchesCompanion copyWith({
    Value<int>? id,
    Value<int>? buddyId,
    Value<int>? tmdbId,
    Value<MediaType>? mediaType,
    Value<DateTime>? matchedAt,
    Value<bool>? dismissed,
  }) {
    return MatchesCompanion(
      id: id ?? this.id,
      buddyId: buddyId ?? this.buddyId,
      tmdbId: tmdbId ?? this.tmdbId,
      mediaType: mediaType ?? this.mediaType,
      matchedAt: matchedAt ?? this.matchedAt,
      dismissed: dismissed ?? this.dismissed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (buddyId.present) {
      map['buddy_id'] = Variable<int>(buddyId.value);
    }
    if (tmdbId.present) {
      map['tmdb_id'] = Variable<int>(tmdbId.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<String>(
        $MatchesTable.$convertermediaType.toSql(mediaType.value),
      );
    }
    if (matchedAt.present) {
      map['matched_at'] = Variable<DateTime>(matchedAt.value);
    }
    if (dismissed.present) {
      map['dismissed'] = Variable<bool>(dismissed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MatchesCompanion(')
          ..write('id: $id, ')
          ..write('buddyId: $buddyId, ')
          ..write('tmdbId: $tmdbId, ')
          ..write('mediaType: $mediaType, ')
          ..write('matchedAt: $matchedAt, ')
          ..write('dismissed: $dismissed')
          ..write(')'))
        .toString();
  }
}

class $PreferencesTable extends Preferences
    with TableInfo<$PreferencesTable, Preference> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreferencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'preferences';
  @override
  VerificationContext validateIntegrity(
    Insertable<Preference> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  Preference map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Preference(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $PreferencesTable createAlias(String alias) {
    return $PreferencesTable(attachedDatabase, alias);
  }
}

class Preference extends DataClass implements Insertable<Preference> {
  final String key;
  final String value;
  const Preference({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  PreferencesCompanion toCompanion(bool nullToAbsent) {
    return PreferencesCompanion(key: Value(key), value: Value(value));
  }

  factory Preference.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Preference(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  Preference copyWith({String? key, String? value}) =>
      Preference(key: key ?? this.key, value: value ?? this.value);
  Preference copyWithCompanion(PreferencesCompanion data) {
    return Preference(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Preference(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Preference &&
          other.key == this.key &&
          other.value == this.value);
}

class PreferencesCompanion extends UpdateCompanion<Preference> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const PreferencesCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PreferencesCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<Preference> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PreferencesCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return PreferencesCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreferencesCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TitlesTable titles = $TitlesTable(this);
  late final $LibraryEntriesTable libraryEntries = $LibraryEntriesTable(this);
  late final $EpisodeProgressTable episodeProgress = $EpisodeProgressTable(
    this,
  );
  late final $DismissedTable dismissed = $DismissedTable(this);
  late final $UserListsTable userLists = $UserListsTable(this);
  late final $UserListItemsTable userListItems = $UserListItemsTable(this);
  late final $SwipesTable swipes = $SwipesTable(this);
  late final $BuddiesTable buddies = $BuddiesTable(this);
  late final $BuddyExclusionsTable buddyExclusions = $BuddyExclusionsTable(
    this,
  );
  late final $BuddyRightSwipesTable buddyRightSwipes = $BuddyRightSwipesTable(
    this,
  );
  late final $MatchesTable matches = $MatchesTable(this);
  late final $PreferencesTable preferences = $PreferencesTable(this);
  late final Index idxTitlesCachedAt = Index(
    'idx_titles_cached_at',
    'CREATE INDEX idx_titles_cached_at ON titles (cached_at)',
  );
  late final Index idxLibraryStatus = Index(
    'idx_library_status',
    'CREATE INDEX idx_library_status ON library_entries (status)',
  );
  late final Index idxLibraryTitle = Index(
    'idx_library_title',
    'CREATE INDEX idx_library_title ON library_entries (tmdb_id, media_type)',
  );
  late final Index idxSwipesDeck = Index(
    'idx_swipes_deck',
    'CREATE INDEX idx_swipes_deck ON swipes (deck_mode, buddy_id)',
  );
  late final Index idxMatchesBuddy = Index(
    'idx_matches_buddy',
    'CREATE INDEX idx_matches_buddy ON matches (buddy_id)',
  );
  late final TitlesDao titlesDao = TitlesDao(this as AppDatabase);
  late final LibraryDao libraryDao = LibraryDao(this as AppDatabase);
  late final DismissedDao dismissedDao = DismissedDao(this as AppDatabase);
  late final EpisodeProgressDao episodeProgressDao = EpisodeProgressDao(
    this as AppDatabase,
  );
  late final ListsDao listsDao = ListsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    titles,
    libraryEntries,
    episodeProgress,
    dismissed,
    userLists,
    userListItems,
    swipes,
    buddies,
    buddyExclusions,
    buddyRightSwipes,
    matches,
    preferences,
    idxTitlesCachedAt,
    idxLibraryStatus,
    idxLibraryTitle,
    idxSwipesDeck,
    idxMatchesBuddy,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'user_lists',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('user_list_items', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'buddies',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('buddy_exclusions', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'buddies',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('buddy_right_swipes', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'buddies',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('matches', kind: UpdateKind.delete)],
    ),
  ]);
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$TitlesTableCreateCompanionBuilder =
    TitlesCompanion Function({
      required int tmdbId,
      required MediaType mediaType,
      required String title,
      Value<String?> originalTitle,
      Value<int?> year,
      Value<String?> overview,
      Value<String?> posterPath,
      Value<String?> backdropPath,
      Value<int?> runtime,
      Value<String> genreIds,
      Value<double?> voteAverage,
      Value<String?> imdbId,
      required DateTime cachedAt,
      Value<int> rowid,
    });
typedef $$TitlesTableUpdateCompanionBuilder =
    TitlesCompanion Function({
      Value<int> tmdbId,
      Value<MediaType> mediaType,
      Value<String> title,
      Value<String?> originalTitle,
      Value<int?> year,
      Value<String?> overview,
      Value<String?> posterPath,
      Value<String?> backdropPath,
      Value<int?> runtime,
      Value<String> genreIds,
      Value<double?> voteAverage,
      Value<String?> imdbId,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$TitlesTableFilterComposer
    extends Composer<_$AppDatabase, $TitlesTable> {
  $$TitlesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get tmdbId => $composableBuilder(
    column: $table.tmdbId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MediaType, MediaType, String> get mediaType =>
      $composableBuilder(
        column: $table.mediaType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originalTitle => $composableBuilder(
    column: $table.originalTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get overview => $composableBuilder(
    column: $table.overview,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get runtime => $composableBuilder(
    column: $table.runtime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get genreIds => $composableBuilder(
    column: $table.genreIds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get voteAverage => $composableBuilder(
    column: $table.voteAverage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imdbId => $composableBuilder(
    column: $table.imdbId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TitlesTableOrderingComposer
    extends Composer<_$AppDatabase, $TitlesTable> {
  $$TitlesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get tmdbId => $composableBuilder(
    column: $table.tmdbId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mediaType => $composableBuilder(
    column: $table.mediaType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originalTitle => $composableBuilder(
    column: $table.originalTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get overview => $composableBuilder(
    column: $table.overview,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get runtime => $composableBuilder(
    column: $table.runtime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get genreIds => $composableBuilder(
    column: $table.genreIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get voteAverage => $composableBuilder(
    column: $table.voteAverage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imdbId => $composableBuilder(
    column: $table.imdbId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TitlesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TitlesTable> {
  $$TitlesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get tmdbId =>
      $composableBuilder(column: $table.tmdbId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MediaType, String> get mediaType =>
      $composableBuilder(column: $table.mediaType, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get originalTitle => $composableBuilder(
    column: $table.originalTitle,
    builder: (column) => column,
  );

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<String> get overview =>
      $composableBuilder(column: $table.overview, builder: (column) => column);

  GeneratedColumn<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => column,
  );

  GeneratedColumn<int> get runtime =>
      $composableBuilder(column: $table.runtime, builder: (column) => column);

  GeneratedColumn<String> get genreIds =>
      $composableBuilder(column: $table.genreIds, builder: (column) => column);

  GeneratedColumn<double> get voteAverage => $composableBuilder(
    column: $table.voteAverage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imdbId =>
      $composableBuilder(column: $table.imdbId, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$TitlesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TitlesTable,
          Title,
          $$TitlesTableFilterComposer,
          $$TitlesTableOrderingComposer,
          $$TitlesTableAnnotationComposer,
          $$TitlesTableCreateCompanionBuilder,
          $$TitlesTableUpdateCompanionBuilder,
          (Title, BaseReferences<_$AppDatabase, $TitlesTable, Title>),
          Title,
          PrefetchHooks Function()
        > {
  $$TitlesTableTableManager(_$AppDatabase db, $TitlesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TitlesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TitlesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TitlesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> tmdbId = const Value.absent(),
                Value<MediaType> mediaType = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> originalTitle = const Value.absent(),
                Value<int?> year = const Value.absent(),
                Value<String?> overview = const Value.absent(),
                Value<String?> posterPath = const Value.absent(),
                Value<String?> backdropPath = const Value.absent(),
                Value<int?> runtime = const Value.absent(),
                Value<String> genreIds = const Value.absent(),
                Value<double?> voteAverage = const Value.absent(),
                Value<String?> imdbId = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TitlesCompanion(
                tmdbId: tmdbId,
                mediaType: mediaType,
                title: title,
                originalTitle: originalTitle,
                year: year,
                overview: overview,
                posterPath: posterPath,
                backdropPath: backdropPath,
                runtime: runtime,
                genreIds: genreIds,
                voteAverage: voteAverage,
                imdbId: imdbId,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int tmdbId,
                required MediaType mediaType,
                required String title,
                Value<String?> originalTitle = const Value.absent(),
                Value<int?> year = const Value.absent(),
                Value<String?> overview = const Value.absent(),
                Value<String?> posterPath = const Value.absent(),
                Value<String?> backdropPath = const Value.absent(),
                Value<int?> runtime = const Value.absent(),
                Value<String> genreIds = const Value.absent(),
                Value<double?> voteAverage = const Value.absent(),
                Value<String?> imdbId = const Value.absent(),
                required DateTime cachedAt,
                Value<int> rowid = const Value.absent(),
              }) => TitlesCompanion.insert(
                tmdbId: tmdbId,
                mediaType: mediaType,
                title: title,
                originalTitle: originalTitle,
                year: year,
                overview: overview,
                posterPath: posterPath,
                backdropPath: backdropPath,
                runtime: runtime,
                genreIds: genreIds,
                voteAverage: voteAverage,
                imdbId: imdbId,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TitlesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TitlesTable,
      Title,
      $$TitlesTableFilterComposer,
      $$TitlesTableOrderingComposer,
      $$TitlesTableAnnotationComposer,
      $$TitlesTableCreateCompanionBuilder,
      $$TitlesTableUpdateCompanionBuilder,
      (Title, BaseReferences<_$AppDatabase, $TitlesTable, Title>),
      Title,
      PrefetchHooks Function()
    >;
typedef $$LibraryEntriesTableCreateCompanionBuilder =
    LibraryEntriesCompanion Function({
      Value<int> id,
      required int tmdbId,
      required MediaType mediaType,
      required EntryStatus status,
      Value<double?> rating,
      Value<DateTime?> watchedAt,
      Value<String?> notes,
      Value<int> rewatchCount,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$LibraryEntriesTableUpdateCompanionBuilder =
    LibraryEntriesCompanion Function({
      Value<int> id,
      Value<int> tmdbId,
      Value<MediaType> mediaType,
      Value<EntryStatus> status,
      Value<double?> rating,
      Value<DateTime?> watchedAt,
      Value<String?> notes,
      Value<int> rewatchCount,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$LibraryEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $LibraryEntriesTable> {
  $$LibraryEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tmdbId => $composableBuilder(
    column: $table.tmdbId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MediaType, MediaType, String> get mediaType =>
      $composableBuilder(
        column: $table.mediaType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<EntryStatus, EntryStatus, String> get status =>
      $composableBuilder(
        column: $table.status,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get watchedAt => $composableBuilder(
    column: $table.watchedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rewatchCount => $composableBuilder(
    column: $table.rewatchCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LibraryEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $LibraryEntriesTable> {
  $$LibraryEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tmdbId => $composableBuilder(
    column: $table.tmdbId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mediaType => $composableBuilder(
    column: $table.mediaType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get watchedAt => $composableBuilder(
    column: $table.watchedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rewatchCount => $composableBuilder(
    column: $table.rewatchCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LibraryEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LibraryEntriesTable> {
  $$LibraryEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get tmdbId =>
      $composableBuilder(column: $table.tmdbId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MediaType, String> get mediaType =>
      $composableBuilder(column: $table.mediaType, builder: (column) => column);

  GeneratedColumnWithTypeConverter<EntryStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<DateTime> get watchedAt =>
      $composableBuilder(column: $table.watchedAt, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get rewatchCount => $composableBuilder(
    column: $table.rewatchCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$LibraryEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LibraryEntriesTable,
          LibraryEntry,
          $$LibraryEntriesTableFilterComposer,
          $$LibraryEntriesTableOrderingComposer,
          $$LibraryEntriesTableAnnotationComposer,
          $$LibraryEntriesTableCreateCompanionBuilder,
          $$LibraryEntriesTableUpdateCompanionBuilder,
          (
            LibraryEntry,
            BaseReferences<_$AppDatabase, $LibraryEntriesTable, LibraryEntry>,
          ),
          LibraryEntry,
          PrefetchHooks Function()
        > {
  $$LibraryEntriesTableTableManager(
    _$AppDatabase db,
    $LibraryEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LibraryEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LibraryEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LibraryEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> tmdbId = const Value.absent(),
                Value<MediaType> mediaType = const Value.absent(),
                Value<EntryStatus> status = const Value.absent(),
                Value<double?> rating = const Value.absent(),
                Value<DateTime?> watchedAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rewatchCount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => LibraryEntriesCompanion(
                id: id,
                tmdbId: tmdbId,
                mediaType: mediaType,
                status: status,
                rating: rating,
                watchedAt: watchedAt,
                notes: notes,
                rewatchCount: rewatchCount,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int tmdbId,
                required MediaType mediaType,
                required EntryStatus status,
                Value<double?> rating = const Value.absent(),
                Value<DateTime?> watchedAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rewatchCount = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => LibraryEntriesCompanion.insert(
                id: id,
                tmdbId: tmdbId,
                mediaType: mediaType,
                status: status,
                rating: rating,
                watchedAt: watchedAt,
                notes: notes,
                rewatchCount: rewatchCount,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LibraryEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LibraryEntriesTable,
      LibraryEntry,
      $$LibraryEntriesTableFilterComposer,
      $$LibraryEntriesTableOrderingComposer,
      $$LibraryEntriesTableAnnotationComposer,
      $$LibraryEntriesTableCreateCompanionBuilder,
      $$LibraryEntriesTableUpdateCompanionBuilder,
      (
        LibraryEntry,
        BaseReferences<_$AppDatabase, $LibraryEntriesTable, LibraryEntry>,
      ),
      LibraryEntry,
      PrefetchHooks Function()
    >;
typedef $$EpisodeProgressTableCreateCompanionBuilder =
    EpisodeProgressCompanion Function({
      Value<int> id,
      required int tmdbId,
      required int season,
      required int episode,
      required DateTime watchedAt,
    });
typedef $$EpisodeProgressTableUpdateCompanionBuilder =
    EpisodeProgressCompanion Function({
      Value<int> id,
      Value<int> tmdbId,
      Value<int> season,
      Value<int> episode,
      Value<DateTime> watchedAt,
    });

class $$EpisodeProgressTableFilterComposer
    extends Composer<_$AppDatabase, $EpisodeProgressTable> {
  $$EpisodeProgressTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tmdbId => $composableBuilder(
    column: $table.tmdbId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get season => $composableBuilder(
    column: $table.season,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get episode => $composableBuilder(
    column: $table.episode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get watchedAt => $composableBuilder(
    column: $table.watchedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EpisodeProgressTableOrderingComposer
    extends Composer<_$AppDatabase, $EpisodeProgressTable> {
  $$EpisodeProgressTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tmdbId => $composableBuilder(
    column: $table.tmdbId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get season => $composableBuilder(
    column: $table.season,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get episode => $composableBuilder(
    column: $table.episode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get watchedAt => $composableBuilder(
    column: $table.watchedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EpisodeProgressTableAnnotationComposer
    extends Composer<_$AppDatabase, $EpisodeProgressTable> {
  $$EpisodeProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get tmdbId =>
      $composableBuilder(column: $table.tmdbId, builder: (column) => column);

  GeneratedColumn<int> get season =>
      $composableBuilder(column: $table.season, builder: (column) => column);

  GeneratedColumn<int> get episode =>
      $composableBuilder(column: $table.episode, builder: (column) => column);

  GeneratedColumn<DateTime> get watchedAt =>
      $composableBuilder(column: $table.watchedAt, builder: (column) => column);
}

class $$EpisodeProgressTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EpisodeProgressTable,
          EpisodeProgressData,
          $$EpisodeProgressTableFilterComposer,
          $$EpisodeProgressTableOrderingComposer,
          $$EpisodeProgressTableAnnotationComposer,
          $$EpisodeProgressTableCreateCompanionBuilder,
          $$EpisodeProgressTableUpdateCompanionBuilder,
          (
            EpisodeProgressData,
            BaseReferences<
              _$AppDatabase,
              $EpisodeProgressTable,
              EpisodeProgressData
            >,
          ),
          EpisodeProgressData,
          PrefetchHooks Function()
        > {
  $$EpisodeProgressTableTableManager(
    _$AppDatabase db,
    $EpisodeProgressTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EpisodeProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EpisodeProgressTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EpisodeProgressTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> tmdbId = const Value.absent(),
                Value<int> season = const Value.absent(),
                Value<int> episode = const Value.absent(),
                Value<DateTime> watchedAt = const Value.absent(),
              }) => EpisodeProgressCompanion(
                id: id,
                tmdbId: tmdbId,
                season: season,
                episode: episode,
                watchedAt: watchedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int tmdbId,
                required int season,
                required int episode,
                required DateTime watchedAt,
              }) => EpisodeProgressCompanion.insert(
                id: id,
                tmdbId: tmdbId,
                season: season,
                episode: episode,
                watchedAt: watchedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EpisodeProgressTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EpisodeProgressTable,
      EpisodeProgressData,
      $$EpisodeProgressTableFilterComposer,
      $$EpisodeProgressTableOrderingComposer,
      $$EpisodeProgressTableAnnotationComposer,
      $$EpisodeProgressTableCreateCompanionBuilder,
      $$EpisodeProgressTableUpdateCompanionBuilder,
      (
        EpisodeProgressData,
        BaseReferences<
          _$AppDatabase,
          $EpisodeProgressTable,
          EpisodeProgressData
        >,
      ),
      EpisodeProgressData,
      PrefetchHooks Function()
    >;
typedef $$DismissedTableCreateCompanionBuilder =
    DismissedCompanion Function({
      required int tmdbId,
      required MediaType mediaType,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$DismissedTableUpdateCompanionBuilder =
    DismissedCompanion Function({
      Value<int> tmdbId,
      Value<MediaType> mediaType,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$DismissedTableFilterComposer
    extends Composer<_$AppDatabase, $DismissedTable> {
  $$DismissedTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get tmdbId => $composableBuilder(
    column: $table.tmdbId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MediaType, MediaType, String> get mediaType =>
      $composableBuilder(
        column: $table.mediaType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DismissedTableOrderingComposer
    extends Composer<_$AppDatabase, $DismissedTable> {
  $$DismissedTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get tmdbId => $composableBuilder(
    column: $table.tmdbId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mediaType => $composableBuilder(
    column: $table.mediaType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DismissedTableAnnotationComposer
    extends Composer<_$AppDatabase, $DismissedTable> {
  $$DismissedTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get tmdbId =>
      $composableBuilder(column: $table.tmdbId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MediaType, String> get mediaType =>
      $composableBuilder(column: $table.mediaType, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DismissedTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DismissedTable,
          DismissedData,
          $$DismissedTableFilterComposer,
          $$DismissedTableOrderingComposer,
          $$DismissedTableAnnotationComposer,
          $$DismissedTableCreateCompanionBuilder,
          $$DismissedTableUpdateCompanionBuilder,
          (
            DismissedData,
            BaseReferences<_$AppDatabase, $DismissedTable, DismissedData>,
          ),
          DismissedData,
          PrefetchHooks Function()
        > {
  $$DismissedTableTableManager(_$AppDatabase db, $DismissedTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DismissedTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DismissedTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DismissedTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> tmdbId = const Value.absent(),
                Value<MediaType> mediaType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DismissedCompanion(
                tmdbId: tmdbId,
                mediaType: mediaType,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int tmdbId,
                required MediaType mediaType,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => DismissedCompanion.insert(
                tmdbId: tmdbId,
                mediaType: mediaType,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DismissedTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DismissedTable,
      DismissedData,
      $$DismissedTableFilterComposer,
      $$DismissedTableOrderingComposer,
      $$DismissedTableAnnotationComposer,
      $$DismissedTableCreateCompanionBuilder,
      $$DismissedTableUpdateCompanionBuilder,
      (
        DismissedData,
        BaseReferences<_$AppDatabase, $DismissedTable, DismissedData>,
      ),
      DismissedData,
      PrefetchHooks Function()
    >;
typedef $$UserListsTableCreateCompanionBuilder =
    UserListsCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> description,
      Value<int> sortOrder,
      Value<ListSortPreference> sortPreference,
      required DateTime createdAt,
    });
typedef $$UserListsTableUpdateCompanionBuilder =
    UserListsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> description,
      Value<int> sortOrder,
      Value<ListSortPreference> sortPreference,
      Value<DateTime> createdAt,
    });

final class $$UserListsTableReferences
    extends BaseReferences<_$AppDatabase, $UserListsTable, UserList> {
  $$UserListsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UserListItemsTable, List<UserListItem>>
  _userListItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userListItems,
    aliasName: 'user_lists__id__user_list_items__list_id',
  );

  $$UserListItemsTableProcessedTableManager get userListItemsRefs {
    final manager = $$UserListItemsTableTableManager(
      $_db,
      $_db.userListItems,
    ).filter((f) => f.listId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_userListItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UserListsTableFilterComposer
    extends Composer<_$AppDatabase, $UserListsTable> {
  $$UserListsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ListSortPreference, ListSortPreference, String>
  get sortPreference => $composableBuilder(
    column: $table.sortPreference,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> userListItemsRefs(
    Expression<bool> Function($$UserListItemsTableFilterComposer f) f,
  ) {
    final $$UserListItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userListItems,
      getReferencedColumn: (t) => t.listId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserListItemsTableFilterComposer(
            $db: $db,
            $table: $db.userListItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserListsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserListsTable> {
  $$UserListsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sortPreference => $composableBuilder(
    column: $table.sortPreference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserListsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserListsTable> {
  $$UserListsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ListSortPreference, String>
  get sortPreference => $composableBuilder(
    column: $table.sortPreference,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> userListItemsRefs<T extends Object>(
    Expression<T> Function($$UserListItemsTableAnnotationComposer a) f,
  ) {
    final $$UserListItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userListItems,
      getReferencedColumn: (t) => t.listId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserListItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.userListItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserListsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserListsTable,
          UserList,
          $$UserListsTableFilterComposer,
          $$UserListsTableOrderingComposer,
          $$UserListsTableAnnotationComposer,
          $$UserListsTableCreateCompanionBuilder,
          $$UserListsTableUpdateCompanionBuilder,
          (UserList, $$UserListsTableReferences),
          UserList,
          PrefetchHooks Function({bool userListItemsRefs})
        > {
  $$UserListsTableTableManager(_$AppDatabase db, $UserListsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserListsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserListsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserListsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<ListSortPreference> sortPreference = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => UserListsCompanion(
                id: id,
                name: name,
                description: description,
                sortOrder: sortOrder,
                sortPreference: sortPreference,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<ListSortPreference> sortPreference = const Value.absent(),
                required DateTime createdAt,
              }) => UserListsCompanion.insert(
                id: id,
                name: name,
                description: description,
                sortOrder: sortOrder,
                sortPreference: sortPreference,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserListsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userListItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (userListItemsRefs) db.userListItems,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (userListItemsRefs)
                    await $_getPrefetchedData<
                      UserList,
                      $UserListsTable,
                      UserListItem
                    >(
                      currentTable: table,
                      referencedTable: $$UserListsTableReferences
                          ._userListItemsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$UserListsTableReferences(
                            db,
                            table,
                            p0,
                          ).userListItemsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.listId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UserListsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserListsTable,
      UserList,
      $$UserListsTableFilterComposer,
      $$UserListsTableOrderingComposer,
      $$UserListsTableAnnotationComposer,
      $$UserListsTableCreateCompanionBuilder,
      $$UserListsTableUpdateCompanionBuilder,
      (UserList, $$UserListsTableReferences),
      UserList,
      PrefetchHooks Function({bool userListItemsRefs})
    >;
typedef $$UserListItemsTableCreateCompanionBuilder =
    UserListItemsCompanion Function({
      required int listId,
      required int tmdbId,
      required MediaType mediaType,
      required int position,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$UserListItemsTableUpdateCompanionBuilder =
    UserListItemsCompanion Function({
      Value<int> listId,
      Value<int> tmdbId,
      Value<MediaType> mediaType,
      Value<int> position,
      Value<String?> notes,
      Value<int> rowid,
    });

final class $$UserListItemsTableReferences
    extends BaseReferences<_$AppDatabase, $UserListItemsTable, UserListItem> {
  $$UserListItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UserListsTable _listIdTable(_$AppDatabase db) =>
      db.userLists.createAlias('user_list_items__list_id__user_lists__id');

  $$UserListsTableProcessedTableManager get listId {
    final $_column = $_itemColumn<int>('list_id')!;

    final manager = $$UserListsTableTableManager(
      $_db,
      $_db.userLists,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_listIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserListItemsTableFilterComposer
    extends Composer<_$AppDatabase, $UserListItemsTable> {
  $$UserListItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get tmdbId => $composableBuilder(
    column: $table.tmdbId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MediaType, MediaType, String> get mediaType =>
      $composableBuilder(
        column: $table.mediaType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$UserListsTableFilterComposer get listId {
    final $$UserListsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.listId,
      referencedTable: $db.userLists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserListsTableFilterComposer(
            $db: $db,
            $table: $db.userLists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserListItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserListItemsTable> {
  $$UserListItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get tmdbId => $composableBuilder(
    column: $table.tmdbId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mediaType => $composableBuilder(
    column: $table.mediaType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserListsTableOrderingComposer get listId {
    final $$UserListsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.listId,
      referencedTable: $db.userLists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserListsTableOrderingComposer(
            $db: $db,
            $table: $db.userLists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserListItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserListItemsTable> {
  $$UserListItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get tmdbId =>
      $composableBuilder(column: $table.tmdbId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MediaType, String> get mediaType =>
      $composableBuilder(column: $table.mediaType, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$UserListsTableAnnotationComposer get listId {
    final $$UserListsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.listId,
      referencedTable: $db.userLists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserListsTableAnnotationComposer(
            $db: $db,
            $table: $db.userLists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserListItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserListItemsTable,
          UserListItem,
          $$UserListItemsTableFilterComposer,
          $$UserListItemsTableOrderingComposer,
          $$UserListItemsTableAnnotationComposer,
          $$UserListItemsTableCreateCompanionBuilder,
          $$UserListItemsTableUpdateCompanionBuilder,
          (UserListItem, $$UserListItemsTableReferences),
          UserListItem,
          PrefetchHooks Function({bool listId})
        > {
  $$UserListItemsTableTableManager(_$AppDatabase db, $UserListItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserListItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserListItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserListItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> listId = const Value.absent(),
                Value<int> tmdbId = const Value.absent(),
                Value<MediaType> mediaType = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserListItemsCompanion(
                listId: listId,
                tmdbId: tmdbId,
                mediaType: mediaType,
                position: position,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int listId,
                required int tmdbId,
                required MediaType mediaType,
                required int position,
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserListItemsCompanion.insert(
                listId: listId,
                tmdbId: tmdbId,
                mediaType: mediaType,
                position: position,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserListItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({listId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (listId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.listId,
                                referencedTable: $$UserListItemsTableReferences
                                    ._listIdTable(db),
                                referencedColumn: $$UserListItemsTableReferences
                                    ._listIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UserListItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserListItemsTable,
      UserListItem,
      $$UserListItemsTableFilterComposer,
      $$UserListItemsTableOrderingComposer,
      $$UserListItemsTableAnnotationComposer,
      $$UserListItemsTableCreateCompanionBuilder,
      $$UserListItemsTableUpdateCompanionBuilder,
      (UserListItem, $$UserListItemsTableReferences),
      UserListItem,
      PrefetchHooks Function({bool listId})
    >;
typedef $$SwipesTableCreateCompanionBuilder =
    SwipesCompanion Function({
      Value<int> id,
      required int tmdbId,
      required MediaType mediaType,
      required SwipeDirection direction,
      required DeckMode deckMode,
      Value<int?> buddyId,
      required DateTime createdAt,
    });
typedef $$SwipesTableUpdateCompanionBuilder =
    SwipesCompanion Function({
      Value<int> id,
      Value<int> tmdbId,
      Value<MediaType> mediaType,
      Value<SwipeDirection> direction,
      Value<DeckMode> deckMode,
      Value<int?> buddyId,
      Value<DateTime> createdAt,
    });

class $$SwipesTableFilterComposer
    extends Composer<_$AppDatabase, $SwipesTable> {
  $$SwipesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tmdbId => $composableBuilder(
    column: $table.tmdbId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MediaType, MediaType, String> get mediaType =>
      $composableBuilder(
        column: $table.mediaType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<SwipeDirection, SwipeDirection, String>
  get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<DeckMode, DeckMode, String> get deckMode =>
      $composableBuilder(
        column: $table.deckMode,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get buddyId => $composableBuilder(
    column: $table.buddyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SwipesTableOrderingComposer
    extends Composer<_$AppDatabase, $SwipesTable> {
  $$SwipesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tmdbId => $composableBuilder(
    column: $table.tmdbId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mediaType => $composableBuilder(
    column: $table.mediaType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deckMode => $composableBuilder(
    column: $table.deckMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get buddyId => $composableBuilder(
    column: $table.buddyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SwipesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SwipesTable> {
  $$SwipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get tmdbId =>
      $composableBuilder(column: $table.tmdbId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MediaType, String> get mediaType =>
      $composableBuilder(column: $table.mediaType, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SwipeDirection, String> get direction =>
      $composableBuilder(column: $table.direction, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DeckMode, String> get deckMode =>
      $composableBuilder(column: $table.deckMode, builder: (column) => column);

  GeneratedColumn<int> get buddyId =>
      $composableBuilder(column: $table.buddyId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SwipesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SwipesTable,
          Swipe,
          $$SwipesTableFilterComposer,
          $$SwipesTableOrderingComposer,
          $$SwipesTableAnnotationComposer,
          $$SwipesTableCreateCompanionBuilder,
          $$SwipesTableUpdateCompanionBuilder,
          (Swipe, BaseReferences<_$AppDatabase, $SwipesTable, Swipe>),
          Swipe,
          PrefetchHooks Function()
        > {
  $$SwipesTableTableManager(_$AppDatabase db, $SwipesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SwipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SwipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SwipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> tmdbId = const Value.absent(),
                Value<MediaType> mediaType = const Value.absent(),
                Value<SwipeDirection> direction = const Value.absent(),
                Value<DeckMode> deckMode = const Value.absent(),
                Value<int?> buddyId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SwipesCompanion(
                id: id,
                tmdbId: tmdbId,
                mediaType: mediaType,
                direction: direction,
                deckMode: deckMode,
                buddyId: buddyId,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int tmdbId,
                required MediaType mediaType,
                required SwipeDirection direction,
                required DeckMode deckMode,
                Value<int?> buddyId = const Value.absent(),
                required DateTime createdAt,
              }) => SwipesCompanion.insert(
                id: id,
                tmdbId: tmdbId,
                mediaType: mediaType,
                direction: direction,
                deckMode: deckMode,
                buddyId: buddyId,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SwipesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SwipesTable,
      Swipe,
      $$SwipesTableFilterComposer,
      $$SwipesTableOrderingComposer,
      $$SwipesTableAnnotationComposer,
      $$SwipesTableCreateCompanionBuilder,
      $$SwipesTableUpdateCompanionBuilder,
      (Swipe, BaseReferences<_$AppDatabase, $SwipesTable, Swipe>),
      Swipe,
      PrefetchHooks Function()
    >;
typedef $$BuddiesTableCreateCompanionBuilder =
    BuddiesCompanion Function({
      Value<int> id,
      required String displayName,
      required String roomId,
      required String keyRef,
      required DateTime createdAt,
      Value<DateTime?> lastSyncedAt,
    });
typedef $$BuddiesTableUpdateCompanionBuilder =
    BuddiesCompanion Function({
      Value<int> id,
      Value<String> displayName,
      Value<String> roomId,
      Value<String> keyRef,
      Value<DateTime> createdAt,
      Value<DateTime?> lastSyncedAt,
    });

final class $$BuddiesTableReferences
    extends BaseReferences<_$AppDatabase, $BuddiesTable, Buddy> {
  $$BuddiesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BuddyExclusionsTable, List<BuddyExclusion>>
  _buddyExclusionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.buddyExclusions,
    aliasName: 'buddies__id__buddy_exclusions__buddy_id',
  );

  $$BuddyExclusionsTableProcessedTableManager get buddyExclusionsRefs {
    final manager = $$BuddyExclusionsTableTableManager(
      $_db,
      $_db.buddyExclusions,
    ).filter((f) => f.buddyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _buddyExclusionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BuddyRightSwipesTable, List<BuddyRightSwipe>>
  _buddyRightSwipesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.buddyRightSwipes,
    aliasName: 'buddies__id__buddy_right_swipes__buddy_id',
  );

  $$BuddyRightSwipesTableProcessedTableManager get buddyRightSwipesRefs {
    final manager = $$BuddyRightSwipesTableTableManager(
      $_db,
      $_db.buddyRightSwipes,
    ).filter((f) => f.buddyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _buddyRightSwipesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MatchesTable, List<Matche>> _matchesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.matches,
    aliasName: 'buddies__id__matches__buddy_id',
  );

  $$MatchesTableProcessedTableManager get matchesRefs {
    final manager = $$MatchesTableTableManager(
      $_db,
      $_db.matches,
    ).filter((f) => f.buddyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_matchesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BuddiesTableFilterComposer
    extends Composer<_$AppDatabase, $BuddiesTable> {
  $$BuddiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roomId => $composableBuilder(
    column: $table.roomId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get keyRef => $composableBuilder(
    column: $table.keyRef,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> buddyExclusionsRefs(
    Expression<bool> Function($$BuddyExclusionsTableFilterComposer f) f,
  ) {
    final $$BuddyExclusionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.buddyExclusions,
      getReferencedColumn: (t) => t.buddyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BuddyExclusionsTableFilterComposer(
            $db: $db,
            $table: $db.buddyExclusions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> buddyRightSwipesRefs(
    Expression<bool> Function($$BuddyRightSwipesTableFilterComposer f) f,
  ) {
    final $$BuddyRightSwipesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.buddyRightSwipes,
      getReferencedColumn: (t) => t.buddyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BuddyRightSwipesTableFilterComposer(
            $db: $db,
            $table: $db.buddyRightSwipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> matchesRefs(
    Expression<bool> Function($$MatchesTableFilterComposer f) f,
  ) {
    final $$MatchesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.matches,
      getReferencedColumn: (t) => t.buddyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MatchesTableFilterComposer(
            $db: $db,
            $table: $db.matches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BuddiesTableOrderingComposer
    extends Composer<_$AppDatabase, $BuddiesTable> {
  $$BuddiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roomId => $composableBuilder(
    column: $table.roomId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get keyRef => $composableBuilder(
    column: $table.keyRef,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BuddiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BuddiesTable> {
  $$BuddiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get roomId =>
      $composableBuilder(column: $table.roomId, builder: (column) => column);

  GeneratedColumn<String> get keyRef =>
      $composableBuilder(column: $table.keyRef, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => column,
  );

  Expression<T> buddyExclusionsRefs<T extends Object>(
    Expression<T> Function($$BuddyExclusionsTableAnnotationComposer a) f,
  ) {
    final $$BuddyExclusionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.buddyExclusions,
      getReferencedColumn: (t) => t.buddyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BuddyExclusionsTableAnnotationComposer(
            $db: $db,
            $table: $db.buddyExclusions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> buddyRightSwipesRefs<T extends Object>(
    Expression<T> Function($$BuddyRightSwipesTableAnnotationComposer a) f,
  ) {
    final $$BuddyRightSwipesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.buddyRightSwipes,
      getReferencedColumn: (t) => t.buddyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BuddyRightSwipesTableAnnotationComposer(
            $db: $db,
            $table: $db.buddyRightSwipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> matchesRefs<T extends Object>(
    Expression<T> Function($$MatchesTableAnnotationComposer a) f,
  ) {
    final $$MatchesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.matches,
      getReferencedColumn: (t) => t.buddyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MatchesTableAnnotationComposer(
            $db: $db,
            $table: $db.matches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BuddiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BuddiesTable,
          Buddy,
          $$BuddiesTableFilterComposer,
          $$BuddiesTableOrderingComposer,
          $$BuddiesTableAnnotationComposer,
          $$BuddiesTableCreateCompanionBuilder,
          $$BuddiesTableUpdateCompanionBuilder,
          (Buddy, $$BuddiesTableReferences),
          Buddy,
          PrefetchHooks Function({
            bool buddyExclusionsRefs,
            bool buddyRightSwipesRefs,
            bool matchesRefs,
          })
        > {
  $$BuddiesTableTableManager(_$AppDatabase db, $BuddiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BuddiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BuddiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BuddiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String> roomId = const Value.absent(),
                Value<String> keyRef = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastSyncedAt = const Value.absent(),
              }) => BuddiesCompanion(
                id: id,
                displayName: displayName,
                roomId: roomId,
                keyRef: keyRef,
                createdAt: createdAt,
                lastSyncedAt: lastSyncedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String displayName,
                required String roomId,
                required String keyRef,
                required DateTime createdAt,
                Value<DateTime?> lastSyncedAt = const Value.absent(),
              }) => BuddiesCompanion.insert(
                id: id,
                displayName: displayName,
                roomId: roomId,
                keyRef: keyRef,
                createdAt: createdAt,
                lastSyncedAt: lastSyncedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BuddiesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                buddyExclusionsRefs = false,
                buddyRightSwipesRefs = false,
                matchesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (buddyExclusionsRefs) db.buddyExclusions,
                    if (buddyRightSwipesRefs) db.buddyRightSwipes,
                    if (matchesRefs) db.matches,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (buddyExclusionsRefs)
                        await $_getPrefetchedData<
                          Buddy,
                          $BuddiesTable,
                          BuddyExclusion
                        >(
                          currentTable: table,
                          referencedTable: $$BuddiesTableReferences
                              ._buddyExclusionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BuddiesTableReferences(
                                db,
                                table,
                                p0,
                              ).buddyExclusionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.buddyId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (buddyRightSwipesRefs)
                        await $_getPrefetchedData<
                          Buddy,
                          $BuddiesTable,
                          BuddyRightSwipe
                        >(
                          currentTable: table,
                          referencedTable: $$BuddiesTableReferences
                              ._buddyRightSwipesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BuddiesTableReferences(
                                db,
                                table,
                                p0,
                              ).buddyRightSwipesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.buddyId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (matchesRefs)
                        await $_getPrefetchedData<Buddy, $BuddiesTable, Matche>(
                          currentTable: table,
                          referencedTable: $$BuddiesTableReferences
                              ._matchesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BuddiesTableReferences(
                                db,
                                table,
                                p0,
                              ).matchesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.buddyId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$BuddiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BuddiesTable,
      Buddy,
      $$BuddiesTableFilterComposer,
      $$BuddiesTableOrderingComposer,
      $$BuddiesTableAnnotationComposer,
      $$BuddiesTableCreateCompanionBuilder,
      $$BuddiesTableUpdateCompanionBuilder,
      (Buddy, $$BuddiesTableReferences),
      Buddy,
      PrefetchHooks Function({
        bool buddyExclusionsRefs,
        bool buddyRightSwipesRefs,
        bool matchesRefs,
      })
    >;
typedef $$BuddyExclusionsTableCreateCompanionBuilder =
    BuddyExclusionsCompanion Function({
      required int buddyId,
      required String hash,
      Value<int> rowid,
    });
typedef $$BuddyExclusionsTableUpdateCompanionBuilder =
    BuddyExclusionsCompanion Function({
      Value<int> buddyId,
      Value<String> hash,
      Value<int> rowid,
    });

final class $$BuddyExclusionsTableReferences
    extends
        BaseReferences<_$AppDatabase, $BuddyExclusionsTable, BuddyExclusion> {
  $$BuddyExclusionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $BuddiesTable _buddyIdTable(_$AppDatabase db) =>
      db.buddies.createAlias('buddy_exclusions__buddy_id__buddies__id');

  $$BuddiesTableProcessedTableManager get buddyId {
    final $_column = $_itemColumn<int>('buddy_id')!;

    final manager = $$BuddiesTableTableManager(
      $_db,
      $_db.buddies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_buddyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BuddyExclusionsTableFilterComposer
    extends Composer<_$AppDatabase, $BuddyExclusionsTable> {
  $$BuddyExclusionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get hash => $composableBuilder(
    column: $table.hash,
    builder: (column) => ColumnFilters(column),
  );

  $$BuddiesTableFilterComposer get buddyId {
    final $$BuddiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.buddyId,
      referencedTable: $db.buddies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BuddiesTableFilterComposer(
            $db: $db,
            $table: $db.buddies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BuddyExclusionsTableOrderingComposer
    extends Composer<_$AppDatabase, $BuddyExclusionsTable> {
  $$BuddyExclusionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get hash => $composableBuilder(
    column: $table.hash,
    builder: (column) => ColumnOrderings(column),
  );

  $$BuddiesTableOrderingComposer get buddyId {
    final $$BuddiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.buddyId,
      referencedTable: $db.buddies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BuddiesTableOrderingComposer(
            $db: $db,
            $table: $db.buddies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BuddyExclusionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BuddyExclusionsTable> {
  $$BuddyExclusionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get hash =>
      $composableBuilder(column: $table.hash, builder: (column) => column);

  $$BuddiesTableAnnotationComposer get buddyId {
    final $$BuddiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.buddyId,
      referencedTable: $db.buddies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BuddiesTableAnnotationComposer(
            $db: $db,
            $table: $db.buddies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BuddyExclusionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BuddyExclusionsTable,
          BuddyExclusion,
          $$BuddyExclusionsTableFilterComposer,
          $$BuddyExclusionsTableOrderingComposer,
          $$BuddyExclusionsTableAnnotationComposer,
          $$BuddyExclusionsTableCreateCompanionBuilder,
          $$BuddyExclusionsTableUpdateCompanionBuilder,
          (BuddyExclusion, $$BuddyExclusionsTableReferences),
          BuddyExclusion,
          PrefetchHooks Function({bool buddyId})
        > {
  $$BuddyExclusionsTableTableManager(
    _$AppDatabase db,
    $BuddyExclusionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BuddyExclusionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BuddyExclusionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BuddyExclusionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> buddyId = const Value.absent(),
                Value<String> hash = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BuddyExclusionsCompanion(
                buddyId: buddyId,
                hash: hash,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int buddyId,
                required String hash,
                Value<int> rowid = const Value.absent(),
              }) => BuddyExclusionsCompanion.insert(
                buddyId: buddyId,
                hash: hash,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BuddyExclusionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({buddyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (buddyId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.buddyId,
                                referencedTable:
                                    $$BuddyExclusionsTableReferences
                                        ._buddyIdTable(db),
                                referencedColumn:
                                    $$BuddyExclusionsTableReferences
                                        ._buddyIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BuddyExclusionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BuddyExclusionsTable,
      BuddyExclusion,
      $$BuddyExclusionsTableFilterComposer,
      $$BuddyExclusionsTableOrderingComposer,
      $$BuddyExclusionsTableAnnotationComposer,
      $$BuddyExclusionsTableCreateCompanionBuilder,
      $$BuddyExclusionsTableUpdateCompanionBuilder,
      (BuddyExclusion, $$BuddyExclusionsTableReferences),
      BuddyExclusion,
      PrefetchHooks Function({bool buddyId})
    >;
typedef $$BuddyRightSwipesTableCreateCompanionBuilder =
    BuddyRightSwipesCompanion Function({
      required int buddyId,
      required int tmdbId,
      required MediaType mediaType,
      Value<int> rowid,
    });
typedef $$BuddyRightSwipesTableUpdateCompanionBuilder =
    BuddyRightSwipesCompanion Function({
      Value<int> buddyId,
      Value<int> tmdbId,
      Value<MediaType> mediaType,
      Value<int> rowid,
    });

final class $$BuddyRightSwipesTableReferences
    extends
        BaseReferences<_$AppDatabase, $BuddyRightSwipesTable, BuddyRightSwipe> {
  $$BuddyRightSwipesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $BuddiesTable _buddyIdTable(_$AppDatabase db) =>
      db.buddies.createAlias('buddy_right_swipes__buddy_id__buddies__id');

  $$BuddiesTableProcessedTableManager get buddyId {
    final $_column = $_itemColumn<int>('buddy_id')!;

    final manager = $$BuddiesTableTableManager(
      $_db,
      $_db.buddies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_buddyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BuddyRightSwipesTableFilterComposer
    extends Composer<_$AppDatabase, $BuddyRightSwipesTable> {
  $$BuddyRightSwipesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get tmdbId => $composableBuilder(
    column: $table.tmdbId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MediaType, MediaType, String> get mediaType =>
      $composableBuilder(
        column: $table.mediaType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  $$BuddiesTableFilterComposer get buddyId {
    final $$BuddiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.buddyId,
      referencedTable: $db.buddies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BuddiesTableFilterComposer(
            $db: $db,
            $table: $db.buddies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BuddyRightSwipesTableOrderingComposer
    extends Composer<_$AppDatabase, $BuddyRightSwipesTable> {
  $$BuddyRightSwipesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get tmdbId => $composableBuilder(
    column: $table.tmdbId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mediaType => $composableBuilder(
    column: $table.mediaType,
    builder: (column) => ColumnOrderings(column),
  );

  $$BuddiesTableOrderingComposer get buddyId {
    final $$BuddiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.buddyId,
      referencedTable: $db.buddies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BuddiesTableOrderingComposer(
            $db: $db,
            $table: $db.buddies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BuddyRightSwipesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BuddyRightSwipesTable> {
  $$BuddyRightSwipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get tmdbId =>
      $composableBuilder(column: $table.tmdbId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MediaType, String> get mediaType =>
      $composableBuilder(column: $table.mediaType, builder: (column) => column);

  $$BuddiesTableAnnotationComposer get buddyId {
    final $$BuddiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.buddyId,
      referencedTable: $db.buddies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BuddiesTableAnnotationComposer(
            $db: $db,
            $table: $db.buddies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BuddyRightSwipesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BuddyRightSwipesTable,
          BuddyRightSwipe,
          $$BuddyRightSwipesTableFilterComposer,
          $$BuddyRightSwipesTableOrderingComposer,
          $$BuddyRightSwipesTableAnnotationComposer,
          $$BuddyRightSwipesTableCreateCompanionBuilder,
          $$BuddyRightSwipesTableUpdateCompanionBuilder,
          (BuddyRightSwipe, $$BuddyRightSwipesTableReferences),
          BuddyRightSwipe,
          PrefetchHooks Function({bool buddyId})
        > {
  $$BuddyRightSwipesTableTableManager(
    _$AppDatabase db,
    $BuddyRightSwipesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BuddyRightSwipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BuddyRightSwipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BuddyRightSwipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> buddyId = const Value.absent(),
                Value<int> tmdbId = const Value.absent(),
                Value<MediaType> mediaType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BuddyRightSwipesCompanion(
                buddyId: buddyId,
                tmdbId: tmdbId,
                mediaType: mediaType,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int buddyId,
                required int tmdbId,
                required MediaType mediaType,
                Value<int> rowid = const Value.absent(),
              }) => BuddyRightSwipesCompanion.insert(
                buddyId: buddyId,
                tmdbId: tmdbId,
                mediaType: mediaType,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BuddyRightSwipesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({buddyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (buddyId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.buddyId,
                                referencedTable:
                                    $$BuddyRightSwipesTableReferences
                                        ._buddyIdTable(db),
                                referencedColumn:
                                    $$BuddyRightSwipesTableReferences
                                        ._buddyIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BuddyRightSwipesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BuddyRightSwipesTable,
      BuddyRightSwipe,
      $$BuddyRightSwipesTableFilterComposer,
      $$BuddyRightSwipesTableOrderingComposer,
      $$BuddyRightSwipesTableAnnotationComposer,
      $$BuddyRightSwipesTableCreateCompanionBuilder,
      $$BuddyRightSwipesTableUpdateCompanionBuilder,
      (BuddyRightSwipe, $$BuddyRightSwipesTableReferences),
      BuddyRightSwipe,
      PrefetchHooks Function({bool buddyId})
    >;
typedef $$MatchesTableCreateCompanionBuilder =
    MatchesCompanion Function({
      Value<int> id,
      required int buddyId,
      required int tmdbId,
      required MediaType mediaType,
      required DateTime matchedAt,
      Value<bool> dismissed,
    });
typedef $$MatchesTableUpdateCompanionBuilder =
    MatchesCompanion Function({
      Value<int> id,
      Value<int> buddyId,
      Value<int> tmdbId,
      Value<MediaType> mediaType,
      Value<DateTime> matchedAt,
      Value<bool> dismissed,
    });

final class $$MatchesTableReferences
    extends BaseReferences<_$AppDatabase, $MatchesTable, Matche> {
  $$MatchesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BuddiesTable _buddyIdTable(_$AppDatabase db) =>
      db.buddies.createAlias('matches__buddy_id__buddies__id');

  $$BuddiesTableProcessedTableManager get buddyId {
    final $_column = $_itemColumn<int>('buddy_id')!;

    final manager = $$BuddiesTableTableManager(
      $_db,
      $_db.buddies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_buddyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MatchesTableFilterComposer
    extends Composer<_$AppDatabase, $MatchesTable> {
  $$MatchesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tmdbId => $composableBuilder(
    column: $table.tmdbId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MediaType, MediaType, String> get mediaType =>
      $composableBuilder(
        column: $table.mediaType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get matchedAt => $composableBuilder(
    column: $table.matchedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get dismissed => $composableBuilder(
    column: $table.dismissed,
    builder: (column) => ColumnFilters(column),
  );

  $$BuddiesTableFilterComposer get buddyId {
    final $$BuddiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.buddyId,
      referencedTable: $db.buddies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BuddiesTableFilterComposer(
            $db: $db,
            $table: $db.buddies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MatchesTableOrderingComposer
    extends Composer<_$AppDatabase, $MatchesTable> {
  $$MatchesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tmdbId => $composableBuilder(
    column: $table.tmdbId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mediaType => $composableBuilder(
    column: $table.mediaType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get matchedAt => $composableBuilder(
    column: $table.matchedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get dismissed => $composableBuilder(
    column: $table.dismissed,
    builder: (column) => ColumnOrderings(column),
  );

  $$BuddiesTableOrderingComposer get buddyId {
    final $$BuddiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.buddyId,
      referencedTable: $db.buddies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BuddiesTableOrderingComposer(
            $db: $db,
            $table: $db.buddies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MatchesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MatchesTable> {
  $$MatchesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get tmdbId =>
      $composableBuilder(column: $table.tmdbId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MediaType, String> get mediaType =>
      $composableBuilder(column: $table.mediaType, builder: (column) => column);

  GeneratedColumn<DateTime> get matchedAt =>
      $composableBuilder(column: $table.matchedAt, builder: (column) => column);

  GeneratedColumn<bool> get dismissed =>
      $composableBuilder(column: $table.dismissed, builder: (column) => column);

  $$BuddiesTableAnnotationComposer get buddyId {
    final $$BuddiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.buddyId,
      referencedTable: $db.buddies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BuddiesTableAnnotationComposer(
            $db: $db,
            $table: $db.buddies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MatchesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MatchesTable,
          Matche,
          $$MatchesTableFilterComposer,
          $$MatchesTableOrderingComposer,
          $$MatchesTableAnnotationComposer,
          $$MatchesTableCreateCompanionBuilder,
          $$MatchesTableUpdateCompanionBuilder,
          (Matche, $$MatchesTableReferences),
          Matche,
          PrefetchHooks Function({bool buddyId})
        > {
  $$MatchesTableTableManager(_$AppDatabase db, $MatchesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MatchesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MatchesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MatchesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> buddyId = const Value.absent(),
                Value<int> tmdbId = const Value.absent(),
                Value<MediaType> mediaType = const Value.absent(),
                Value<DateTime> matchedAt = const Value.absent(),
                Value<bool> dismissed = const Value.absent(),
              }) => MatchesCompanion(
                id: id,
                buddyId: buddyId,
                tmdbId: tmdbId,
                mediaType: mediaType,
                matchedAt: matchedAt,
                dismissed: dismissed,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int buddyId,
                required int tmdbId,
                required MediaType mediaType,
                required DateTime matchedAt,
                Value<bool> dismissed = const Value.absent(),
              }) => MatchesCompanion.insert(
                id: id,
                buddyId: buddyId,
                tmdbId: tmdbId,
                mediaType: mediaType,
                matchedAt: matchedAt,
                dismissed: dismissed,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MatchesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({buddyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (buddyId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.buddyId,
                                referencedTable: $$MatchesTableReferences
                                    ._buddyIdTable(db),
                                referencedColumn: $$MatchesTableReferences
                                    ._buddyIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MatchesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MatchesTable,
      Matche,
      $$MatchesTableFilterComposer,
      $$MatchesTableOrderingComposer,
      $$MatchesTableAnnotationComposer,
      $$MatchesTableCreateCompanionBuilder,
      $$MatchesTableUpdateCompanionBuilder,
      (Matche, $$MatchesTableReferences),
      Matche,
      PrefetchHooks Function({bool buddyId})
    >;
typedef $$PreferencesTableCreateCompanionBuilder =
    PreferencesCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$PreferencesTableUpdateCompanionBuilder =
    PreferencesCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$PreferencesTableFilterComposer
    extends Composer<_$AppDatabase, $PreferencesTable> {
  $$PreferencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PreferencesTableOrderingComposer
    extends Composer<_$AppDatabase, $PreferencesTable> {
  $$PreferencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PreferencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PreferencesTable> {
  $$PreferencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$PreferencesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PreferencesTable,
          Preference,
          $$PreferencesTableFilterComposer,
          $$PreferencesTableOrderingComposer,
          $$PreferencesTableAnnotationComposer,
          $$PreferencesTableCreateCompanionBuilder,
          $$PreferencesTableUpdateCompanionBuilder,
          (
            Preference,
            BaseReferences<_$AppDatabase, $PreferencesTable, Preference>,
          ),
          Preference,
          PrefetchHooks Function()
        > {
  $$PreferencesTableTableManager(_$AppDatabase db, $PreferencesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PreferencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PreferencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PreferencesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PreferencesCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => PreferencesCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PreferencesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PreferencesTable,
      Preference,
      $$PreferencesTableFilterComposer,
      $$PreferencesTableOrderingComposer,
      $$PreferencesTableAnnotationComposer,
      $$PreferencesTableCreateCompanionBuilder,
      $$PreferencesTableUpdateCompanionBuilder,
      (
        Preference,
        BaseReferences<_$AppDatabase, $PreferencesTable, Preference>,
      ),
      Preference,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TitlesTableTableManager get titles =>
      $$TitlesTableTableManager(_db, _db.titles);
  $$LibraryEntriesTableTableManager get libraryEntries =>
      $$LibraryEntriesTableTableManager(_db, _db.libraryEntries);
  $$EpisodeProgressTableTableManager get episodeProgress =>
      $$EpisodeProgressTableTableManager(_db, _db.episodeProgress);
  $$DismissedTableTableManager get dismissed =>
      $$DismissedTableTableManager(_db, _db.dismissed);
  $$UserListsTableTableManager get userLists =>
      $$UserListsTableTableManager(_db, _db.userLists);
  $$UserListItemsTableTableManager get userListItems =>
      $$UserListItemsTableTableManager(_db, _db.userListItems);
  $$SwipesTableTableManager get swipes =>
      $$SwipesTableTableManager(_db, _db.swipes);
  $$BuddiesTableTableManager get buddies =>
      $$BuddiesTableTableManager(_db, _db.buddies);
  $$BuddyExclusionsTableTableManager get buddyExclusions =>
      $$BuddyExclusionsTableTableManager(_db, _db.buddyExclusions);
  $$BuddyRightSwipesTableTableManager get buddyRightSwipes =>
      $$BuddyRightSwipesTableTableManager(_db, _db.buddyRightSwipes);
  $$MatchesTableTableManager get matches =>
      $$MatchesTableTableManager(_db, _db.matches);
  $$PreferencesTableTableManager get preferences =>
      $$PreferencesTableTableManager(_db, _db.preferences);
}
