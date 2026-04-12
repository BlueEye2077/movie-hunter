import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_hunter/core/networking/network_exceptions.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.idle() = Idle<T>;
  const factory HomeState.loading() = Loading<T>;
  const factory HomeState.success(T data) = Success<T>;
  const factory HomeState.error(NetworkExceptions networkException) = Error<T>;
}
