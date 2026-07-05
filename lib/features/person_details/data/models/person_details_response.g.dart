// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonDetailsResponse _$PersonDetailsResponseFromJson(
  Map<String, dynamic> json,
) => PersonDetailsResponse(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  biography: json['biography'] as String?,
  birthday: json['birthday'] as String?,
  deathday: json['deathday'] as String?,
  placeOfBirth: json['place_of_birth'] as String?,
  profilePath: json['profile_path'] as String?,
  knownForDepartment: json['known_for_department'] as String?,
  popularity: (json['popularity'] as num?)?.toDouble(),
  movieCredits: json['movie_credits'] == null
      ? null
      : PersonMovieCreditsResponse.fromJson(
          json['movie_credits'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$PersonDetailsResponseToJson(
  PersonDetailsResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'biography': instance.biography,
  'birthday': instance.birthday,
  'deathday': instance.deathday,
  'place_of_birth': instance.placeOfBirth,
  'profile_path': instance.profilePath,
  'known_for_department': instance.knownForDepartment,
  'popularity': instance.popularity,
  'movie_credits': instance.movieCredits,
};
