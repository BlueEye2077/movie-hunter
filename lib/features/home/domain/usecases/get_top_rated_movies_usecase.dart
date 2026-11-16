import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/domain/models/paginated_list.dart';
import '../../../../core/genres/domain/entities/genre_entity.dart';
import '../../../../core/genres/domain/repos/genres_repository.dart';
import '../../../../core/genres/helpers/genres_helper.dart';
import '../../../../core/networking/api_result.dart';
import '../repos/home_repository.dart';

class GetTopRatedMoviesUseCase {
  final HomeRepository _homeRepository;
  final GenresRepository _genresRepository;

  const GetTopRatedMoviesUseCase({
    required HomeRepository homeRepository,
    required GenresRepository genresRepository,
  }) : _homeRepository = homeRepository,
       _genresRepository = genresRepository;

  Future<ApiResult<PaginatedList<MovieEntity>>> call({int page = 1}) async {
    final (allGenresResponse, response) = await (
      _genresRepository.getGenres(),
      _homeRepository.getTopRatedMovies(page: page),
    ).wait;

    final List<GenreEntity> allGenres =
        allGenresResponse.whenOrNull(success: (data) => data) ?? [];

    return response.when(
      success: (data) => ApiResult.success(
        GenresHelper.enrichPaginatedMovies(
          paginatedList: data,
          allGenres: allGenres,
        ),
      ),
      failure: (error) => ApiResult.failure(error),
    );
  }
}
