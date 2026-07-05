import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/requests_state.dart';
import '../../data/models/movie.dart';
import '../../data/repository/home_repository.dart';

class UpComingMoviesCubit extends Cubit<RequestsState<ApiResponse<Movie>>> {
  UpComingMoviesCubit({required this.homeRepository})
    : super(RequestsState.idle());

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
