// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrewMember _$CrewMemberFromJson(Map<String, dynamic> json) => CrewMember(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  profilePath: json['profile_path'] as String?,
  job: json['job'] as String?,
  department: json['department'] as String?,
);

Map<String, dynamic> _$CrewMemberToJson(CrewMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profilePath,
      'job': instance.job,
      'department': instance.department,
    };
