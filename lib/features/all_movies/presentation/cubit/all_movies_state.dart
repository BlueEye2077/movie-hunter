part of 'all_movies_cubit.dart';

@freezed
sealed class AllMoviesState with _$AllMoviesState {
  const factory AllMoviesState.idle() = Idle;
  const factory AllMoviesState.loadingAllMovies() = LoadingAllMovies;
  const factory AllMoviesState.successAllMovies(List<MovieEntity> movies) =
      SuccessAllMovies;
  const factory AllMoviesState.errorAllMovies(
    NetworkExceptions networkExceptions,
  ) = ErrorAllMovies;

  const factory AllMoviesState.loadingPaginationAllMovies(
    List<MovieEntity> movies,
  ) = LoadingPaginationAllMovies;
  const factory AllMoviesState.successPaginationAllMovies(
    List<MovieEntity> movies,
  ) = SuccessPaginationAllMovies;
  const factory AllMoviesState.errorPaginationAllMovies(
    List<MovieEntity> movies,
    NetworkExceptions networkExceptions,
  ) = ErrorPaginationAllMovies;
}

extension AllMoviesStateX on AllMoviesState {
  List<MovieEntity> get currentMovies => switch (this) {
    SuccessAllMovies(:final movies) => movies,
    LoadingPaginationAllMovies(:final movies) => movies,
    SuccessPaginationAllMovies(:final movies) => movies,
    ErrorPaginationAllMovies(:final movies) => movies,
    _ => const [],
  };
}
