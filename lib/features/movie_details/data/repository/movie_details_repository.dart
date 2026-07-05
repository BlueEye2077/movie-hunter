import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../models/movie_credits_response.dart';
import '../models/movie_details_response.dart';
import '../models/movie_videos_response.dart';
import '../web_services/details_api_service.dart';

class MovieDetailsRepository {
  final DetailsApiService detailsApiService;

  MovieDetailsRepository({required this.detailsApiService});

  final _token = ApiConstants.apiKey;

  // get movie details
  Future<ApiResult<MovieDetailsResponse>> getMovieDetails(int movieId) async {
    try {
      final response = await detailsApiService.getMovieDetails(_token, movieId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // get movie credits (cast and crew)
  Future<ApiResult<MovieCreditsResponse>> getMovieCredits(int movieId) async {
    try {
      final response = await detailsApiService.getMovieCredits(_token, movieId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // get movie videos (trailers)
  Future<ApiResult<MovieVideosResponse>> getMovieVideos(int movieId) async {
    try {
      final response = await detailsApiService.getMovieVideos(_token, movieId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
