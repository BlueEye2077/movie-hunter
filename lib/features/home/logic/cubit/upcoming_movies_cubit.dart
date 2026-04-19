import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hunter/core/networking/api_result.dart';
import 'package:movie_hunter/core/networking/api_response.dart';
import 'package:movie_hunter/features/home/data/models/movie.dart';
import 'package:movie_hunter/features/home/data/repository/home_repository.dart';
import 'package:movie_hunter/features/home/logic/cubit/requests_state.dart';

class UpComingMoviesCubit extends Cubit<RequestsState<ApiResponse<Movie>>> {
  UpComingMoviesCubit({required this.homeRepository}) : super(RequestsState.idle());

  final HomeRepository homeRepository;

  // Get upcoming movies
  void getUpComingMovies() async {
    emit(RequestsState.loading());
    var response = await homeRepository.getUpcomingMovies();
    response.when(
      success: (ApiResponse<Movie> upComingMovies) =>
          emit(RequestsState.success(upComingMovies)),
      failure: (networkExceptions) =>
          emit(RequestsState.error(networkExceptions)),
    );
  }
}
