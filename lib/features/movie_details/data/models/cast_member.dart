import 'package:json_annotation/json_annotation.dart';

part 'cast_member.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CastMember {
  int? id;
  String? name;
  String? profilePath;
  String? character;
  int? order;

  CastMember({
    this.id,
    this.name,
    this.profilePath,
    this.character,
    this.order,
  });

  factory CastMember.fromJson(Map<String, dynamic> json) =>
      _$CastMemberFromJson(json);

  Map<String, dynamic> toJson() => _$CastMemberToJson(this);
}
