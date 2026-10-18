import '../../../../core/models/movie.dart';
import '../../domain/entities/movie_entity.dart';

extension MovieMapper on Movie {
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
}

// Todo: this is a temporary solution to use in the non refactor modules, we should use the entity class instead of this
extension MovieEntityMapper on MovieEntity {
  Movie toMovie() => Movie(
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
}

