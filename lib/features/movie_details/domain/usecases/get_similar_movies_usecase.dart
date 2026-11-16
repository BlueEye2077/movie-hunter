import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/genres/domain/entities/genre_entity.dart';
import '../../../../core/genres/domain/repos/genres_repository.dart';
import '../../../../core/genres/helpers/genres_helper.dart';
import '../../../../core/networking/api_result.dart';
import '../repos/movie_details_repository.dart';

class GetSimilarMoviesUseCase {
  final MovieDetailsRepository _movieDetailsRepository;
  final GenresRepository _genresRepository;

  const GetSimilarMoviesUseCase({
    required MovieDetailsRepository movieDetailsRepository,
    required GenresRepository genresRepository,
  })  : _movieDetailsRepository = movieDetailsRepository,
        _genresRepository = genresRepository;

  Future<ApiResult<List<MovieEntity>>> call(int movieId) async {
    final (genresResult, moviesResult) = await (
      _genresRepository.getGenres(),
      _movieDetailsRepository.getSimilarMovies(movieId),
    ).wait;

    final List<GenreEntity> allGenres =
        genresResult.whenOrNull(success: (data) => data) ?? const [];

    return moviesResult.when(
      success: (movies) => ApiResult.success(
        GenresHelper.enrichMovies(movies: movies, allGenres: allGenres),
      ),
      failure: (error) => ApiResult.failure(error),
    );
  }
}

