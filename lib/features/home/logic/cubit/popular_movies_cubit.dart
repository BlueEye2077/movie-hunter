import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hunter/core/networking/api_result.dart';
import 'package:movie_hunter/features/home/data/models/genre.dart';
import 'package:movie_hunter/features/home/data/models/movie_api_response.dart';
import 'package:movie_hunter/features/home/data/repository/home_repository.dart';
import 'package:movie_hunter/features/home/logic/cubit/requests_state.dart';

class PopularMoviesCubit extends Cubit<RequestsState<MovieApiResponse>> {
  PopularMoviesCubit({required this.homeRepository})
    : super(RequestsState.idle());

  final HomeRepository homeRepository;

  // Cached genres list
  List<Genre> allGenres = [];

  void getPopularMovies() async {
    emit(RequestsState.loading());

    // Fire both requests at the same time
    final results = await Future.wait([
      homeRepository.getPopularMovies(),
      homeRepository.getGenres(),
    ]);

    // Cache genres first in allGenres list
    (results[1] as ApiResult<List<Genre>>).when(
      success: (genres) => allGenres = genres,
      failure: (_) {},
    );

    // Emit movies
    (results[0] as ApiResult<MovieApiResponse>).when(
      success: (movies) => emit(RequestsState.success(movies)),
      failure: (networkExceptions) =>
          emit(RequestsState.error(networkExceptions)),
    );
  }

  // Return the cached genres list
  List<Genre> getGenreTitles() => allGenres;
}
