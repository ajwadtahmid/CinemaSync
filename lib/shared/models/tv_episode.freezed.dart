// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TvEpisode {

 int get id; int get episodeNumber; String get name; String get overview; String? get airDate; String? get stillPath; int? get runtime; double get voteAverage;
/// Create a copy of TvEpisode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TvEpisodeCopyWith<TvEpisode> get copyWith => _$TvEpisodeCopyWithImpl<TvEpisode>(this as TvEpisode, _$identity);

  /// Serializes this TvEpisode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TvEpisode&&(identical(other.id, id) || other.id == id)&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.airDate, airDate) || other.airDate == airDate)&&(identical(other.stillPath, stillPath) || other.stillPath == stillPath)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,episodeNumber,name,overview,airDate,stillPath,runtime,voteAverage);

@override
String toString() {
  return 'TvEpisode(id: $id, episodeNumber: $episodeNumber, name: $name, overview: $overview, airDate: $airDate, stillPath: $stillPath, runtime: $runtime, voteAverage: $voteAverage)';
}


}

/// @nodoc
abstract mixin class $TvEpisodeCopyWith<$Res>  {
  factory $TvEpisodeCopyWith(TvEpisode value, $Res Function(TvEpisode) _then) = _$TvEpisodeCopyWithImpl;
@useResult
$Res call({
 int id, int episodeNumber, String name, String overview, String? airDate, String? stillPath, int? runtime, double voteAverage
});




}
/// @nodoc
class _$TvEpisodeCopyWithImpl<$Res>
    implements $TvEpisodeCopyWith<$Res> {
  _$TvEpisodeCopyWithImpl(this._self, this._then);

  final TvEpisode _self;
  final $Res Function(TvEpisode) _then;

/// Create a copy of TvEpisode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? episodeNumber = null,Object? name = null,Object? overview = null,Object? airDate = freezed,Object? stillPath = freezed,Object? runtime = freezed,Object? voteAverage = null,}) {
  return _then(TvEpisode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,episodeNumber: null == episodeNumber ? _self.episodeNumber : episodeNumber // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,airDate: freezed == airDate ? _self.airDate : airDate // ignore: cast_nullable_to_non_nullable
as String?,stillPath: freezed == stillPath ? _self.stillPath : stillPath // ignore: cast_nullable_to_non_nullable
as String?,runtime: freezed == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int?,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TvEpisode].
extension TvEpisodePatterns on TvEpisode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TvEpisode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TvEpisode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TvEpisode value)  $default,){
final _that = this;
switch (_that) {
case _TvEpisode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TvEpisode value)?  $default,){
final _that = this;
switch (_that) {
case _TvEpisode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int episodeNumber,  String name,  String overview,  String? airDate,  String? stillPath,  int? runtime,  double voteAverage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TvEpisode() when $default != null:
return $default(_that.id,_that.episodeNumber,_that.name,_that.overview,_that.airDate,_that.stillPath,_that.runtime,_that.voteAverage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int episodeNumber,  String name,  String overview,  String? airDate,  String? stillPath,  int? runtime,  double voteAverage)  $default,) {final _that = this;
switch (_that) {
case _TvEpisode():
return $default(_that.id,_that.episodeNumber,_that.name,_that.overview,_that.airDate,_that.stillPath,_that.runtime,_that.voteAverage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int episodeNumber,  String name,  String overview,  String? airDate,  String? stillPath,  int? runtime,  double voteAverage)?  $default,) {final _that = this;
switch (_that) {
case _TvEpisode() when $default != null:
return $default(_that.id,_that.episodeNumber,_that.name,_that.overview,_that.airDate,_that.stillPath,_that.runtime,_that.voteAverage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TvEpisode extends TvEpisode {
  const _TvEpisode({required this.id, required this.episodeNumber, required this.name, this.overview = '', this.airDate, this.stillPath, this.runtime, this.voteAverage = 0}): super._();
  factory _TvEpisode.fromJson(Map<String, dynamic> json) => _$TvEpisodeFromJson(json);

@override final  int id;
@override final  int episodeNumber;
@override final  String name;
@override@JsonKey() final  String overview;
@override final  String? airDate;
@override final  String? stillPath;
@override final  int? runtime;
@override@JsonKey() final  double voteAverage;

/// Create a copy of TvEpisode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TvEpisodeCopyWith<_TvEpisode> get copyWith => __$TvEpisodeCopyWithImpl<_TvEpisode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TvEpisodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TvEpisode&&(identical(other.id, id) || other.id == id)&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.airDate, airDate) || other.airDate == airDate)&&(identical(other.stillPath, stillPath) || other.stillPath == stillPath)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,episodeNumber,name,overview,airDate,stillPath,runtime,voteAverage);

@override
String toString() {
  return 'TvEpisode(id: $id, episodeNumber: $episodeNumber, name: $name, overview: $overview, airDate: $airDate, stillPath: $stillPath, runtime: $runtime, voteAverage: $voteAverage)';
}


}

/// @nodoc
abstract mixin class _$TvEpisodeCopyWith<$Res> implements $TvEpisodeCopyWith<$Res> {
  factory _$TvEpisodeCopyWith(_TvEpisode value, $Res Function(_TvEpisode) _then) = __$TvEpisodeCopyWithImpl;
@override @useResult
$Res call({
 int id, int episodeNumber, String name, String overview, String? airDate, String? stillPath, int? runtime, double voteAverage
});




}
/// @nodoc
class __$TvEpisodeCopyWithImpl<$Res>
    implements _$TvEpisodeCopyWith<$Res> {
  __$TvEpisodeCopyWithImpl(this._self, this._then);

  final _TvEpisode _self;
  final $Res Function(_TvEpisode) _then;

/// Create a copy of TvEpisode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? episodeNumber = null,Object? name = null,Object? overview = null,Object? airDate = freezed,Object? stillPath = freezed,Object? runtime = freezed,Object? voteAverage = null,}) {
  return _then(_TvEpisode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,episodeNumber: null == episodeNumber ? _self.episodeNumber : episodeNumber // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,airDate: freezed == airDate ? _self.airDate : airDate // ignore: cast_nullable_to_non_nullable
as String?,stillPath: freezed == stillPath ? _self.stillPath : stillPath // ignore: cast_nullable_to_non_nullable
as String?,runtime: freezed == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int?,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
