import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/models/paginated_list.dart';
import '../../../../core/models/movie.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../../../home/domain/repos/home_repository.dart';
import '../../data/models/all_movies_args.dart';

part 'all_movies_cubit.freezed.dart';
part 'all_movies_state.dart';

class AllMoviesCubit extends Cubit<AllMoviesState> {
  final HomeRepository homeRepository;

  AllMoviesCubit({required this.homeRepository})
    : super(AllMoviesState.idle());

  late MovieCategory _category;
  int? _entityId;
  int _currentPage = 1;
  int _totalPages = 2;
  final List<Movie> _movies = [];
  List<Movie> get movies => UnmodifiableListView(_movies);
  bool _isFetching = false;

  void setInitial({
    required List<Movie> movies,
    required MovieCategory category,
    int? entityId,
  }) {
    if (_isFetching) return;
    if (_currentPage >= _totalPages) return;
    if (_movies.isEmpty) {
      _movies.addAll(movies);
    }
    _category = category;
    _entityId = entityId;
    if (category == MovieCategory.staticList) {
      _totalPages = 1;
    }

    emit(AllMoviesState.successAllMovies());
  }

  void fetchNextPage() async {
    if (_isFetching) return;
    if (_currentPage >= _totalPages) return;

    _isFetching = true;
    emit(AllMoviesState.loadingPaginationAllMovies());

    ApiResult<PaginatedList<MovieEntity>> result = await getMoviesByCategory(
      _currentPage + 1,
    );

    if (isClosed) return;

    result.when(
      success: (data) {
        _currentPage = data.page;
        _totalPages = data.totalPages;
        _movies.addAll(data.results.map((e) => e.toMovie()));
        _isFetching = false;
        emit(AllMoviesState.successPaginationAllMovies(_movies));
      },
      failure: (NetworkExceptions networkExceptions) {
        _isFetching = false;
        emit(AllMoviesState.errorPaginationAllMovies(networkExceptions));
      },
    );
  }

  Future<ApiResult<PaginatedList<MovieEntity>>> getMoviesByCategory(int page) {
    switch (_category) {
      case MovieCategory.nowPlayingMovies:
        return homeRepository.getNowPlayingMovies(page: page);
      case MovieCategory.popularMovies:
        return homeRepository.getPopularMovies(page: page);
      case MovieCategory.topRatedMovies:
        return homeRepository.getTopRatedMovies(page: page);
      case MovieCategory.upcomingMovies:
        return homeRepository.getUpcomingMovies(page: page);
      case MovieCategory.genreMovies:
        return homeRepository.getMoviesByGenre(
          genreId: _entityId ?? 0,
          page: page,
        );
      case MovieCategory.staticList:
        return Future.value(
          ApiResult.success(
            const PaginatedList(page: 1, totalPages: 1, results: []),
          ),
        );
    }
  }
}
