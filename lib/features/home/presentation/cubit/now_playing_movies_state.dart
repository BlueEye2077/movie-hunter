part of 'now_playing_movies_cubit.dart';

@freezed
class NowPlayingMoviesState with _$NowPlayingMoviesState {
  const factory NowPlayingMoviesState.idle() = _Idle;
  const factory NowPlayingMoviesState.loading() = _Loading;
  const factory NowPlayingMoviesState.success(
    PaginatedList<MovieEntity> movies,
  ) = _Success;
  const factory NowPlayingMoviesState.error(NetworkExceptions error) = _Error;
}

