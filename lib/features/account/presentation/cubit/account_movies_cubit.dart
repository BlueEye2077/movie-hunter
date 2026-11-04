import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../domain/entities/account_movie_change.dart';
import '../../domain/entities/account_movie_list_type.dart';
import '../../domain/usecases/get_account_movies_usecase.dart';
import '../../domain/usecases/watch_account_movie_changes_usecase.dart';

part 'account_movies_cubit.freezed.dart';
part 'account_movies_state.dart';

abstract class AccountMoviesCubit extends Cubit<AccountMoviesState> {
  final GetAccountMoviesUseCase _getAccountMoviesUseCase;
  final AccountMovieListType listType;
  late final StreamSubscription<AccountMovieChange> _changesSubscription;

  int _currentPage = 0;
  int _totalPages = 1;
  bool _isFetching = false;
  final List<MovieEntity> _movies = [];

  AccountMoviesCubit({
    required GetAccountMoviesUseCase getAccountMoviesUseCase,
    required WatchAccountMovieChangesUseCase watchAccountMovieChangesUseCase,
    required this.listType,
  }) : _getAccountMoviesUseCase = getAccountMoviesUseCase,
       super(const AccountMoviesState.idle()) {
    _changesSubscription = watchAccountMovieChangesUseCase().listen(
      _onMovieChange,
    );
  }

  Future<void> fetchInitialMovies({bool forceReload = false}) async {
    if (_isFetching) return;
    if (state is _Success && !forceReload) return;

    _isFetching = true;
    emit(const AccountMoviesState.loading());

    final result = await _getAccountMoviesUseCase(listType: listType, page: 1);
    _isFetching = false;
    if (isClosed) return;

    result.when(
      success: (paginated) {
        _currentPage = paginated.page;
        _totalPages = paginated.totalPages;
        _movies
          ..clear()
          ..addAll(paginated.results);
        emit(
          AccountMoviesState.success(
            movies: List<MovieEntity>.unmodifiable(_movies),
            totalResults: paginated.totalResultsItems,
          ),
        );
      },
      failure: (error) => emit(AccountMoviesState.error(error)),
    );
  }

  Future<void> fetchNextPage() async {
    final currentState = state;
    if (currentState is! _Success) return;
    if (_isFetching || _currentPage >= _totalPages) return;

    _isFetching = true;
    emit(
      currentState.copyWith(
        isLoadingPagination: true,
        paginationError: null,
      ),
    );

    final result = await _getAccountMoviesUseCase(
      listType: listType,
      page: _currentPage + 1,
    );
    _isFetching = false;
    if (isClosed) return;

    result.when(
      success: (paginated) {
        _currentPage = paginated.page;
        _totalPages = paginated.totalPages;
        final existingIds = _movies.map((m) => m.id).toSet();
        final newMovies = paginated.results.where(
          (m) => m.id == null || !existingIds.contains(m.id),
        );
        _movies.addAll(newMovies);
        emit(
          AccountMoviesState.success(
            movies: List<MovieEntity>.unmodifiable(_movies),
            totalResults: paginated.totalResultsItems,
          ),
        );
      },
      failure: (error) {
        final latestState = state;
        if (latestState is _Success) {
          emit(
            latestState.copyWith(
              isLoadingPagination: false,
              paginationError: error,
            ),
          );
        }
      },
    );
  }

  Future<void> _refreshSilently() async {
    final result = await _getAccountMoviesUseCase(listType: listType, page: 1);
    if (isClosed) return;

    result.whenOrNull(
      success: (paginated) {
        _currentPage = paginated.page;
        _totalPages = paginated.totalPages;
        _movies
          ..clear()
          ..addAll(paginated.results);
        emit(
          AccountMoviesState.success(
            movies: List<MovieEntity>.unmodifiable(_movies),
            totalResults: paginated.totalResultsItems,
          ),
        );
      },
    );
  }

  void _onMovieChange(AccountMovieChange change) {
    if (change.listType != listType) return;

    if (!change.isAdded) {
      final currentState = state;
      if (currentState is _Success) {
        final beforeLength = _movies.length;
        _movies.removeWhere((movie) => movie.id == change.movieId);
        final removedCount = beforeLength - _movies.length;
        final updatedTotal = (currentState.totalResults - removedCount).clamp(
          0,
          currentState.totalResults,
        );
        emit(
          currentState.copyWith(
            movies: List<MovieEntity>.unmodifiable(_movies),
            totalResults: updatedTotal,
          ),
        );
      }
    } else {
      _refreshSilently();
    }
  }

  @override
  Future<void> close() {
    _changesSubscription.cancel();
    return super.close();
  }
}

class FavoriteMoviesCubit extends AccountMoviesCubit {
  FavoriteMoviesCubit({
    required super.getAccountMoviesUseCase,
    required super.watchAccountMovieChangesUseCase,
  }) : super(listType: AccountMovieListType.favorites);
}

class WatchlistMoviesCubit extends AccountMoviesCubit {
  WatchlistMoviesCubit({
    required super.getAccountMoviesUseCase,
    required super.watchAccountMovieChangesUseCase,
  }) : super(listType: AccountMovieListType.watchlist);
}
