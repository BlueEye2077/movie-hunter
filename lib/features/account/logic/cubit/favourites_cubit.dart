import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../data/models/movie_action_status_response.dart';
import '../../data/repository/profile_repository.dart';

part 'favourites_state.dart';
part 'favourites_cubit.freezed.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  final ProfileRepository profileRepository;
  FavouritesCubit({required this.profileRepository})
    : super(FavouritesState.idle());

  bool isFavorite = false;

  void isMovieFavorite(int movieId) async {
    emit(FavouritesState.loading());
    final response = await profileRepository.getMovieAccountStates(movieId);
    response.when(
      success: (data) {
        isFavorite = data.favorite;
        isFavorite
            ? emit(FavouritesState.isFavourite())
            : emit(FavouritesState.isNotFavourite());
      },
      failure: (failure) => emit(FavouritesState.error(failure)),
    );
  }

  void toggleFavorite(int movieId) async {
    emit(FavouritesState.loading());
    final ApiResult<MovieActionStatusResponse> response =
        await profileRepository.toggleFavorite(movieId, !isFavorite);
    response.when(
      success: (data) {
        isFavorite = !isFavorite;
        isFavorite
            ? emit(FavouritesState.addedToFavourites())
            : emit(FavouritesState.removedFromFavourites());
      },
      failure: (failure) {
        emit(FavouritesState.error(failure));
      },
    );
  }
}
