import '../../../../core/genres/domain/entities/genre_entity.dart';

class MovieDetailsEntity {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final String? releaseDate;
  final String? year;
  final int? runtime;
  final String? formattedRuntime;
  final double voteAverage;
  final int voteCount;
  final List<GenreEntity> genres;

  const MovieDetailsEntity({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.year,
    this.runtime,
    this.formattedRuntime,
    required this.voteAverage,
    required this.voteCount,
    this.genres = const [],
  });
}

