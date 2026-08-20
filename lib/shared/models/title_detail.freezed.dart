// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'title_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TitleDetail {

 int get id; MediaType get mediaType; String get title; String get overview; String? get posterPath; String? get backdropPath; double get voteAverage; String? get releaseDate; String? get tagline; int? get runtime;/// Age certification for the user's region (e.g. "PG-13", "TV-MA"), if TMDB
/// has one. From `release_dates` (movie) / `content_ratings` (tv).
 String? get certification;/// IMDb id (e.g. "tt0133093") from `external_ids`, for a "View on IMDb"
/// link — and the exact-match key used by the Phase 4 CSV importers.
 String? get imdbId; List<Genre> get genres; List<CastMember> get cast; List<Video> get videos; List<WatchProvider> get watchProviders; List<TitleSummary> get recommendations; List<TitleSummary> get similar; List<String> get keywords;/// TV only. Present in the base `/tv/{id}` payload with no extra request,
/// so it costs nothing to carry even when unused.
 List<TvSeason> get seasons;
/// Create a copy of TitleDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TitleDetailCopyWith<TitleDetail> get copyWith => _$TitleDetailCopyWithImpl<TitleDetail>(this as TitleDetail, _$identity);

  /// Serializes this TitleDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TitleDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.title, title) || other.title == title)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.certification, certification) || other.certification == certification)&&(identical(other.imdbId, imdbId) || other.imdbId == imdbId)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.cast, cast)&&const DeepCollectionEquality().equals(other.videos, videos)&&const DeepCollectionEquality().equals(other.watchProviders, watchProviders)&&const DeepCollectionEquality().equals(other.recommendations, recommendations)&&const DeepCollectionEquality().equals(other.similar, similar)&&const DeepCollectionEquality().equals(other.keywords, keywords)&&const DeepCollectionEquality().equals(other.seasons, seasons));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,mediaType,title,overview,posterPath,backdropPath,voteAverage,releaseDate,tagline,runtime,certification,imdbId,const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(cast),const DeepCollectionEquality().hash(videos),const DeepCollectionEquality().hash(watchProviders),const DeepCollectionEquality().hash(recommendations),const DeepCollectionEquality().hash(similar),const DeepCollectionEquality().hash(keywords),const DeepCollectionEquality().hash(seasons)]);

@override
String toString() {
  return 'TitleDetail(id: $id, mediaType: $mediaType, title: $title, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, voteAverage: $voteAverage, releaseDate: $releaseDate, tagline: $tagline, runtime: $runtime, certification: $certification, imdbId: $imdbId, genres: $genres, cast: $cast, videos: $videos, watchProviders: $watchProviders, recommendations: $recommendations, similar: $similar, keywords: $keywords, seasons: $seasons)';
}


}

