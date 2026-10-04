import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/models/genre.dart';
import '../../../../core/models/movie.dart';
import '../web_services/home_api_service.dart';

class HomeRepository {
  final HomeApiService homeApiService;

  HomeRepository({required this.homeApiService});

  // Get upcoming movies
  Future<ApiResult<ApiResponse<Movie>>> getUpcomingMovies({
    int page = 1,
  }) async {
    try {
      var response = await homeApiService.getUpcomingMovies(page);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Get popular movies
  Future<ApiResult<ApiResponse<Movie>>> getPopularMovies({int page = 1}) async {
    try {
      var response = await homeApiService.getPopularMovies(page);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Get top rated movies
  Future<ApiResult<ApiResponse<Movie>>> getTopRatedMovies({
    int page = 1,
  }) async {
    try {
      var response = await homeApiService.getTopRatedMovies(page);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Get now playing movies
  Future<ApiResult<ApiResponse<Movie>>> getNowPlayingMovies({
    int page = 1,
  }) async {
    try {
      var response = await homeApiService.getNowPlayingMovies(page);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Get genres list
  Future<ApiResult<List<Genre>>> getGenres() async {
    try {
      var response = await homeApiService.getGenres();
      return ApiResult.success(response["genres"] ?? []);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Get movies by genre
  Future<ApiResult<ApiResponse<Movie>>> getMoviesByGenre({
    required int genreId,
    int page = 1,
  }) async {
    try {
      var response = await homeApiService.getMoviesByGenre(genreId, page);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
