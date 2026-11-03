import 'package:json_annotation/json_annotation.dart';

import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/models/movie.dart';

part 'person_movie_credits_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PersonMovieCreditsResponse {
  final List<Movie>? cast;
  final List<Movie>? crew;

  const PersonMovieCreditsResponse({this.cast, this.crew});

  factory PersonMovieCreditsResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonMovieCreditsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PersonMovieCreditsResponseToJson(this);

  List<MovieEntity> get castEntities =>
      cast?.map((movie) => movie.toEntity()).toList() ?? const [];

  List<MovieEntity> get crewEntities =>
      crew?.map((movie) => movie.toEntity()).toList() ?? const [];
}
