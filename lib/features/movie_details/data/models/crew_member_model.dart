import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/raw_credits_entity.dart';

part 'crew_member_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CrewMemberModel {
  final int? id;
  final String? name;
  final String? profilePath;
  final String? job;
  final String? department;

  const CrewMemberModel({
    this.id,
    this.name,
    this.profilePath,
    this.job,
    this.department,
  });

  factory CrewMemberModel.fromJson(Map<String, dynamic> json) =>
      _$CrewMemberModelFromJson(json);

  Map<String, dynamic> toJson() => _$CrewMemberModelToJson(this);

  CrewMemberEntity toEntity() => CrewMemberEntity(
        id: id ?? 0,
        name: name ?? '',
        job: job ?? '',
        department: department,
        profilePath: profilePath,
      );
}

