part of 'all_movies_cubit.dart';

@freezed
class AllMoviesState<T> with _$AllMoviesState<T> {
  const factory AllMoviesState.idle() = Idle<T>;
  const factory AllMoviesState.loading() = Loading<T>;
  const factory AllMoviesState.loadingAllMovies() = LoadingAllMovies<T>;
  const factory AllMoviesState.loadingPaginationAllMovies() =
      LoadingPaginationAllMovies<T>;
  const factory AllMoviesState.successPaginationAllMovies(T data) =
      SuccessPaginationAllMovies<T>;
  const factory AllMoviesState.successAllMovies(T data) = SuccessAllMovies<T>;
  const factory AllMoviesState.error(NetworkExceptions networkExceptions) =
      Error<T>;
}
