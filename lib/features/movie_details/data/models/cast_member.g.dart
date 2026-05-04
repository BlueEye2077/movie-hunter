// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastMember _$CastMemberFromJson(Map<String, dynamic> json) => CastMember(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  profilePath: json['profile_path'] as String?,
  character: json['character'] as String?,
  order: (json['order'] as num?)?.toInt(),
);

Map<String, dynamic> _$CastMemberToJson(CastMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profilePath,
      'character': instance.character,
      'order': instance.order,
    };
