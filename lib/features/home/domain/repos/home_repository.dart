import '../../../../core/domain/models/paginated_list.dart';
import '../../../../core/networking/api_result.dart';
import '../entities/movie_entity.dart';

abstract class HomeRepository {
  Future<ApiResult<PaginatedList<MovieEntity>>> getUpcomingMovies({
    int page = 1,
  });
  Future<ApiResult<PaginatedList<MovieEntity>>> getPopularMovies({
    int page = 1,
  });
  Future<ApiResult<PaginatedList<MovieEntity>>> getTopRatedMovies({
    int page = 1,
  });
  Future<ApiResult<PaginatedList<MovieEntity>>> getNowPlayingMovies({
    int page = 1,
  });
  Future<ApiResult<PaginatedList<MovieEntity>>> getMoviesByGenre({
    required int genreId,
    int page = 1,
  });
}
