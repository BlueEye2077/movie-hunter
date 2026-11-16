part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.idle() = _Idle;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.success(SearchResultsEntity results) = _Success;
  const factory SearchState.empty() = _Empty;
  const factory SearchState.error(NetworkExceptions error) = _Error;
}