/// @nodoc
abstract mixin class $TitleDetailCopyWith<$Res>  {
  factory $TitleDetailCopyWith(TitleDetail value, $Res Function(TitleDetail) _then) = _$TitleDetailCopyWithImpl;
@useResult
$Res call({
 int id, MediaType mediaType, String title, String overview, String? posterPath, String? backdropPath, double voteAverage, String? releaseDate, String? tagline, int? runtime, String? certification, String? imdbId, List<Genre> genres, List<CastMember> cast, List<Video> videos, List<WatchProvider> watchProviders, List<TitleSummary> recommendations, List<TitleSummary> similar, List<String> keywords, List<TvSeason> seasons
});




}
/// @nodoc
class _$TitleDetailCopyWithImpl<$Res>
    implements $TitleDetailCopyWith<$Res> {
  _$TitleDetailCopyWithImpl(this._self, this._then);

  final TitleDetail _self;
  final $Res Function(TitleDetail) _then;

/// Create a copy of TitleDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mediaType = null,Object? title = null,Object? overview = null,Object? posterPath = freezed,Object? backdropPath = freezed,Object? voteAverage = null,Object? releaseDate = freezed,Object? tagline = freezed,Object? runtime = freezed,Object? certification = freezed,Object? imdbId = freezed,Object? genres = null,Object? cast = null,Object? videos = null,Object? watchProviders = null,Object? recommendations = null,Object? similar = null,Object? keywords = null,Object? seasons = null,}) {
  return _then(TitleDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MediaType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,tagline: freezed == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String?,runtime: freezed == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int?,certification: freezed == certification ? _self.certification : certification // ignore: cast_nullable_to_non_nullable
as String?,imdbId: freezed == imdbId ? _self.imdbId : imdbId // ignore: cast_nullable_to_non_nullable
as String?,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>,cast: null == cast ? _self.cast : cast // ignore: cast_nullable_to_non_nullable
as List<CastMember>,videos: null == videos ? _self.videos : videos // ignore: cast_nullable_to_non_nullable
as List<Video>,watchProviders: null == watchProviders ? _self.watchProviders : watchProviders // ignore: cast_nullable_to_non_nullable
as List<WatchProvider>,recommendations: null == recommendations ? _self.recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as List<TitleSummary>,similar: null == similar ? _self.similar : similar // ignore: cast_nullable_to_non_nullable
as List<TitleSummary>,keywords: null == keywords ? _self.keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>,seasons: null == seasons ? _self.seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<TvSeason>,
  ));
}

}


