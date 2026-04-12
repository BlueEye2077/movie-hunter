import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hunter/core/networking/api_result.dart';
import 'package:movie_hunter/features/home/data/models/movie_api_response.dart';
import 'package:movie_hunter/features/home/data/repository/home_repository.dart';
import 'package:movie_hunter/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState<MovieApiResponse>> {
  HomeCubit({required this.homeRepository}) : super(HomeState.idle());

  final HomeRepository homeRepository;

  void getUpComingMovies() async {
    emit(HomeState.loading());
    var response = await homeRepository.getUpcomingMovies();
    response.when(
      success: (MovieApiResponse upComingMovies) =>
          emit(HomeState.success(upComingMovies)),
      failure: (networkExceptions) => emit(HomeState.error(networkExceptions)),
    );
  }

  void getPopularMovies() async {
    emit(HomeState.loading());
    var response = await homeRepository.getPopularMovies();
    response.when(
      success: (MovieApiResponse upComingMovies) =>
          emit(HomeState.success(upComingMovies)),
      failure: (networkExceptions) => emit(HomeState.error(networkExceptions)),
    );
  }

}
