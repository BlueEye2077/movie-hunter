import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/movie.dart';
import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/requests_state.dart';
import '../../data/repository/profile_repository.dart';

class WatchlistMoviesCubit extends Cubit<RequestsState<ApiResponse<Movie>>> {
  final ProfileRepository profileRepository;
  late final StreamSubscription _movieStateStreamSubscription;

  WatchlistMoviesCubit({required this.profileRepository})
    : super(const RequestsState.idle()) {
    _movieStateStreamSubscription = profileRepository.movieStateStreamGetter
        .listen((event) {
          if (event.isWatchlisted == false) {
            state.maybeWhen(
              success: (data) {
                final currentList = data.results?.toList() ?? [];
                currentList.removeWhere((movie) => movie.id == event.movieId);
                emit(
                  RequestsState.success(
                    ApiResponse(
                      page: data.page,
                      totalPages: data.totalPages,
                      totalResultsItems: (data.totalResultsItems ?? 1) - 1,
                      results: currentList,
                    ),
                  ),
                );
              },
              orElse: () {},
            );
          } else if (event.isWatchlisted == true) {
            getWatchlistMovies(forceReload: true);
          }
        });
  }

  // Todo: Add pagination support for watchlist movies
  Future<void> getWatchlistMovies({
    int page = 1,
    bool forceReload = false,
  }) async {
    final isAlreadyLoaded = state.maybeWhen(
      success: (_) => true,
      orElse: () => false,
    );
    if (isAlreadyLoaded && !forceReload) {
      return;
    }

    emit(const RequestsState.loading());
    final result = await profileRepository.getWatchlistMovies(page);
    result.when(
      success: (data) => emit(RequestsState.success(data)),
      failure: (failure) => emit(RequestsState.error(failure)),
    );
  }

  @override
  Future<void> close() {
    _movieStateStreamSubscription.cancel();
    return super.close();
  }
}
