import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_response.dart';
import '../../../../core/models/genre.dart';
import '../../../../core/models/movie.dart';
import 'home_api_constants.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String? baseUrl}) = _HomeApiService;

  // Get the upcoming movies list
  @GET(HomeApiConstants.upcoming)
  Future<ApiResponse<Movie>> getUpcomingMovies(
    @Query("page") int page,
  );

  // Get the popular movies list
  @GET(HomeApiConstants.popular)
  Future<ApiResponse<Movie>> getPopularMovies(
    @Query("page") int page,
  );

  // Get the top rated movies list
  @GET(HomeApiConstants.topRated)
  Future<ApiResponse<Movie>> getTopRatedMovies(
    @Query("page") int page,
  );

  // Get the now playing movies list
  @GET(HomeApiConstants.nowPlaying)
  Future<ApiResponse<Movie>> getNowPlayingMovies(
    @Query("page") int page,
  );

  // Get the genres list
  @GET(HomeApiConstants.genres)
  Future<Map<String, List<Genre>>> getGenres();

  // Get movies by genre
  @GET(HomeApiConstants.discoverMovie)
  Future<ApiResponse<Movie>> getMoviesByGenre(
    @Query("with_genres") int genreId,
    @Query("page") int page,
  );
}
