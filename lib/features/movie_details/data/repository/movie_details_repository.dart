import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/models/movie.dart';
import '../models/movie_credits_response.dart';
import '../models/movie_details_response.dart';
import '../models/movie_videos_response.dart';
import '../web_services/details_api_service.dart';

class MovieDetailsRepository {
  final DetailsApiService detailsApiService;

  MovieDetailsRepository({required this.detailsApiService});

  // get movie details
  Future<ApiResult<MovieDetailsResponse>> getMovieDetails(int movieId) async {
    try {
      final response = await detailsApiService.getMovieDetails(movieId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // get movie credits (cast and crew)
  Future<ApiResult<MovieCreditsResponse>> getMovieCredits(int movieId) async {
    try {
      final response = await detailsApiService.getMovieCredits(movieId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // get movie videos (trailers)
  Future<ApiResult<MovieVideosResponse>> getMovieVideos(int movieId) async {
    try {
      final response = await detailsApiService.getMovieVideos(movieId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // get similar movies
  Future<ApiResult<ApiResponse<Movie>>> getSimilarMovies(int movieId) async {
    try {
      final response = await detailsApiService.getSimilarMovies(movieId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
