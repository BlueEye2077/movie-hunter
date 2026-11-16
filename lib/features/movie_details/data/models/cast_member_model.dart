import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/raw_credits_entity.dart';

part 'cast_member_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CastMemberModel {
  final int? id;
  final String? name;
  final String? profilePath;
  final String? character;
  final int? order;

  const CastMemberModel({
    this.id,
    this.name,
    this.profilePath,
    this.character,
    this.order,
  });

  factory CastMemberModel.fromJson(Map<String, dynamic> json) =>
      _$CastMemberModelFromJson(json);

  Map<String, dynamic> toJson() => _$CastMemberModelToJson(this);

  CastMemberEntity toEntity() => CastMemberEntity(
        id: id ?? 0,
        name: name ?? '',
        character: character ?? '',
        profilePath: profilePath,
        order: order,
      );
}

