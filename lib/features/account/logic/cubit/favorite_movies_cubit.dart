import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/requests_state.dart';
import '../../../home/data/models/movie.dart';
import '../../data/repository/profile_repository.dart';

class FavoriteMoviesCubit extends Cubit<RequestsState<ApiResponse<Movie>>> {
  final ProfileRepository profileRepository;
  late final StreamSubscription _movieStateStreamSubscription;

  FavoriteMoviesCubit({required this.profileRepository})
      : super(const RequestsState.idle()) {
    _movieStateStreamSubscription =
        profileRepository.movieStateStreamGetter.listen((event) {
      if (event.isFavorite == false) {
        state.maybeWhen(
          success: (data) {
            final currentList = data.results?.toList() ?? [];
            currentList.removeWhere((movie) => movie.id == event.movieId);
            emit(RequestsState.success(ApiResponse(
              page: data.page,
              totalPages: data.totalPages,
              totalResultsItems: (data.totalResultsItems ?? 1) - 1,
              results: currentList,
            )));
          },
          orElse: () {},
        );
      } else if (event.isFavorite == true) {
        getFavoriteMovies();
      }
    });
  }
  Future<void> getFavoriteMovies({int page = 1}) async {
    emit(const RequestsState.loading());
    final result = await profileRepository.getFavoriteMovies(page);
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


