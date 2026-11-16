import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_result.dart';

import '../../../../core/networking/network_exceptions.dart';
import '../../domain/entities/movie_credits_entity.dart';
import '../../domain/usecases/get_movie_credits_usecase.dart';

part 'movie_credits_cubit.freezed.dart';
part 'movie_credits_state.dart';

class MovieCreditsCubit extends Cubit<MovieCreditsState> {
  final GetMovieCreditsUseCase _getMovieCreditsUseCase;

  MovieCreditsCubit({required this._getMovieCreditsUseCase})
    : super(const MovieCreditsState.idle());

  Future<void> fetchMovieCredits(int movieId) async {
    if (state is _Loading) return;
    emit(const MovieCreditsState.loading());

    final result = await _getMovieCreditsUseCase(movieId);
    if (isClosed) return;

    result.when(
      success: (credits) => emit(MovieCreditsState.success(credits)),
      failure: (error) => emit(MovieCreditsState.error(error)),
    );
  }
}
