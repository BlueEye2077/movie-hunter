import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/repository/profile_repository.dart';
import 'watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  final ProfileRepository profileRepository;

  WatchlistCubit({required this.profileRepository})
    : super(const WatchlistState.initial());

  void isMovieWatchlisted(int movieId) async {
    emit(const WatchlistState.loading());
    final response = await profileRepository.getMovieAccountStates(movieId);

    response.when(
      success: (data) {
        emit(WatchlistState.success(data.watchlist));
      },
      failure: (failure) {
        emit(WatchlistState.error(failure));
      },
    );
  }

  void toggleWatchlist(int movieId, bool currentWatchlistStatus) async {
    emit(const WatchlistState.loading());
    final response = await profileRepository.toggleWatchlist(
      movieId,
      !currentWatchlistStatus,
    );
    response.when(
      success: (data) {
        emit(WatchlistState.success(!currentWatchlistStatus));
      },
      failure: (failure) {
        emit(WatchlistState.error(failure));
      },
    );
  }
}
