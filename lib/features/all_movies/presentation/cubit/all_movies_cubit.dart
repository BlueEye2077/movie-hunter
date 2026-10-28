import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/domain/models/paginated_list.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../domain/entities/all_movies_source.dart';
import '../../domain/usecases/get_movies_page_usecase.dart';

part 'all_movies_cubit.freezed.dart';
part 'all_movies_state.dart';

class AllMoviesCubit extends Cubit<AllMoviesState> {
  final GetMoviesPageUseCase getMoviesPageUseCase;

  AllMoviesCubit({required this.getMoviesPageUseCase})
    : super(const AllMoviesState.idle());

  late AllMoviesSource _source;

  int _currentPage = 1;
  int _totalPages = 2;
  final List<MovieEntity> _movies = [];
  List<MovieEntity> get movies => UnmodifiableListView(_movies);
  bool _isFetching = false;

  void setInitial({
    required List<MovieEntity> movies,
    required AllMoviesSource source,
  }) {
    _source = source;
    if (_isFetching) return;
    if (_currentPage >= _totalPages) return;
    if (_movies.isEmpty) {
      _movies.addAll(movies);
    }

    if (_movies.isEmpty) {
      _currentPage = 0;
      fetchNextPage();
      return;
    }

    emit(AllMoviesState.successAllMovies(List.unmodifiable(_movies)));
  }

  Future<void> fetchNextPage() async {
    if (_isFetching) return;
    if (_currentPage >= _totalPages) return;

    final bool isInitialLoad = _movies.isEmpty;
    _isFetching = true;
    emit(
      isInitialLoad
          ? const AllMoviesState.loadingAllMovies()
          : AllMoviesState.loadingPaginationAllMovies(
              List.unmodifiable(_movies),
            ),
    );

    final ApiResult<PaginatedList<MovieEntity>> result =
        await getMoviesPageUseCase(
          allMoviesSource: _source,
          page: _currentPage + 1,
        );

    if (isClosed) return;

    result.when(
      success: (data) {
        _currentPage = data.page;
        _totalPages = data.totalPages;
        final existingIds = _movies.map((m) => m.id).toSet();
        final newMovies = data.results.where(
          (m) => m.id == null || !existingIds.contains(m.id),
        );
        _movies.addAll(newMovies);
        _isFetching = false;
        final unmodifiableMovies = List<MovieEntity>.unmodifiable(_movies);
        emit(
          isInitialLoad
              ? AllMoviesState.successAllMovies(unmodifiableMovies)
              : AllMoviesState.successPaginationAllMovies(unmodifiableMovies),
        );
      },
      failure: (NetworkExceptions networkExceptions) {
        _isFetching = false;
        emit(
          isInitialLoad
              ? AllMoviesState.errorAllMovies(networkExceptions)
              : AllMoviesState.errorPaginationAllMovies(
                  List.unmodifiable(_movies),
                  networkExceptions,
                ),
        );
      },
    );
  }
}
