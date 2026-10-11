import 'package:movie_hunter/core/domain/models/paginated_list.dart';
import 'package:movie_hunter/features/home/domain/entities/movie_entity.dart';

import '../../../../core/models/genre.dart';
import '../../../../core/networking/api_result.dart';

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
  Future<ApiResult<List<Genre>>> getGenres();
  Future<ApiResult<PaginatedList<MovieEntity>>> getMoviesByGenre({
    required int genreId,
    int page = 1,
  });
}
