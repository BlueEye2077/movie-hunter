import 'package:movie_hunter/core/networking/api_constants.dart';
import 'package:movie_hunter/core/networking/api_result.dart';
import 'package:movie_hunter/core/networking/network_exceptions.dart';
import 'package:movie_hunter/features/home/data/models/genre.dart';
import 'package:movie_hunter/features/home/data/models/movie_api_response.dart';
import 'package:movie_hunter/features/home/data/web_services/home_api_service.dart';

class HomeRepository {
  final HomeApiService homeApiService;

  HomeRepository({required this.homeApiService});

  final token = ApiConstants.apiKey;

  // Get upcoming movies
  Future<ApiResult<MovieApiResponse>> getUpcomingMovies() async {
    try {
      var respone = await homeApiService.getUpcomingMovies(token);
      return ApiResult.success(respone);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Get popular movies
  Future<ApiResult<MovieApiResponse>> getPopularMovies() async {
    try {
      var respone = await homeApiService.getPopularMovies(token);
      return ApiResult.success(respone);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Get top rated movies
  Future<ApiResult<MovieApiResponse>> getTopRatedMovies() async {
    try {
      var respone = await homeApiService.getTopRatedMovies(token);
      return ApiResult.success(respone);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Get now playing movies
  Future<ApiResult<MovieApiResponse>> getNowPlayingMovies() async {
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
