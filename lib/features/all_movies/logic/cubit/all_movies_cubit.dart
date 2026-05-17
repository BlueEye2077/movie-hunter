import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_hunter/core/networking/api_response.dart';
import 'package:movie_hunter/core/networking/api_result.dart';
import 'package:movie_hunter/core/networking/network_exceptions.dart';
import 'package:movie_hunter/features/home/data/models/movie.dart';
import 'package:movie_hunter/features/home/data/repository/home_repository.dart';

part 'all_movies_state.dart';
part 'all_movies_cubit.freezed.dart';

enum Category {
  nowPlayingMovies,
  popularMovies,
  topRatedMovies,
  upcomingMovies,
}

class AllMoviesCubit extends Cubit<AllMoviesState> {
  final HomeRepository homeRepository;
  AllMoviesCubit({required this.homeRepository}) : super(AllMoviesState.idle());

  late Category _category;
  int _currentPage = 1;
  late int _totalPages;
  final List<Movie> _movies = [];
  bool _isFetching = false;

  void fetchFirstPage(Category category) async {
    if (_isFetching) return;
    if (_currentPage >= _totalPages) return;

    _isFetching = true;
    _category = category; 

    ApiResult<ApiResponse<Movie>> result = await getMoviesByCategory(
      _currentPage,
    );

    result.when(
      success: (data) {
        _currentPage = data.page ?? 0;
        _totalPages = data.totalPages ?? 0;
        _movies.addAll(data.results ?? []);
      },
      failure: (failure) {
        return failure;
      },
    );
  }

  Future<ApiResult<ApiResponse<Movie>>> getMoviesByCategory(int page) async {
    switch (_category) {
      case Category.nowPlayingMovies:
        return homeRepository.getNowPlayingMovies();
      case Category.popularMovies:
        return homeRepository.getPopularMovies();
      case Category.topRatedMovies:
        return homeRepository.getTopRatedMovies();
      case Category.upcomingMovies:
        return homeRepository.getUpcomingMovies();
    }
  }
}
