import 'package:movie_hunter/core/networking/api_constants.dart';
import 'package:movie_hunter/core/networking/api_result.dart';
import 'package:movie_hunter/core/networking/network_exceptions.dart';
import 'package:movie_hunter/features/home/data/models/genre.dart';
import 'package:movie_hunter/core/networking/api_response.dart';
import 'package:movie_hunter/features/home/data/models/movie.dart';
import 'package:movie_hunter/features/home/data/web_services/home_api_service.dart';

class HomeRepository {
  final HomeApiService homeApiService;

  HomeRepository({required this.homeApiService});

  final token = ApiConstants.apiKey;

  // Get upcoming movies
  Future<ApiResult<ApiResponse<Movie>>> getUpcomingMovies() async {
    try {
      var respone = await homeApiService.getUpcomingMovies(token);
      return ApiResult.success(respone);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Get popular movies
  Future<ApiResult<ApiResponse<Movie>>> getPopularMovies() async {
    try {
      var respone = await homeApiService.getPopularMovies(token);
      return ApiResult.success(respone);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Get top rated movies
  Future<ApiResult<ApiResponse<Movie>>> getTopRatedMovies() async {
    try {
      var respone = await homeApiService.getTopRatedMovies(token);
      return ApiResult.success(respone);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Get now playing movies
  Future<ApiResult<ApiResponse<Movie>>> getNowPlayingMovies() async {
    try {
      var respone = await homeApiService.getNowPlayingMovies(token);
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
}
