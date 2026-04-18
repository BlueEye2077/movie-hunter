import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hunter/core/networking/api_result.dart';
import 'package:movie_hunter/features/home/data/models/movie_api_response.dart';
import 'package:movie_hunter/features/home/data/repository/home_repository.dart';
import 'package:movie_hunter/features/home/logic/cubit/requests_state.dart';

class TopRatedMoviesCubit extends Cubit<RequestsState<MovieApiResponse>> {
  TopRatedMoviesCubit({required this.homeRepository}) : super(RequestsState.idle());

  final HomeRepository homeRepository;

  // Get top rated movies
  void getTopRatedMovies() async {
    emit(RequestsState.loading());
    ApiResult<MovieApiResponse> response = await homeRepository.getTopRatedMovies();
    response.when(
      success: (MovieApiResponse topRatedMovies) =>
          emit(RequestsState.success(topRatedMovies)),
      failure: (networkExceptions) =>
          emit(RequestsState.error(networkExceptions)),
    );
  }
}