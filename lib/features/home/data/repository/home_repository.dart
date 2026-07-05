import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../models/genre.dart';
import '../models/movie.dart';
import '../web_services/home_api_service.dart';

class HomeRepository {
  final HomeApiService homeApiService;

  HomeRepository({required this.homeApiService});

  final token = ApiConstants.apiKey;

  // Get upcoming movies
  Future<ApiResult<ApiResponse<Movie>>> getUpcomingMovies({
    int page = 1,
  }) async {
    try {
      var respone = await homeApiService.getUpcomingMovies(token, page);
      return ApiResult.success(respone);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Get popular movies
  Future<ApiResult<ApiResponse<Movie>>> getPopularMovies({int page = 1}) async {
    try {
      var respone = await homeApiService.getPopularMovies(token, page);
      return ApiResult.success(respone);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Get top rated movies
  Future<ApiResult<ApiResponse<Movie>>> getTopRatedMovies({
    int page = 1,
  }) async {
    try {
      var respone = await homeApiService.getTopRatedMovies(token, page);
      return ApiResult.success(respone);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Get now playing movies
  Future<ApiResult<ApiResponse<Movie>>> getNowPlayingMovies({
    int page = 1,
  }) async {
    try {
      var respone = await homeApiService.getNowPlayingMovies(token, page);
      return ApiResult.success(respone);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Get genres list
  Future<ApiResult<List<Genre>>> getGenres() async {
    try {
      var respone = await homeApiService.getGenres(token);
      return ApiResult.success(respone["genres"] ?? []);
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
      var respone = await homeApiService.getMoviesByGenre(token, genreId, page);
      return ApiResult.success(respone);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
