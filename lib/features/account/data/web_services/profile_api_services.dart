import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_response.dart';
import '../../../home/data/models/movie.dart';
import '../models/account_details_model.dart';
import 'profile_api_constants.dart';

part 'profile_api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ProfileApiServices {
  factory ProfileApiServices(Dio dio, {String? baseUrl}) = _ProfileApiServices;

  /// Fetches the user's Profile Data.
  /// Returns the AccountDetailsModel which contains the user's Name, Avatar, and their account_id.
  @GET(ProfileApiConstants.accountDetails)
  Future<AccountDetailsModel> getAccountDetails(
    @Header("Authorization") String token,
    @Query("session_id") String sessionId,
  );

  /// Checks the current status of a specific movie for the logged-in user.
  /// Use this when opening a MovieDetailsScreen to see if the movie is already Favorited or Watchlisted!
  @GET(ProfileApiConstants.accountStates)
  Future<dynamic> getMovieAccountStates(
    @Header("Authorization") String token,
    @Path("movie_id") int movieId,
    @Query("session_id") String sessionId,
  );

  /// Toggles the Favorite status of a movie (The Heart Button).
  /// Pass a JSON body like: {"media_type": "movie", "media_id": 123, "favorite": true}
  @POST(ProfileApiConstants.favorite)
  Future<dynamic> toggleFavorite(
    @Header("Authorization") String token,
    @Path("account_id") int accountId,
    @Query("session_id") String sessionId,
    @Body() Map<String, dynamic> body,
  );

  /// Gets a paginated list of all the movies the user has ever Favorited.
  /// Use this to build a Grid or List on the user's Profile Tab.
  @GET(ProfileApiConstants.favoriteMovies)
  Future<ApiResponse<Movie>> getFavoriteMovies(
    @Header("Authorization") String token,
    @Path("account_id") int accountId,
    @Query("session_id") String sessionId,
    @Query("page") int page,
  );

  /// Toggles the Watchlist status of a movie (The Save for Later Button).
  /// Pass a JSON body like: {"media_type": "movie", "media_id": 123, "watchlist": true}
  @POST(ProfileApiConstants.watchlist)
  Future<dynamic> toggleWatchlist(
    @Header("Authorization") String token,
    @Path("account_id") int accountId,
    @Query("session_id") String sessionId,
    @Body() Map<String, dynamic> body,
  );

  /// Gets a paginated list of all the movies the user has added to their Watchlist.
  /// Use this to build a "Saved for Later" section on the user's Profile Tab.
  @GET(ProfileApiConstants.watchlistMovies)
  Future<ApiResponse<Movie>> getWatchlistMovies(
    @Header("Authorization") String token,
    @Path("account_id") int accountId,
    @Query("session_id") String sessionId,
    @Query("page") int page,
  );
}
