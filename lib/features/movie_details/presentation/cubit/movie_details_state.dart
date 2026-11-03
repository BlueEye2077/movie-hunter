part of 'movie_details_cubit.dart';

@freezed
class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState.idle() = _Idle;
  const factory MovieDetailsState.loading() = _Loading;
  const factory MovieDetailsState.success(MovieDetailsEntity movieDetails) =
      _Success;
  const factory MovieDetailsState.error(NetworkExceptions error) = _Error;
}

