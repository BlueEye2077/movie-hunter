part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.idle() = _Idle;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.success(UserSessionEntity session) = _Success;
  const factory AuthState.error(NetworkExceptions error) = _Error;
}
