import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_exceptions.dart';

part 'api_result.freezed.dart';

@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  factory ApiResult.success(T data) = Success<T>;
  factory ApiResult.failure(NetworkExceptions error) = Failure<T>;
}
