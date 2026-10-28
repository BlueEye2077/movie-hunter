import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/entities/movie_entity.dart';

part 'movie.g.dart';

@JsonSerializable(fieldRename: .snake)
class Movie {
  @JsonKey(name: 'adult')
  bool? isAdult;
  @JsonKey(name: 'backdrop_path')
  String? horizontalPoster;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  @JsonKey(name: 'vote_average')
  double? tmdbRating;
  @JsonKey(name: 'vote_count')
  int? tmdbVoteCount;

  Movie({
    this.isAdult,
    this.horizontalPoster,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.tmdbRating,
    this.tmdbVoteCount,
  });

  MovieEntity toEntity() => MovieEntity(
    isAdult: isAdult,
    horizontalPoster: horizontalPoster,
    genreIds: genreIds,
    id: id,
    originalLanguage: originalLanguage,
    originalTitle: originalTitle,
    overview: overview,
    popularity: popularity,
    posterPath: posterPath,
    releaseDate: releaseDate,
    title: title,
    video: video,
    tmdbRating: tmdbRating,
    tmdbVoteCount: tmdbVoteCount,
  );

  // TODO: Remove Movie.fromEntity once legacy modules (e.g. movie_details) are refactored to use MovieEntity directly.
  factory Movie.fromEntity(MovieEntity entity) => Movie(
    isAdult: entity.isAdult,
    horizontalPoster: entity.horizontalPoster,
    genreIds: entity.genreIds,
    id: entity.id,
    originalLanguage: entity.originalLanguage,
    originalTitle: entity.originalTitle,
    overview: entity.overview,
    popularity: entity.popularity,
    posterPath: entity.posterPath,
    releaseDate: entity.releaseDate,
    title: entity.title,
    video: entity.video,
    tmdbRating: entity.tmdbRating,
    tmdbVoteCount: entity.tmdbVoteCount,
  );

  // fromJsom
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

// TODO: Remove this temporary bridge extension once legacy modules are refactored.
extension MovieEntityToMovieExtension on MovieEntity {
  Movie toMovie() => Movie.fromEntity(this);
}
