part of 'favourites_cubit.dart';

@freezed
class FavouritesState<T> with _$FavouritesState<T> {
  const factory FavouritesState.idle() = Idle<T>;
  const factory FavouritesState.loading() = Loading<T>;
  const factory FavouritesState.isFavourite() = IsFavourite<T>;
  const factory FavouritesState.isNotFavourite() = IsNotFavourite<T>;
  const factory FavouritesState.addedToFavourites() =
      AddedToFavourites<T>;
  const factory FavouritesState.removedFromFavourites() =
      RemovedFromFavourites<T>;
  const factory FavouritesState.error(NetworkExceptions networkException) =
      Error<T>;
}
