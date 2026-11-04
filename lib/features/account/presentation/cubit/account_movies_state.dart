part of 'account_movies_cubit.dart';

@freezed
class AccountMoviesState with _$AccountMoviesState {
  const factory AccountMoviesState.idle() = _Idle;
  const factory AccountMoviesState.loading() = _Loading;
  const factory AccountMoviesState.success({
    required List<MovieEntity> movies,
    required int totalResults,
    @Default(false) bool isLoadingPagination,
    NetworkExceptions? paginationError,
  }) = _Success;
  const factory AccountMoviesState.error(NetworkExceptions error) = _Error;
}
