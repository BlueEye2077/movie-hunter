import 'dart:async';

import '../../../../core/constants/constants.dart';
import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/domain/models/paginated_list.dart';
import '../../../../core/helpers/secure_storage_helper.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/theming/app_strings.dart';
import '../../domain/entities/account_entity.dart';
import '../../domain/entities/account_movie_change.dart';
import '../../domain/entities/account_movie_list_type.dart';
import '../../domain/entities/movie_account_status_entity.dart';
import '../../domain/repos/account_repository.dart';
import '../models/requests/delete_session_request.dart';
import '../models/requests/mark_favorite_request.dart';
import '../models/requests/mark_watchlist_request.dart';
import '../web_services/account_api_service.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountApiService _accountApiService;

  AccountEntity? _cachedAccountDetails;
  Future<ApiResult<AccountEntity>>? _accountDetailsInFlight;
  final StreamController<AccountMovieChange> _movieChangesController =
      StreamController<AccountMovieChange>.broadcast();

  AccountRepositoryImpl({required AccountApiService accountApiService})
    : _accountApiService = accountApiService;

  @override
  Stream<AccountMovieChange> get movieChanges => _movieChangesController.stream;

  @override
  Future<ApiResult<AccountEntity>> getAccountDetails() async {
    if (_cachedAccountDetails != null) {
      return ApiResult.success(_cachedAccountDetails!);
    }
    if (_accountDetailsInFlight != null) {
      return _accountDetailsInFlight!;
    }
    _accountDetailsInFlight = _fetchAccountDetails();
    try {
      return await _accountDetailsInFlight!;
    } finally {
      _accountDetailsInFlight = null;
    }
  }

  Future<ApiResult<AccountEntity>> _fetchAccountDetails() {
    return _withSession((sessionId) async {
      final response = await _accountApiService.getAccountDetails(sessionId);
      if (response.id != null) {
        await SecureStorageHelper.saveAccountId(response.id!);
      }
      final entity = response.toEntity();
      _cachedAccountDetails = entity;
      return entity;
    });
  }

  @override
  Future<ApiResult<MovieAccountStatusEntity>> getMovieAccountStatus(
    int movieId,
  ) {
    return _withSession((sessionId) async {
      final response = await _accountApiService.getMovieAccountStates(
        movieId,
        sessionId,
      );
      return response.toEntity();
    });
  }

  @override
  Future<ApiResult<PaginatedList<MovieEntity>>> getAccountMovies({
    required AccountMovieListType listType,
    int page = 1,
  }) {
    return _withAccountAndSession((accountId, sessionId) async {
      final response = switch (listType) {
        AccountMovieListType.favorites =>
          await _accountApiService.getFavoriteMovies(accountId, sessionId, page),
        AccountMovieListType.watchlist =>
          await _accountApiService.getWatchlistMovies(accountId, sessionId, page),
      };
      return response.toPaginatedList((movie) => movie.toEntity());
    });
  }

  @override
  Future<ApiResult<void>> updateMovieAccountList({
    required AccountMovieListType listType,
    required int movieId,
    required bool isAdded,
  }) {
    return _withAccountAndSession((accountId, sessionId) async {
      switch (listType) {
        case AccountMovieListType.favorites:
          await _accountApiService.toggleFavorite(
            accountId,
            sessionId,
            MarkFavoriteRequest(mediaId: movieId, favorite: isAdded),
          );
        case AccountMovieListType.watchlist:
          await _accountApiService.toggleWatchlist(
            accountId,
            sessionId,
            MarkWatchlistRequest(mediaId: movieId, watchlist: isAdded),
          );
      }
      _movieChangesController.add(
        AccountMovieChange(
          movieId: movieId,
          listType: listType,
          isAdded: isAdded,
        ),
      );
    });
  }

  @override
  Future<ApiResult<void>> logout() async {
    try {
      final sessionId = await SecureStorageHelper.getSessionId();
      if (sessionId != null && sessionId.isNotEmpty) {
        try {
          await _accountApiService.deleteSession(
            DeleteSessionRequest(sessionId: sessionId),
          );
        } catch (_) {
          // Best-effort remote session revocation; always proceed with local cleanup.
        }
      }
      await SecureStorageHelper.deleteSessionId();
      await SecureStorageHelper.deleteAccountId();
      _cachedAccountDetails = null;
      _accountDetailsInFlight = null;
      isLoggedInUser = false;
      return ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<int?> _resolveAccountId() async {
    final cachedId = _cachedAccountDetails?.id;
    if (cachedId != null && cachedId > 0) return cachedId;

    final storedId = await SecureStorageHelper.getAccountId();
    if (storedId != null && storedId > 0) return storedId;

    final result = await getAccountDetails();
    return result.whenOrNull(
      success: (accountDetails) =>
          accountDetails.id > 0 ? accountDetails.id : null,
    );
  }

  Future<ApiResult<T>> _withSession<T>(
    Future<T> Function(String sessionId) action,
  ) async {
    try {
      final sessionId = await SecureStorageHelper.getSessionId();
      if (sessionId == null || sessionId.isEmpty) {
        return ApiResult.failure(
          const NetworkExceptions.unauthorizedRequest(
            AppStrings.sessionExpired,
          ),
        );
      }
      final data = await action(sessionId);
      return ApiResult.success(data);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<T>> _withAccountAndSession<T>(
    Future<T> Function(int accountId, String sessionId) action,
  ) async {
    try {
      final sessionId = await SecureStorageHelper.getSessionId();
      final accountId = await _resolveAccountId();
      if (sessionId == null || sessionId.isEmpty || accountId == null) {
        return ApiResult.failure(
          const NetworkExceptions.unauthorizedRequest(
            AppStrings.sessionExpired,
          ),
        );
      }
      final data = await action(accountId, sessionId);
      return ApiResult.success(data);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}

