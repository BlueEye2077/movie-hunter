import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../domain/entities/search_results_entity.dart';
import '../../domain/usecases/search_usecase.dart';

part 'search_cubit.freezed.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase _searchUseCase;
  final Duration _debounceDuration;

  Timer? _debounceTimer;
  String _latestQuery = '';

  SearchCubit({
    required SearchUseCase searchUseCase,
    Duration debounceDuration = const Duration(milliseconds: 400),
  }) : _searchUseCase = searchUseCase,
       _debounceDuration = debounceDuration,
       super(const SearchState.idle());

  String get currentQuery => _latestQuery;

  /// This method is called whenever the search query changes. It debounces the input to avoid making too many requests in a short period of time.
  void onQueryChanged(String rawQuery) {
    // If the query is empty, cancel everything and emit the idle state.
    final trimmedQuery = rawQuery.trim();
    if (trimmedQuery.isEmpty) {
      _debounceTimer?.cancel();
      _latestQuery = "";
      emit(const SearchState.idle());
      return;
    }

    _debounceTimer?.cancel();
    // If the query is the same as the last one and we're not in the idle or error state, do nothing.
    if (trimmedQuery == _latestQuery && state is! _Idle && state is! _Error) {
      return;
    }
    // If the query is different, start a new one, then do the search after the debounce duration.
    _debounceTimer = Timer(_debounceDuration, () {
      search(trimmedQuery);
    });
  }

  /// Performs the search operation using the provided query. It emits different states based on the result of the search operation.
  Future<void> search(String query) async {
    _latestQuery = query;
    emit(const SearchState.loading());
    final response = await _searchUseCase(query);

    // Guard against Race Conditions & Emit-After-Close:
    // Why could `query != _latestQuery` be true if we set `_latestQuery = query` above?
    // Because while this execution was suspended at `await _searchUseCase(query)` waiting for the network,
    // the user might have initiated a NEW search (e.g. "superman" right after "bat").
    // The second call overwrote `_latestQuery` to "superman". When this earlier "bat" request finally
    // finishes here, `query` ("bat") no longer matches `_latestQuery` ("superman").
    // We discard this stale result so outdated responses never overwrite newer ones on screen.
    if (isClosed || query != _latestQuery) {
      return;
    }
    response.when(
      success: (data) {
        if (data.isEmpty) {
          emit(const SearchState.empty());
        } else {
          emit(SearchState.success(data));
        }
      },
      failure: (error) => emit(SearchState.error(error)),
    );
  }

  /// Retries the last non-empty query after an error.
  void retry() {
    if (_latestQuery.isNotEmpty) {
      search(_latestQuery);
    }
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
