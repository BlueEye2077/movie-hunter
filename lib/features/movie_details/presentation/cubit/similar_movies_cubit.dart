import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../domain/usecases/get_similar_movies_usecase.dart';

part 'similar_movies_cubit.freezed.dart';
part 'similar_movies_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  final GetSimilarMoviesUseCase _getSimilarMoviesUseCase;

  SimilarMoviesCubit({required GetSimilarMoviesUseCase getSimilarMoviesUseCase})
    : _getSimilarMoviesUseCase = getSimilarMoviesUseCase,
      super(const SimilarMoviesState.idle());

  Future<void> getSimilarMovies(int movieId) async {
    emit(const SimilarMoviesState.loading());

    final result = await _getSimilarMoviesUseCase(movieId);
    if (isClosed) return;

    result.when(
      success: (movies) => emit(SimilarMoviesState.success(movies)),
      failure: (error) => emit(SimilarMoviesState.error(error)),
    );
  }
}

