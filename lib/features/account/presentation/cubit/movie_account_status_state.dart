part of 'movie_account_status_cubit.dart';

@freezed
class MovieAccountStatusState with _$MovieAccountStatusState {
  const factory MovieAccountStatusState.idle() = _Idle;
  const factory MovieAccountStatusState.loading() = _Loading;
  const factory MovieAccountStatusState.success(
    MovieAccountStatusEntity status,
  ) = _Success;
  const factory MovieAccountStatusState.error(NetworkExceptions error) = _Error;
}
