part of 'top_rated_movies_cubit.dart';

@freezed
class TopRatedMoviesState with _$TopRatedMoviesState {
  const factory TopRatedMoviesState.idle() = _Idle;
  const factory TopRatedMoviesState.loading() = _Loading;
  const factory TopRatedMoviesState.success(
    PaginatedList<MovieEntity> movies,
  ) = _Success;
  const factory TopRatedMoviesState.error(NetworkExceptions error) = _Error;
}

