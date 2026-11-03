import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/person_details_entity.dart';
import 'person_movie_credits_response.dart';

part 'person_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PersonDetailsResponse {
  final int? id;
  final String? name;
  final String? biography;
  final String? birthday;
  final String? deathday;
  final String? placeOfBirth;
  final String? profilePath;
  final String? knownForDepartment;
  final double? popularity;
  @JsonKey(name: 'movie_credits')
  final PersonMovieCreditsResponse? movieCredits;

  const PersonDetailsResponse({
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

  PersonDetailsEntity toEntity() {
    final rawCredits = [
      ...?movieCredits?.castEntities,
      ...?movieCredits?.crewEntities,
    ];

    return PersonDetailsEntity(
      id: id ?? 0,
      name: name ?? '',
      biography: biography ?? '',
      knownForDepartment: _nullIfBlank(knownForDepartment),
      profilePath: _nullIfBlank(profilePath),
      placeOfBirth: _nullIfBlank(placeOfBirth),
      birthday: _parseDate(birthday),
      deathday: _parseDate(deathday),
      allMovies: rawCredits,
    );
  }

  static DateTime? _parseDate(String? date) =>
      date == null || date.isEmpty ? null : DateTime.tryParse(date);

  static String? _nullIfBlank(String? value) =>
      value == null || value.trim().isEmpty ? null : value;
}
