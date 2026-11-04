import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../domain/entities/account_movie_list_type.dart';
import '../../domain/entities/movie_account_status_entity.dart';
import '../../domain/usecases/get_movie_account_status_usecase.dart';
import '../../domain/usecases/update_movie_account_list_usecase.dart';

part 'movie_account_status_cubit.freezed.dart';
part 'movie_account_status_state.dart';

class MovieAccountStatusCubit extends Cubit<MovieAccountStatusState> {
  final GetMovieAccountStatusUseCase _getMovieAccountStatusUseCase;
  final UpdateMovieAccountListUseCase _updateMovieAccountListUseCase;

  bool _isUpdating = false;

  MovieAccountStatusCubit({
    required GetMovieAccountStatusUseCase getMovieAccountStatusUseCase,
    required UpdateMovieAccountListUseCase updateMovieAccountListUseCase,
  }) : _getMovieAccountStatusUseCase = getMovieAccountStatusUseCase,
       _updateMovieAccountListUseCase = updateMovieAccountListUseCase,
       super(const MovieAccountStatusState.idle());

  Future<void> loadStatus(int movieId) async {
    emit(const MovieAccountStatusState.loading());
    final result = await _getMovieAccountStatusUseCase(movieId);
    if (isClosed) return;

    result.when(
      success: (status) => emit(MovieAccountStatusState.success(status)),
      failure: (error) => emit(MovieAccountStatusState.error(error)),
    );
  }

  Future<void> toggleFavorite(int movieId) async {
    final currentState = state;
    if (_isUpdating || currentState is! _Success) return;

    final previousStatus = currentState.status;
    final targetIsFavorite = !previousStatus.isFavorite;
    final updatedStatus = previousStatus.copyWith(isFavorite: targetIsFavorite);
    _isUpdating = true;
    emit(MovieAccountStatusState.success(updatedStatus));

    final result = await _updateMovieAccountListUseCase(
      isAdded: targetIsFavorite,
      listType: AccountMovieListType.favorites,
      movieId: movieId,
    );
    _isUpdating = false;
    if (isClosed) return;

    result.whenOrNull(
      failure: (error) {
        emit(MovieAccountStatusState.error(error));
        emit(MovieAccountStatusState.success(previousStatus));
      },
    );
  }

  Future<void> toggleWatchlist(int movieId) async {
    final currentState = state;
    if (_isUpdating || currentState is! _Success) return;

    final previousStatus = currentState.status;
    final targetIsWatchlist = !previousStatus.isWatchlisted;
    final updatedStatus = previousStatus.copyWith(
      isWatchlisted: targetIsWatchlist,
    );
    _isUpdating = true;
    emit(MovieAccountStatusState.success(updatedStatus));

    final result = await _updateMovieAccountListUseCase(
      isAdded: targetIsWatchlist,
      listType: AccountMovieListType.watchlist,
      movieId: movieId,
    );
    _isUpdating = false;
    if (isClosed) return;

    result.whenOrNull(
      failure: (error) {
        emit(MovieAccountStatusState.error(error));
        emit(MovieAccountStatusState.success(previousStatus));
      },
    );
  }
}
