import 'package:dio/dio.dart';
import 'package:movie_hunter/core/networking/api_constants.dart';
import 'package:movie_hunter/features/home/data/models/genre.dart';
import 'package:movie_hunter/core/networking/api_response.dart';
import 'package:movie_hunter/features/home/data/web_services/home_api_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:movie_hunter/features/home/data/models/movie.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String? baseUrl}) = _HomeApiService;

  // Get the upcoming movies list
  @GET(HomeApiConstants.upcoming)
  Future<ApiResponse<Movie>> getUpcomingMovies(
    @Header("Authorization") String token,
  );

  // Get the popular movies list
  @GET(HomeApiConstants.popular)
  Future<ApiResponse<Movie>> getPopularMovies(
    @Header("Authorization") String token,
  );

  // Get the top rated movies list
  @GET(HomeApiConstants.topRated)
  Future<ApiResponse<Movie>> getTopRatedMovies(
    @Header("Authorization") String token,
  );

  // Get the now playing movies list
  @GET(HomeApiConstants.nowPlaying)
  Future<ApiResponse<Movie>> getNowPlayingMovies(
    @Header("Authorization") String token,
  );

  // Get the genres list
  @GET(HomeApiConstants.genres)
  Future<Map<String, List<Genre>>> getGenres(
    @Header("Authorization") String token,
  );
}
