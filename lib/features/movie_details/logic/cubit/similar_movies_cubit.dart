import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/requests_state.dart';
import '../../../home/data/models/movie.dart';
import '../../data/repository/movie_details_repository.dart';

class SimilarMoviesCubit extends Cubit<RequestsState<List<Movie>>> {
  final MovieDetailsRepository movieDetailsRepository;

  SimilarMoviesCubit({required this.movieDetailsRepository})
    : super(const RequestsState.idle());

  void getSimilarMovies(int movieId) async {
    emit(const RequestsState.loading());
    final result = await movieDetailsRepository.getSimilarMovies(movieId);

    result.when(
      success: (data) {
        emit(RequestsState.success(data.results ?? []));
      },
      failure: (error) {
        emit(RequestsState.error(error));
      },
    );
  }
}
