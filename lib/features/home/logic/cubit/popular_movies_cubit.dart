import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hunter/core/networking/api_result.dart';
import 'package:movie_hunter/features/home/data/models/movie_api_response.dart';
import 'package:movie_hunter/features/home/data/repository/home_repository.dart';
import 'package:movie_hunter/features/home/logic/cubit/requests_state.dart';

class PopularMoviesCubit extends Cubit<RequestsState<MovieApiResponse>> {
  PopularMoviesCubit({required this.homeRepository}) : super(RequestsState.idle());

  final HomeRepository homeRepository;

  // Get popular movies
  void getPopularMovies() async {
    emit(RequestsState.loading());
    var response = await homeRepository.getPopularMovies();
    response.when(
      success: (MovieApiResponse popularMovies) =>
          emit(RequestsState.success(popularMovies)),
      failure: (networkExceptions) => emit(RequestsState.error(networkExceptions)),
    );
  }
}
