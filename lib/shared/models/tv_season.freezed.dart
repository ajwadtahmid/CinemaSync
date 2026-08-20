// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_season.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TvSeason {

 int get seasonNumber; String get name; int get episodeCount; String? get airDate; String? get posterPath;
/// Create a copy of TvSeason
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TvSeasonCopyWith<TvSeason> get copyWith => _$TvSeasonCopyWithImpl<TvSeason>(this as TvSeason, _$identity);

  /// Serializes this TvSeason to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TvSeason&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.episodeCount, episodeCount) || other.episodeCount == episodeCount)&&(identical(other.airDate, airDate) || other.airDate == airDate)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seasonNumber,name,episodeCount,airDate,posterPath);

@override
String toString() {
  return 'TvSeason(seasonNumber: $seasonNumber, name: $name, episodeCount: $episodeCount, airDate: $airDate, posterPath: $posterPath)';
}


}

/// @nodoc
abstract mixin class $TvSeasonCopyWith<$Res>  {
  factory $TvSeasonCopyWith(TvSeason value, $Res Function(TvSeason) _then) = _$TvSeasonCopyWithImpl;
@useResult
$Res call({
 int seasonNumber, String name, int episodeCount, String? airDate, String? posterPath
});




}
/// @nodoc
class _$TvSeasonCopyWithImpl<$Res>
    implements $TvSeasonCopyWith<$Res> {
  _$TvSeasonCopyWithImpl(this._self, this._then);

  final TvSeason _self;
  final $Res Function(TvSeason) _then;

/// Create a copy of TvSeason
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seasonNumber = null,Object? name = null,Object? episodeCount = null,Object? airDate = freezed,Object? posterPath = freezed,}) {
  return _then(TvSeason(
seasonNumber: null == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,episodeCount: null == episodeCount ? _self.episodeCount : episodeCount // ignore: cast_nullable_to_non_nullable
as int,airDate: freezed == airDate ? _self.airDate : airDate // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TvSeason].
extension TvSeasonPatterns on TvSeason {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TvSeason value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TvSeason() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TvSeason value)  $default,){
final _that = this;
switch (_that) {
case _TvSeason():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TvSeason value)?  $default,){
final _that = this;
switch (_that) {
case _TvSeason() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int seasonNumber,  String name,  int episodeCount,  String? airDate,  String? posterPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TvSeason() when $default != null:
return $default(_that.seasonNumber,_that.name,_that.episodeCount,_that.airDate,_that.posterPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int seasonNumber,  String name,  int episodeCount,  String? airDate,  String? posterPath)  $default,) {final _that = this;
switch (_that) {
case _TvSeason():
return $default(_that.seasonNumber,_that.name,_that.episodeCount,_that.airDate,_that.posterPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int seasonNumber,  String name,  int episodeCount,  String? airDate,  String? posterPath)?  $default,) {final _that = this;
switch (_that) {
case _TvSeason() when $default != null:
return $default(_that.seasonNumber,_that.name,_that.episodeCount,_that.airDate,_that.posterPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TvSeason extends TvSeason {
  const _TvSeason({required this.seasonNumber, required this.name, required this.episodeCount, this.airDate, this.posterPath}): super._();
  factory _TvSeason.fromJson(Map<String, dynamic> json) => _$TvSeasonFromJson(json);

@override final  int seasonNumber;
@override final  String name;
@override final  int episodeCount;
@override final  String? airDate;
@override final  String? posterPath;

/// Create a copy of TvSeason
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TvSeasonCopyWith<_TvSeason> get copyWith => __$TvSeasonCopyWithImpl<_TvSeason>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TvSeasonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TvSeason&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.episodeCount, episodeCount) || other.episodeCount == episodeCount)&&(identical(other.airDate, airDate) || other.airDate == airDate)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seasonNumber,name,episodeCount,airDate,posterPath);

@override
String toString() {
  return 'TvSeason(seasonNumber: $seasonNumber, name: $name, episodeCount: $episodeCount, airDate: $airDate, posterPath: $posterPath)';
}


}

/// @nodoc
abstract mixin class _$TvSeasonCopyWith<$Res> implements $TvSeasonCopyWith<$Res> {
  factory _$TvSeasonCopyWith(_TvSeason value, $Res Function(_TvSeason) _then) = __$TvSeasonCopyWithImpl;
@override @useResult
$Res call({
 int seasonNumber, String name, int episodeCount, String? airDate, String? posterPath
});




}
/// @nodoc
class __$TvSeasonCopyWithImpl<$Res>
    implements _$TvSeasonCopyWith<$Res> {
  __$TvSeasonCopyWithImpl(this._self, this._then);

  final _TvSeason _self;
  final $Res Function(_TvSeason) _then;

/// Create a copy of TvSeason
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seasonNumber = null,Object? name = null,Object? episodeCount = null,Object? airDate = freezed,Object? posterPath = freezed,}) {
  return _then(_TvSeason(
seasonNumber: null == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,episodeCount: null == episodeCount ? _self.episodeCount : episodeCount // ignore: cast_nullable_to_non_nullable
as int,airDate: freezed == airDate ? _self.airDate : airDate // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
