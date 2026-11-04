import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/models/movie.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_response.dart';
import '../models/account_details_response.dart';
import '../models/movie_account_state_response.dart';
import '../models/movie_action_status_response.dart';
import '../models/requests/delete_session_request.dart';
import '../models/requests/mark_favorite_request.dart';
import '../models/requests/mark_watchlist_request.dart';
import 'account_api_constants.dart';

part 'account_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AccountApiService {
  factory AccountApiService(Dio dio, {String? baseUrl}) = _AccountApiService;

  @GET(AccountApiConstants.accountDetails)
  Future<AccountDetailsResponse> getAccountDetails(
    @Query('session_id') String sessionId,
  );

  @GET(AccountApiConstants.accountStates)
  Future<MovieAccountStateResponse> getMovieAccountStates(
    @Path('movie_id') int movieId,
    @Query('session_id') String sessionId,
  );

  @POST(AccountApiConstants.favorite)
  Future<MovieActionStatusResponse> toggleFavorite(
    @Path('account_id') int accountId,
    @Query('session_id') String sessionId,
    @Body() MarkFavoriteRequest body,
  );

  @GET(AccountApiConstants.favoriteMovies)
  Future<ApiResponse<Movie>> getFavoriteMovies(
    @Path('account_id') int accountId,
    @Query('session_id') String sessionId,
    @Query('page') int page,
  );

  @POST(AccountApiConstants.watchlist)
  Future<MovieActionStatusResponse> toggleWatchlist(
    @Path('account_id') int accountId,
    @Query('session_id') String sessionId,
    @Body() MarkWatchlistRequest body,
  );

  @GET(AccountApiConstants.watchlistMovies)
  Future<ApiResponse<Movie>> getWatchlistMovies(
    @Path('account_id') int accountId,
    @Query('session_id') String sessionId,
    @Query('page') int page,
  );

  @DELETE(AccountApiConstants.deleteSession)
  Future<void> deleteSession(@Body() DeleteSessionRequest body);
}

