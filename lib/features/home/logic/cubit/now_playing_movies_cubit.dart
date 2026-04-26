import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/movie.dart';
import '../../data/repository/home_repository.dart';
import 'requests_state.dart';

class NowPlayingMoviesCubit extends Cubit<RequestsState<ApiResponse<Movie>>> {
  final HomeRepository homeRepository;
  NowPlayingMoviesCubit({required this.homeRepository})
    : super(const RequestsState.idle());

  // Get now playing movies
  Future<void> getNowPlayingMovies() async {
    emit(const RequestsState.loading());
    var response = await homeRepository.getNowPlayingMovies();
    response.when(
      success: (movies) {
        emit(RequestsState.success(movies));
      },
      failure: (error) {
        emit(RequestsState.error(error));
      },
    );
  }
}