/// Adds pattern-matching-related methods to [TitleDetail].
extension TitleDetailPatterns on TitleDetail {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TitleDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TitleDetail() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TitleDetail value)  $default,){
final _that = this;
switch (_that) {
case _TitleDetail():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TitleDetail value)?  $default,){
final _that = this;
switch (_that) {
case _TitleDetail() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  MediaType mediaType,  String title,  String overview,  String? posterPath,  String? backdropPath,  double voteAverage,  String? releaseDate,  String? tagline,  int? runtime,  String? certification,  String? imdbId,  List<Genre> genres,  List<CastMember> cast,  List<Video> videos,  List<WatchProvider> watchProviders,  List<TitleSummary> recommendations,  List<TitleSummary> similar,  List<String> keywords,  List<TvSeason> seasons)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TitleDetail() when $default != null:
return $default(_that.id,_that.mediaType,_that.title,_that.overview,_that.posterPath,_that.backdropPath,_that.voteAverage,_that.releaseDate,_that.tagline,_that.runtime,_that.certification,_that.imdbId,_that.genres,_that.cast,_that.videos,_that.watchProviders,_that.recommendations,_that.similar,_that.keywords,_that.seasons);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  MediaType mediaType,  String title,  String overview,  String? posterPath,  String? backdropPath,  double voteAverage,  String? releaseDate,  String? tagline,  int? runtime,  String? certification,  String? imdbId,  List<Genre> genres,  List<CastMember> cast,  List<Video> videos,  List<WatchProvider> watchProviders,  List<TitleSummary> recommendations,  List<TitleSummary> similar,  List<String> keywords,  List<TvSeason> seasons)  $default,) {final _that = this;
switch (_that) {
case _TitleDetail():
return $default(_that.id,_that.mediaType,_that.title,_that.overview,_that.posterPath,_that.backdropPath,_that.voteAverage,_that.releaseDate,_that.tagline,_that.runtime,_that.certification,_that.imdbId,_that.genres,_that.cast,_that.videos,_that.watchProviders,_that.recommendations,_that.similar,_that.keywords,_that.seasons);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  MediaType mediaType,  String title,  String overview,  String? posterPath,  String? backdropPath,  double voteAverage,  String? releaseDate,  String? tagline,  int? runtime,  String? certification,  String? imdbId,  List<Genre> genres,  List<CastMember> cast,  List<Video> videos,  List<WatchProvider> watchProviders,  List<TitleSummary> recommendations,  List<TitleSummary> similar,  List<String> keywords,  List<TvSeason> seasons)?  $default,) {final _that = this;
switch (_that) {
case _TitleDetail() when $default != null:
return $default(_that.id,_that.mediaType,_that.title,_that.overview,_that.posterPath,_that.backdropPath,_that.voteAverage,_that.releaseDate,_that.tagline,_that.runtime,_that.certification,_that.imdbId,_that.genres,_that.cast,_that.videos,_that.watchProviders,_that.recommendations,_that.similar,_that.keywords,_that.seasons);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TitleDetail extends TitleDetail {
  const _TitleDetail({required this.id, required this.mediaType, required this.title, this.overview = '', this.posterPath, this.backdropPath, this.voteAverage = 0, this.releaseDate, this.tagline, this.runtime, this.certification, this.imdbId,  List<Genre> genres = const <Genre>[],  List<CastMember> cast = const <CastMember>[],  List<Video> videos = const <Video>[],  List<WatchProvider> watchProviders = const <WatchProvider>[],  List<TitleSummary> recommendations = const <TitleSummary>[],  List<TitleSummary> similar = const <TitleSummary>[],  List<String> keywords = const <String>[],  List<TvSeason> seasons = const <TvSeason>[]}): _genres = genres,_cast = cast,_videos = videos,_watchProviders = watchProviders,_recommendations = recommendations,_similar = similar,_keywords = keywords,_seasons = seasons,super._();
  factory _TitleDetail.fromJson(Map<String, dynamic> json) => _$TitleDetailFromJson(json);

@override final  int id;
@override final  MediaType mediaType;
@override final  String title;
@override@JsonKey() final  String overview;
@override final  String? posterPath;
@override final  String? backdropPath;
@override@JsonKey() final  double voteAverage;
@override final  String? releaseDate;
@override final  String? tagline;
@override final  int? runtime;
/// Age certification for the user's region (e.g. "PG-13", "TV-MA"), if TMDB
/// has one. From `release_dates` (movie) / `content_ratings` (tv).
@override final  String? certification;
/// IMDb id (e.g. "tt0133093") from `external_ids`, for a "View on IMDb"
/// link — and the exact-match key used by the Phase 4 CSV importers.
@override final  String? imdbId;
 final  List<Genre> _genres;
@override@JsonKey() List<Genre> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

 final  List<CastMember> _cast;
@override@JsonKey() List<CastMember> get cast {
  if (_cast is EqualUnmodifiableListView) return _cast;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cast);
}

 final  List<Video> _videos;
@override@JsonKey() List<Video> get videos {
  if (_videos is EqualUnmodifiableListView) return _videos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_videos);
}

 final  List<WatchProvider> _watchProviders;
@override@JsonKey() List<WatchProvider> get watchProviders {
  if (_watchProviders is EqualUnmodifiableListView) return _watchProviders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_watchProviders);
}

 final  List<TitleSummary> _recommendations;
@override@JsonKey() List<TitleSummary> get recommendations {
  if (_recommendations is EqualUnmodifiableListView) return _recommendations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recommendations);
}

 final  List<TitleSummary> _similar;
@override@JsonKey() List<TitleSummary> get similar {
  if (_similar is EqualUnmodifiableListView) return _similar;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_similar);
}

 final  List<String> _keywords;
@override@JsonKey() List<String> get keywords {
  if (_keywords is EqualUnmodifiableListView) return _keywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_keywords);
}

/// TV only. Present in the base `/tv/{id}` payload with no extra request,
/// so it costs nothing to carry even when unused.
 final  List<TvSeason> _seasons;
/// TV only. Present in the base `/tv/{id}` payload with no extra request,
/// so it costs nothing to carry even when unused.
@override@JsonKey() List<TvSeason> get seasons {
  if (_seasons is EqualUnmodifiableListView) return _seasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seasons);
}


