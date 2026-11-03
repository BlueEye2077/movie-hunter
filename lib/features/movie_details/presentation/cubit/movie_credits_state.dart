part of 'movie_credits_cubit.dart';

@freezed
class MovieCreditsState with _$MovieCreditsState {
  const factory MovieCreditsState.idle() = _Idle;
  const factory MovieCreditsState.loading() = _Loading;
  const factory MovieCreditsState.success(MovieCreditsEntity credits) =
      _Success;
  const factory MovieCreditsState.error(NetworkExceptions error) = _Error;
}

