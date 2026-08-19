// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'title_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TitleSummary {

 int get id; MediaType get mediaType; String get title; String get overview; String? get posterPath; String? get backdropPath; double get voteAverage; String? get releaseDate; List<int> get genreIds;
/// Create a copy of TitleSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TitleSummaryCopyWith<TitleSummary> get copyWith => _$TitleSummaryCopyWithImpl<TitleSummary>(this as TitleSummary, _$identity);

  /// Serializes this TitleSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TitleSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.title, title) || other.title == title)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&const DeepCollectionEquality().equals(other.genreIds, genreIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mediaType,title,overview,posterPath,backdropPath,voteAverage,releaseDate,const DeepCollectionEquality().hash(genreIds));

@override
String toString() {
  return 'TitleSummary(id: $id, mediaType: $mediaType, title: $title, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, voteAverage: $voteAverage, releaseDate: $releaseDate, genreIds: $genreIds)';
}


}

/// @nodoc
abstract mixin class $TitleSummaryCopyWith<$Res>  {
  factory $TitleSummaryCopyWith(TitleSummary value, $Res Function(TitleSummary) _then) = _$TitleSummaryCopyWithImpl;
@useResult
$Res call({
 int id, MediaType mediaType, String title, String overview, String? posterPath, String? backdropPath, double voteAverage, String? releaseDate, List<int> genreIds
});




}
/// @nodoc
class _$TitleSummaryCopyWithImpl<$Res>
    implements $TitleSummaryCopyWith<$Res> {
  _$TitleSummaryCopyWithImpl(this._self, this._then);

  final TitleSummary _self;
  final $Res Function(TitleSummary) _then;

/// Create a copy of TitleSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mediaType = null,Object? title = null,Object? overview = null,Object? posterPath = freezed,Object? backdropPath = freezed,Object? voteAverage = null,Object? releaseDate = freezed,Object? genreIds = null,}) {
  return _then(TitleSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MediaType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,genreIds: null == genreIds ? _self.genreIds : genreIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [TitleSummary].
extension TitleSummaryPatterns on TitleSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TitleSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TitleSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TitleSummary value)  $default,){
final _that = this;
switch (_that) {
case _TitleSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TitleSummary value)?  $default,){
final _that = this;
switch (_that) {
case _TitleSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  MediaType mediaType,  String title,  String overview,  String? posterPath,  String? backdropPath,  double voteAverage,  String? releaseDate,  List<int> genreIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TitleSummary() when $default != null:
return $default(_that.id,_that.mediaType,_that.title,_that.overview,_that.posterPath,_that.backdropPath,_that.voteAverage,_that.releaseDate,_that.genreIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  MediaType mediaType,  String title,  String overview,  String? posterPath,  String? backdropPath,  double voteAverage,  String? releaseDate,  List<int> genreIds)  $default,) {final _that = this;
switch (_that) {
case _TitleSummary():
return $default(_that.id,_that.mediaType,_that.title,_that.overview,_that.posterPath,_that.backdropPath,_that.voteAverage,_that.releaseDate,_that.genreIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  MediaType mediaType,  String title,  String overview,  String? posterPath,  String? backdropPath,  double voteAverage,  String? releaseDate,  List<int> genreIds)?  $default,) {final _that = this;
switch (_that) {
case _TitleSummary() when $default != null:
return $default(_that.id,_that.mediaType,_that.title,_that.overview,_that.posterPath,_that.backdropPath,_that.voteAverage,_that.releaseDate,_that.genreIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TitleSummary extends TitleSummary {
  const _TitleSummary({required this.id, required this.mediaType, required this.title, this.overview = '', this.posterPath, this.backdropPath, this.voteAverage = 0, this.releaseDate,  List<int> genreIds = const <int>[]}): _genreIds = genreIds,super._();
  factory _TitleSummary.fromJson(Map<String, dynamic> json) => _$TitleSummaryFromJson(json);

@override final  int id;
@override final  MediaType mediaType;
@override final  String title;
@override@JsonKey() final  String overview;
@override final  String? posterPath;
@override final  String? backdropPath;
@override@JsonKey() final  double voteAverage;
@override final  String? releaseDate;
 final  List<int> _genreIds;
@override@JsonKey() List<int> get genreIds {
  if (_genreIds is EqualUnmodifiableListView) return _genreIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genreIds);
}


/// Create a copy of TitleSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TitleSummaryCopyWith<_TitleSummary> get copyWith => __$TitleSummaryCopyWithImpl<_TitleSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TitleSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TitleSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.title, title) || other.title == title)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&const DeepCollectionEquality().equals(other._genreIds, _genreIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mediaType,title,overview,posterPath,backdropPath,voteAverage,releaseDate,const DeepCollectionEquality().hash(_genreIds));

@override
String toString() {
  return 'TitleSummary(id: $id, mediaType: $mediaType, title: $title, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, voteAverage: $voteAverage, releaseDate: $releaseDate, genreIds: $genreIds)';
}


}

/// @nodoc
abstract mixin class _$TitleSummaryCopyWith<$Res> implements $TitleSummaryCopyWith<$Res> {
  factory _$TitleSummaryCopyWith(_TitleSummary value, $Res Function(_TitleSummary) _then) = __$TitleSummaryCopyWithImpl;
@override @useResult
$Res call({
 int id, MediaType mediaType, String title, String overview, String? posterPath, String? backdropPath, double voteAverage, String? releaseDate, List<int> genreIds
});




}
/// @nodoc
class __$TitleSummaryCopyWithImpl<$Res>
    implements _$TitleSummaryCopyWith<$Res> {
  __$TitleSummaryCopyWithImpl(this._self, this._then);

  final _TitleSummary _self;
  final $Res Function(_TitleSummary) _then;

/// Create a copy of TitleSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mediaType = null,Object? title = null,Object? overview = null,Object? posterPath = freezed,Object? backdropPath = freezed,Object? voteAverage = null,Object? releaseDate = freezed,Object? genreIds = null,}) {
  return _then(_TitleSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MediaType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,genreIds: null == genreIds ? _self._genreIds : genreIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
