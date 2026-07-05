// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_movie_credits_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonMovieCreditsResponse _$PersonMovieCreditsResponseFromJson(
  Map<String, dynamic> json,
) => PersonMovieCreditsResponse(
  cast: (json['cast'] as List<dynamic>?)
      ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
      .toList(),
  crew: (json['crew'] as List<dynamic>?)
      ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PersonMovieCreditsResponseToJson(
  PersonMovieCreditsResponse instance,
) => <String, dynamic>{'cast': instance.cast, 'crew': instance.crew};
