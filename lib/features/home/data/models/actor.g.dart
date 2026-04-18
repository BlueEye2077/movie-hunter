// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Actor _$ActorFromJson(Map<String, dynamic> json) => Actor(
  adult: json['adult'] as bool?,
  gender: (json['gender'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  knownForDepartment: json['known_for_department'] as String?,
  name: json['name'] as String?,
  originalName: json['original_name'] as String?,
  popularity: (json['popularity'] as num?)?.toDouble(),
  profilePath: json['profile_path'] as String?,
  knownFor: (json['known_for'] as List<dynamic>?)
      ?.map((e) => KnownFor.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ActorToJson(Actor instance) => <String, dynamic>{
  'adult': instance.adult,
  'gender': instance.gender,
  'id': instance.id,
  'known_for_department': instance.knownForDepartment,
  'name': instance.name,
  'original_name': instance.originalName,
  'popularity': instance.popularity,
  'profile_path': instance.profilePath,
  'known_for': instance.knownFor,
};
