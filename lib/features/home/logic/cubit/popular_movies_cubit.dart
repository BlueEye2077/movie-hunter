import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/movie.dart';
import '../../data/repository/home_repository.dart';
import 'requests_state.dart';

class PopularMoviesCubit extends Cubit<RequestsState<ApiResponse<Movie>>> {
  PopularMoviesCubit({required this.homeRepository})
    : super(RequestsState.idle());

  final HomeRepository homeRepository;

  void getPopularMovies() async {
    emit(RequestsState.loading());
    
    ApiResult<ApiResponse<Movie>> response = await homeRepository.getPopularMovies();
    response.when(
      success: (movies) => emit(RequestsState.success(movies)),
      failure: (networkExceptions) =>
          emit(RequestsState.error(networkExceptions)),
    );
  }
}
