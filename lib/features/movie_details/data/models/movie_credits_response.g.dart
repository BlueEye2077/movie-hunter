// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_credits_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCreditsResponse _$MovieCreditsResponseFromJson(
  Map<String, dynamic> json,
) => MovieCreditsResponse(
  id: (json['id'] as num?)?.toInt(),
  cast: (json['cast'] as List<dynamic>?)
      ?.map((e) => CastMember.fromJson(e as Map<String, dynamic>))
      .toList(),
  crew: (json['crew'] as List<dynamic>?)
      ?.map((e) => CrewMember.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MovieCreditsResponseToJson(
  MovieCreditsResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'cast': instance.cast,
  'crew': instance.crew,
};
