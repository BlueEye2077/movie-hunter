import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/network_exceptions.dart';

part 'requests_state.freezed.dart';

@freezed
class RequestsState<T> with _$RequestsState<T> {
  const factory RequestsState.idle() = Idle<T>;
  const factory RequestsState.loading() = Loading<T>;
  const factory RequestsState.success(T data) = Success<T>;
  const factory RequestsState.error(NetworkExceptions networkException) = Error<T>;
}
