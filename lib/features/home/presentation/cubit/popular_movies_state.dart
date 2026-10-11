part of 'popular_movies_cubit.dart';

@freezed
class PopularMoviesState with _$PopularMoviesState {
  const factory PopularMoviesState.idle() = _Idle;
  const factory PopularMoviesState.loading() = _Loading;
  const factory PopularMoviesState.success(
    PaginatedList<MovieEntity> movies,
  ) = _Success;
  const factory PopularMoviesState.error(NetworkExceptions error) = _Error;
}

