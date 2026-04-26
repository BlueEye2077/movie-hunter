import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/movie.dart';
import '../../data/repository/home_repository.dart';
import 'requests_state.dart';

class TopRatedMoviesCubit extends Cubit<RequestsState<ApiResponse<Movie>>> {
  TopRatedMoviesCubit({required this.homeRepository}) : super(RequestsState.idle());

  final HomeRepository homeRepository;

  // Get top rated movies
  void getTopRatedMovies() async {
    emit(RequestsState.loading());
    ApiResult<ApiResponse<Movie>> response = await homeRepository.getTopRatedMovies();
    response.when(
      success: (ApiResponse<Movie> topRatedMovies) =>
          emit(RequestsState.success(topRatedMovies)),
      failure: (networkExceptions) =>
          emit(RequestsState.error(networkExceptions)),
    );
  }
}