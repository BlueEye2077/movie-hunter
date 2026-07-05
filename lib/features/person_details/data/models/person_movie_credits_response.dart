import 'package:json_annotation/json_annotation.dart';

import '../../../home/data/models/movie.dart';

part 'person_movie_credits_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PersonMovieCreditsResponse {
  List<Movie>? cast;
  List<Movie>? crew;

  PersonMovieCreditsResponse({this.cast, this.crew});

  factory PersonMovieCreditsResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonMovieCreditsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PersonMovieCreditsResponseToJson(this);
}
