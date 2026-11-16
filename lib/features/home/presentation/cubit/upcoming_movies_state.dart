part of 'upcoming_movies_cubit.dart';

@freezed
class UpComingMoviesState with _$UpComingMoviesState {
  const factory UpComingMoviesState.idle() = _Idle;
  const factory UpComingMoviesState.loading() = _Loading;
  const factory UpComingMoviesState.success(
    PaginatedList<MovieEntity> movies,
  ) = _Success;
  const factory UpComingMoviesState.error(NetworkExceptions error) = _Error;
}

