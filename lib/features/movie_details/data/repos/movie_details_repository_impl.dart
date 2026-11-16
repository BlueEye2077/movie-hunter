import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/entities/movie_video_entity.dart';
import '../../domain/entities/raw_credits_entity.dart';
import '../../domain/repos/movie_details_repository.dart';
import '../web_services/details_api_service.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final DetailsApiService _detailsApiService;

  const MovieDetailsRepositoryImpl({
    required DetailsApiService detailsApiService,
  }) : _detailsApiService = detailsApiService;

  @override
  Future<ApiResult<MovieDetailsEntity>> getMovieDetails(int movieId) async {
    try {
      final response = await _detailsApiService.getMovieDetails(movieId);
      return ApiResult.success(response.toEntity());
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<ApiResult<RawCreditsEntity>> getMovieCredits(int movieId) async {
    try {
      final response = await _detailsApiService.getMovieCredits(movieId);
      return ApiResult.success(response.toEntity());
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<ApiResult<List<MovieVideoEntity>>> getMovieVideos(int movieId) async {
    try {
      final response = await _detailsApiService.getMovieVideos(movieId);
      return ApiResult.success(response.toEntity());
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<ApiResult<List<MovieEntity>>> getSimilarMovies(int movieId) async {
    try {
      final response = await _detailsApiService.getSimilarMovies(movieId);
      final movies = (response.results ?? [])
          .map((movieModel) => movieModel.toEntity())
          .toList();
      return ApiResult.success(movies);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}

