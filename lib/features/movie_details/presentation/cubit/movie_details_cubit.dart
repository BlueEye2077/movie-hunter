import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';

part 'movie_details_cubit.freezed.dart';
part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;

  MovieDetailsCubit({required this._getMovieDetailsUseCase})
    : super(const MovieDetailsState.idle());

  Future<void> fetchMovieDetails(int movieId) async {
    if (state is _Loading) return;
    emit(const MovieDetailsState.loading());

    final result = await _getMovieDetailsUseCase(movieId);
    if (isClosed) return;

    result.when(
      success: (details) => emit(MovieDetailsState.success(details)),
      failure: (error) => emit(MovieDetailsState.error(error)),
    );
  }
}

