import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast_member.freezed.dart';
part 'cast_member.g.dart';

/// A single cast credit for a title.
@freezed
abstract class CastMember with _$CastMember {
  const factory CastMember({
    required int id,
    required String name,
    String? character,
    @JsonKey(name: 'profile_path') String? profilePath,
  }) = _CastMember;

  factory CastMember.fromJson(Map<String, dynamic> json) =>
      _$CastMemberFromJson(json);
}
