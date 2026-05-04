import 'package:json_annotation/json_annotation.dart';

part 'crew_member.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CrewMember {
  int? id;
  String? name;
  String? profilePath;
  String? job;
  String? department;

  CrewMember({
    this.id,
    this.name,
    this.profilePath,
    this.job,
    this.department,
  });

  factory CrewMember.fromJson(Map<String, dynamic> json) =>
      _$CrewMemberFromJson(json);

  Map<String, dynamic> toJson() => _$CrewMemberToJson(this);
}
