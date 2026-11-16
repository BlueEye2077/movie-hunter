part of 'account_details_cubit.dart';

@freezed
class AccountDetailsState with _$AccountDetailsState {
  const factory AccountDetailsState.idle() = _Idle;
  const factory AccountDetailsState.loading() = _Loading;
  const factory AccountDetailsState.success(AccountEntity account) = _Success;
  const factory AccountDetailsState.error(NetworkExceptions error) = _Error;
}

