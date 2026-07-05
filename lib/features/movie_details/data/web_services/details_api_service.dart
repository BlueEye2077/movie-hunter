import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/movie_credits_response.dart';
import '../models/movie_details_response.dart';
import '../models/movie_videos_response.dart';
import 'details_api_constants.dart';

part 'details_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class DetailsApiService {
  factory DetailsApiService(Dio dio, {String? baseUrl}) = _DetailsApiService;

  @GET(DetailsApiConstants.movieDetails)
  Future<MovieDetailsResponse> getMovieDetails(
    @Header("Authorization") String token,
    @Path("movie_id") int movieId,
  );

  @GET(DetailsApiConstants.movieCredits)
  Future<MovieCreditsResponse> getMovieCredits(
    @Header("Authorization") String token,
    @Path("movie_id") int movieId,
  );

  @GET(DetailsApiConstants.movieVideos)
  Future<MovieVideosResponse> getMovieVideos(
    @Header("Authorization") String token,
    @Path("movie_id") int movieId,
  );
}
