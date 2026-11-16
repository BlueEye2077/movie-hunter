part of 'person_details_cubit.dart';

@freezed
class PersonDetailsState with _$PersonDetailsState {
  const factory PersonDetailsState.idle() = _Idle;
  const factory PersonDetailsState.loading() = _Loading;
  const factory PersonDetailsState.success(PersonDetailsEntity person) =
      _Success;
  const factory PersonDetailsState.error(NetworkExceptions error) = _Error;
}

