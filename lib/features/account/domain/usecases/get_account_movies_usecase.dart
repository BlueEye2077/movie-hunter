import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/domain/models/paginated_list.dart';
import '../../../../core/genres/domain/repos/genres_repository.dart';
import '../../../../core/genres/helpers/genres_helper.dart';
import '../../../../core/networking/api_result.dart';
import '../entities/account_movie_list_type.dart';
import '../repos/account_repository.dart';

class GetAccountMoviesUseCase {
  final AccountRepository _accountRepository;
  final GenresRepository _genresRepository;

  const GetAccountMoviesUseCase({
    required AccountRepository accountRepository,
    required GenresRepository genresRepository,
  }) : _accountRepository = accountRepository,
       _genresRepository = genresRepository;

  Future<ApiResult<PaginatedList<MovieEntity>>> call({
    required AccountMovieListType listType,
    int page = 1,
  }) async {
    final (genresResult, moviesResult) = await (
      _genresRepository.getGenres(),
      _accountRepository.getAccountMovies(listType: listType, page: page),
    ).wait;
    final allGenres =
        genresResult.whenOrNull(success: (data) => data) ?? const [];

    return moviesResult.when(
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
