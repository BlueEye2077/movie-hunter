import '../../../../core/helpers/secure_storage_helper.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../home/data/models/movie.dart';
import '../models/account_details_model.dart';
import '../web_services/profile_api_services.dart';

class ProfileRepository {
  final ProfileApiServices profileApiService;
  final _token = ApiConstants.apiKey;
  
  AccountDetailsModel? _cachedAccountDetails;

  ProfileRepository({required this.profileApiService});

  void clearCache() {
    _cachedAccountDetails = null;
  }

  Future<ApiResult<AccountDetailsModel>> getAccountDetails() async {
    if (_cachedAccountDetails != null) {
      return ApiResult.success(_cachedAccountDetails!);
    }
    try {
      final sessionId = await SecureStorageHelper.getSessionId();
      if (sessionId == null) {
        return ApiResult.failure(
          const NetworkExceptions.unauthorizedRequest('Session expired. Please log in again.'),
        );
      }

      final response = await profileApiService.getAccountDetails(_token, sessionId);
      
      // Save the account ID so other methods can use it instantly!
      if (response.id != null) {
        await SecureStorageHelper.saveAccountId(response.id!);
      }
      
      _cachedAccountDetails = response;

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<dynamic>> getMovieAccountStates(int movieId) async {
    try {
      final sessionId = await SecureStorageHelper.getSessionId();
      if (sessionId == null) {
        return ApiResult.failure(
          const NetworkExceptions.unauthorizedRequest('Session expired. Please log in again.'),
        );
      }

      final response = await profileApiService.getMovieAccountStates(
        _token,
        movieId,
        sessionId,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<dynamic>> toggleFavorite(int movieId, bool isFavorite) async {
    try {
      final sessionId = await SecureStorageHelper.getSessionId();
      final accountIdStr = await SecureStorageHelper.getAccountId();
      if (sessionId == null || accountIdStr == null) {
        return ApiResult.failure(
          const NetworkExceptions.unauthorizedRequest('Session expired. Please log in again.'),
        );
      }

      final response = await profileApiService.toggleFavorite(
        _token,
        int.parse(accountIdStr),
        sessionId,
        {
          "media_type": "movie",
          "media_id": movieId,
          "favorite": isFavorite,
        },
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<ApiResponse<Movie>>> getFavoriteMovies(int page) async {
    try {
      final sessionId = await SecureStorageHelper.getSessionId();
      final accountIdStr = await SecureStorageHelper.getAccountId();
      if (sessionId == null || accountIdStr == null) {
        return ApiResult.failure(
          const NetworkExceptions.unauthorizedRequest('Session expired. Please log in again.'),
        );
      }

      final response = await profileApiService.getFavoriteMovies(
        _token,
        int.parse(accountIdStr),
        sessionId,
        page,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<dynamic>> toggleWatchlist(int movieId, bool isWatchlisted) async {
    try {
      final sessionId = await SecureStorageHelper.getSessionId();
      final accountIdStr = await SecureStorageHelper.getAccountId();
      if (sessionId == null || accountIdStr == null) {
        return ApiResult.failure(
          const NetworkExceptions.unauthorizedRequest('Session expired. Please log in again.'),
        );
      }

      final response = await profileApiService.toggleWatchlist(
        _token,
        int.parse(accountIdStr),
        sessionId,
        {
          "media_type": "movie",
          "media_id": movieId,
          "watchlist": isWatchlisted,
        },
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<ApiResponse<Movie>>> getWatchlistMovies(int page) async {
    try {
      final sessionId = await SecureStorageHelper.getSessionId();
      final accountIdStr = await SecureStorageHelper.getAccountId();
      if (sessionId == null || accountIdStr == null) {
        return ApiResult.failure(
          const NetworkExceptions.unauthorizedRequest('Session expired. Please log in again.'),
        );
      }

      final response = await profileApiService.getWatchlistMovies(
        _token,
        int.parse(accountIdStr),
        sessionId,
        page,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
