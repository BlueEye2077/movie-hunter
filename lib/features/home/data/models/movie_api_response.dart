import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_hunter/features/home/data/models/movie.dart';

part 'movie_api_response.g.dart';

@JsonSerializable(fieldRename: .snake)
class MovieApiResponse {
  int? page;
  @JsonKey(name: "results")
  List<Movie>? movies;
  int? totalPages;
  @JsonKey(name: "total_results")
  int? totalMovies;

  MovieApiResponse({this.page, this.movies, this.totalPages, this.totalMovies});

  // fromJsom
  factory MovieApiResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieApiResponseFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$MovieApiResponseToJson(this);
}
