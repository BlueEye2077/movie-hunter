import 'package:movie_hunter/core/networking/api_constants.dart';
import 'package:movie_hunter/core/networking/api_result.dart';
import 'package:movie_hunter/core/networking/network_exceptions.dart';
import 'package:movie_hunter/features/home/data/models/actor.dart';
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

  List<dynamic> mapSearchResults(List<dynamic> response) {
    return response.map((e) {
      switch (e['media_type']) {
        case 'movie':
          return Movie.fromJson(e);
        case 'person':
          return Actor.fromJson(e);
        default:
          return null;
      }
    }).nonNulls.toList();
  }

  // Search for movies, tv shows, and people
  Future<ApiResult<ApiResponse<dynamic>>> search(String query) async {
    try {
      var response = await homeApiService.search(token, query);

      return ApiResult.success(
        ApiResponse(
          page: response.page,
          totalPages: response.totalPages,
          totalResultsItems: response.totalResultsItems,
          results: (response.results ?? []).isNotEmpty
              ? mapSearchResults(response.results!)
              : [],
        ),
      );
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
