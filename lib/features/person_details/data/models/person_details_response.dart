import 'package:json_annotation/json_annotation.dart';

import 'person_movie_credits_response.dart';

part 'person_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PersonDetailsResponse {
  int? id;
  String? name;
  String? biography;
  String? birthday;
  String? deathday;
  String? placeOfBirth;
  String? profilePath;
  String? knownForDepartment;
  double? popularity;
  @JsonKey(name: 'movie_credits')
  PersonMovieCreditsResponse? movieCredits;

  PersonDetailsResponse({
    this.id,
    this.name,
    this.biography,
    this.birthday,
    this.deathday,
    this.placeOfBirth,
    this.profilePath,
    this.knownForDepartment,
    this.popularity,
    this.movieCredits,
  });

  factory PersonDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PersonDetailsResponseToJson(this);
}
