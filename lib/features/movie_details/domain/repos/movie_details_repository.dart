import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/networking/api_result.dart';
import '../entities/movie_details_entity.dart';
import '../entities/movie_video_entity.dart';
import '../entities/raw_credits_entity.dart';

abstract class MovieDetailsRepository {
  Future<ApiResult<MovieDetailsEntity>> getMovieDetails(int movieId);
  Future<ApiResult<RawCreditsEntity>> getMovieCredits(int movieId);
  Future<ApiResult<List<MovieVideoEntity>>> getMovieVideos(int movieId);
  Future<ApiResult<List<MovieEntity>>> getSimilarMovies(int movieId);
}

