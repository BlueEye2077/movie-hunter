part of 'movie_trailer_cubit.dart';

@freezed
class MovieTrailerState with _$MovieTrailerState {
  const factory MovieTrailerState.idle() = _Idle;
  const factory MovieTrailerState.loading() = _Loading;
  const factory MovieTrailerState.success(String youtubeKey) = _Success;
  const factory MovieTrailerState.noTrailer() = _NoTrailer;
  const factory MovieTrailerState.error(NetworkExceptions error) = _Error;
}

