import 'package:json_annotation/json_annotation.dart';

import 'genre_detail.dart';

part 'movie_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetailsResponse {
  int? id;
  String? title;
  String? overview;
  String? posterPath;
  String? backdropPath;
  String? releaseDate;
  int? runtime;
  double? voteAverage;
  int? voteCount;
  List<GenreDetail>? genres;

  MovieDetailsResponse({
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.runtime,
    this.voteAverage,
    this.voteCount,
    this.genres,
  });

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsResponseToJson(this);
}
