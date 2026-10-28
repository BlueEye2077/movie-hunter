import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/domain/models/paginated_list.dart';
import '../../../../core/genres/domain/entities/genre_entity.dart';
import '../../../../core/genres/domain/repos/genres_repository.dart';
import '../../../../core/genres/helpers/genres_helper.dart';
import '../../../../core/networking/api_result.dart';
import '../../../categories/domain/repos/categories_repository.dart';

class GetMoviesByGenreUseCase {
  final CategoriesRepository _categoriesRepository;
  final GenresRepository _genresRepository;

  const GetMoviesByGenreUseCase({
    required CategoriesRepository categoriesRepository,
    required GenresRepository genresRepository,
  }) : _categoriesRepository = categoriesRepository,
       _genresRepository = genresRepository;

  Future<ApiResult<PaginatedList<MovieEntity>>> call({
    required int genreId,
    int page = 1,
  }) async {
    final (allGenresResponse, response) = await (
      _genresRepository.getGenres(),
      _categoriesRepository.getMoviesByGenre(genreId: genreId, page: page),
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
