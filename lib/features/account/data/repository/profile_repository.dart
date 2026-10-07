import 'dart:async';

import '../../../../core/helpers/secure_storage_helper.dart';
import '../../../../core/models/movie.dart';
import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../models/account_details_model.dart';
import '../models/movie_account_state_response.dart';
import '../models/movie_action_status_response.dart';
import '../web_services/profile_api_services.dart';

class ProfileRepository {
  final ProfileApiServices profileApiService;

  AccountDetailsModel? _cachedAccountDetails;
  final StreamController<MovieStateChangeEvent> _moviesStreamController =
      StreamController<MovieStateChangeEvent>.broadcast();

  Future<ApiResult<AccountDetailsModel>>?
  _accountDetailsInFlight; // the request currently running

  Stream<MovieStateChangeEvent> get movieStateStreamGetter =>
      _moviesStreamController.stream;

  ProfileRepository({required this.profileApiService});

  void clearCache() {
    _cachedAccountDetails = null;
    _accountDetailsInFlight = null;
  }

  Future<ApiResult<AccountDetailsModel>> getAccountDetails() async {
    if (_cachedAccountDetails != null) {
      return ApiResult.success(_cachedAccountDetails!);
    } else if (_accountDetailsInFlight != null) {
      return _accountDetailsInFlight!;
    } else {
      _accountDetailsInFlight = _fetchAccountDetails();
      try {
        return await _accountDetailsInFlight!;
      } finally {
        _accountDetailsInFlight = null;
      }
    }
  }

  Future<ApiResult<AccountDetailsModel>> _fetchAccountDetails() async {
    try {
      final sessionId = await SecureStorageHelper.getSessionId();
      if (sessionId == null) {
        return ApiResult.failure(
          const NetworkExceptions.unauthorizedRequest(
            'Session expired. Please log in again.',
          ),
        );
      }

      final response = await profileApiService.getAccountDetails(
        sessionId,
      );

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

  Future<int?> _resolveAccountId() async {
    final cachedId = _cachedAccountDetails?.id;
    if (cachedId != null) return cachedId;

    final storedId = await SecureStorageHelper.getAccountId();
    if (storedId != null) return storedId;

    final result = await getAccountDetails();
    return result.whenOrNull(success: (accountDetails) => accountDetails.id);
  }

  Future<ApiResult<MovieAccountStateResponse>> getMovieAccountStates(
    int movieId,
  ) async {
    try {
      final sessionId = await SecureStorageHelper.getSessionId();
      if (sessionId == null) {
        return ApiResult.failure(
          const NetworkExceptions.unauthorizedRequest(
            'Session expired. Please log in again.',
          ),
        );
      }

      final response = await profileApiService.getMovieAccountStates(
        movieId,
        sessionId,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<MovieActionStatusResponse>> toggleFavorite(
    int movieId,
    bool isFavorite,
  ) async {
    try {
      final sessionId = await SecureStorageHelper.getSessionId();
      final accountId = await _resolveAccountId();
      if (sessionId == null || accountId == null) {
        return ApiResult.failure(
          const NetworkExceptions.unauthorizedRequest(
            'Session expired. Please log in again.',
          ),
        );
      }

      final response = await profileApiService.toggleFavorite(
        accountId,
        sessionId,
        {"media_type": "movie", "media_id": movieId, "favorite": isFavorite},
      );
      _moviesStreamController.add(
        MovieStateChangeEvent(movieId: movieId, isFavorite: isFavorite),
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<ApiResponse<Movie>>> getFavoriteMovies(int page) async {
    try {
      final sessionId = await SecureStorageHelper.getSessionId();
      final accountId = await _resolveAccountId();
      if (sessionId == null || accountId == null) {
        return ApiResult.failure(
          const NetworkExceptions.unauthorizedRequest(
            'Session expired. Please log in again.',
          ),
        );
      }

      final response = await profileApiService.getFavoriteMovies(
        accountId,
        sessionId,
        page,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<MovieActionStatusResponse>> toggleWatchlist(
    int movieId,
    bool isWatchlisted,
  ) async {
    try {
      final sessionId = await SecureStorageHelper.getSessionId();
      final accountId = await _resolveAccountId();
      if (sessionId == null || accountId == null) {
        return ApiResult.failure(
          const NetworkExceptions.unauthorizedRequest(
            'Session expired. Please log in again.',
          ),
        );
      }

      final response = await profileApiService.toggleWatchlist(
        accountId,
        sessionId,
        {
          "media_type": "movie",
          "media_id": movieId,
          "watchlist": isWatchlisted,
        },
      );
      _moviesStreamController.add(
        MovieStateChangeEvent(movieId: movieId, isWatchlisted: isWatchlisted),
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<ApiResponse<Movie>>> getWatchlistMovies(int page) async {
    try {
      final sessionId = await SecureStorageHelper.getSessionId();
      final accountId = await _resolveAccountId();
      if (sessionId == null || accountId == null) {
        return ApiResult.failure(
          const NetworkExceptions.unauthorizedRequest(
            'Session expired. Please log in again.',
          ),
        );
      }

      final response = await profileApiService.getWatchlistMovies(
        accountId,
        sessionId,
        page,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}

class MovieStateChangeEvent {
  final int movieId;
  final bool? isFavorite;
  final bool? isWatchlisted;

  MovieStateChangeEvent({
    required this.movieId,
    this.isFavorite,
    this.isWatchlisted,
  });
}
