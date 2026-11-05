part of 'all_movies_cubit.dart';

@freezed
sealed class AllMoviesState with _$AllMoviesState {
  const factory AllMoviesState.idle() = Idle;
  const factory AllMoviesState.loadingAllMovies() = LoadingAllMovies;
  const factory AllMoviesState.successAllMovies({
    required List<MovieEntity> movies,
    NetworkExceptions? paginationError,
    @Default(false) bool isLoadingPagination,
  }) = SuccessAllMovies;
  const factory AllMoviesState.errorAllMovies(
    NetworkExceptions networkExceptions,
  ) = ErrorAllMovies;
}