/// Create a copy of TitleDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TitleDetailCopyWith<_TitleDetail> get copyWith => __$TitleDetailCopyWithImpl<_TitleDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TitleDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TitleDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.title, title) || other.title == title)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.certification, certification) || other.certification == certification)&&(identical(other.imdbId, imdbId) || other.imdbId == imdbId)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._cast, _cast)&&const DeepCollectionEquality().equals(other._videos, _videos)&&const DeepCollectionEquality().equals(other._watchProviders, _watchProviders)&&const DeepCollectionEquality().equals(other._recommendations, _recommendations)&&const DeepCollectionEquality().equals(other._similar, _similar)&&const DeepCollectionEquality().equals(other._keywords, _keywords)&&const DeepCollectionEquality().equals(other._seasons, _seasons));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,mediaType,title,overview,posterPath,backdropPath,voteAverage,releaseDate,tagline,runtime,certification,imdbId,const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_cast),const DeepCollectionEquality().hash(_videos),const DeepCollectionEquality().hash(_watchProviders),const DeepCollectionEquality().hash(_recommendations),const DeepCollectionEquality().hash(_similar),const DeepCollectionEquality().hash(_keywords),const DeepCollectionEquality().hash(_seasons)]);

@override
String toString() {
  return 'TitleDetail(id: $id, mediaType: $mediaType, title: $title, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, voteAverage: $voteAverage, releaseDate: $releaseDate, tagline: $tagline, runtime: $runtime, certification: $certification, imdbId: $imdbId, genres: $genres, cast: $cast, videos: $videos, watchProviders: $watchProviders, recommendations: $recommendations, similar: $similar, keywords: $keywords, seasons: $seasons)';
}


}

/// @nodoc
abstract mixin class _$TitleDetailCopyWith<$Res> implements $TitleDetailCopyWith<$Res> {
  factory _$TitleDetailCopyWith(_TitleDetail value, $Res Function(_TitleDetail) _then) = __$TitleDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, MediaType mediaType, String title, String overview, String? posterPath, String? backdropPath, double voteAverage, String? releaseDate, String? tagline, int? runtime, String? certification, String? imdbId, List<Genre> genres, List<CastMember> cast, List<Video> videos, List<WatchProvider> watchProviders, List<TitleSummary> recommendations, List<TitleSummary> similar, List<String> keywords, List<TvSeason> seasons
});




}
/// @nodoc
class __$TitleDetailCopyWithImpl<$Res>
    implements _$TitleDetailCopyWith<$Res> {
  __$TitleDetailCopyWithImpl(this._self, this._then);

  final _TitleDetail _self;
  final $Res Function(_TitleDetail) _then;

/// Create a copy of TitleDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mediaType = null,Object? title = null,Object? overview = null,Object? posterPath = freezed,Object? backdropPath = freezed,Object? voteAverage = null,Object? releaseDate = freezed,Object? tagline = freezed,Object? runtime = freezed,Object? certification = freezed,Object? imdbId = freezed,Object? genres = null,Object? cast = null,Object? videos = null,Object? watchProviders = null,Object? recommendations = null,Object? similar = null,Object? keywords = null,Object? seasons = null,}) {
  return _then(_TitleDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MediaType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,tagline: freezed == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String?,runtime: freezed == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int?,certification: freezed == certification ? _self.certification : certification // ignore: cast_nullable_to_non_nullable
as String?,imdbId: freezed == imdbId ? _self.imdbId : imdbId // ignore: cast_nullable_to_non_nullable
as String?,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>,cast: null == cast ? _self._cast : cast // ignore: cast_nullable_to_non_nullable
as List<CastMember>,videos: null == videos ? _self._videos : videos // ignore: cast_nullable_to_non_nullable
as List<Video>,watchProviders: null == watchProviders ? _self._watchProviders : watchProviders // ignore: cast_nullable_to_non_nullable
as List<WatchProvider>,recommendations: null == recommendations ? _self._recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as List<TitleSummary>,similar: null == similar ? _self._similar : similar // ignore: cast_nullable_to_non_nullable
as List<TitleSummary>,keywords: null == keywords ? _self._keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>,seasons: null == seasons ? _self._seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<TvSeason>,
  ));
}


}

// dart format on
