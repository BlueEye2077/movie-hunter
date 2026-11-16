import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/domain/models/paginated_list.dart';
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
}
