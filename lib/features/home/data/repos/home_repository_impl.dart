import 'package:movie_hunter/core/domain/models/paginated_list.dart';
import 'package:movie_hunter/features/home/domain/entities/movie_entity.dart';

import '../../../../core/models/genre.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../domain/repos/home_repository.dart';
import '../web_services/home_api_service.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeApiService homeApiService;

  HomeRepositoryImpl({required this.homeApiService});

  // Get upcoming movies
  @override
  Future<ApiResult<PaginatedList<MovieEntity>>> getUpcomingMovies({
    int page = 1,
  }) async {
    try {
      var response = await homeApiService.getUpcomingMovies(page);
      return ApiResult.success(
        response.toPaginatedList((item) => item.toEntity()),
      );
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Get popular movies
  @override
  Future<ApiResult<PaginatedList<MovieEntity>>> getPopularMovies({
    int page = 1,
  }) async {
    try {
      var response = await homeApiService.getPopularMovies(page);
      return ApiResult.success(
        response.toPaginatedList((item) => item.toEntity()),
      );
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Get top rated movies
  @override
  Future<ApiResult<PaginatedList<MovieEntity>>> getTopRatedMovies({
    int page = 1,
  }) async {
    try {
      var response = await homeApiService.getTopRatedMovies(page);
      return ApiResult.success(
        response.toPaginatedList((item) => item.toEntity()),
      );
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Get now playing movies
  @override
  Future<ApiResult<PaginatedList<MovieEntity>>> getNowPlayingMovies({
    int page = 1,
  }) async {
    try {
      var response = await homeApiService.getNowPlayingMovies(page);
      return ApiResult.success(
        response.toPaginatedList<MovieEntity>((item) => item.toEntity()),
      );
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Get genres list
  @override
  Future<ApiResult<List<Genre>>> getGenres() async {
    try {
      var response = await homeApiService.getGenres();
      return ApiResult.success(response["genres"] ?? []);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Get movies by genre
  @override
  Future<ApiResult<PaginatedList<MovieEntity>>> getMoviesByGenre({
    required int genreId,
    int page = 1,
  }) async {
    try {
      var response = await homeApiService.getMoviesByGenre(genreId, page);
      return ApiResult.success(
        response.toPaginatedList((item) => item.toEntity()),
      );
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
