import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../account/data/repository/profile_repository.dart';
import '../../../home/data/models/movie.dart';
import '../../../home/data/repository/home_repository.dart';
import '../../data/models/all_movies_args.dart';

part 'all_movies_cubit.freezed.dart';
part 'all_movies_state.dart';

class AllMoviesCubit extends Cubit<AllMoviesState> {
  final HomeRepository homeRepository;
  final ProfileRepository? profileRepository;

  AllMoviesCubit({
    required this.homeRepository,
    this.profileRepository,
  }) : super(AllMoviesState.idle());

  late MovieCategory _category;
  int _currentPage = 1;
  int _totalPages = 2;
  final List<Movie> _movies = [];
  List<Movie> get movies => UnmodifiableListView(_movies);
  bool _isFetching = false;

  void setInitial({
    required List<Movie> movies,
    required MovieCategory category,
  }) {
    if (_isFetching) return;
    if (_currentPage >= _totalPages) return;
    if (_movies.isEmpty) {
      _movies.addAll(movies);
    }
    _category = category;

    emit(AllMoviesState.successAllMovies());
  }

  void fetchNextPage() async {
    if (_isFetching) return;
    if (_currentPage >= _totalPages) return;

    _isFetching = true;
    emit(AllMoviesState.loadingPaginationAllMovies());

    ApiResult<ApiResponse<Movie>> result = await getMoviesByCategory(
      _currentPage + 1,
    );

    if (isClosed) return;

    result.when(
      success: (data) {
        _currentPage = data.page ?? 1;
        _totalPages = data.totalPages ?? 1;
        _movies.addAll(data.results ?? []);
        _isFetching = false;
        emit(AllMoviesState.successPaginationAllMovies(_movies));
      },
      failure: (NetworkExceptions networkExceptions) {
        _isFetching = false;
        emit(AllMoviesState.errorPaginationAllMovies(networkExceptions));
      },
    );
  }

  Future<ApiResult<ApiResponse<Movie>>> getMoviesByCategory(int page) {
    switch (_category) {
      case MovieCategory.nowPlayingMovies:
        return homeRepository.getNowPlayingMovies(page: page);
      case MovieCategory.popularMovies:
        return homeRepository.getPopularMovies(page: page);
      case MovieCategory.topRatedMovies:
        return homeRepository.getTopRatedMovies(page: page);
      case MovieCategory.upcomingMovies:
        return homeRepository.getUpcomingMovies(page: page);
      case MovieCategory.favoriteMovies:
        return profileRepository!.getFavoriteMovies(page);
      case MovieCategory.watchlistMovies:
        return profileRepository!.getWatchlistMovies(page);
    }
  }
}
