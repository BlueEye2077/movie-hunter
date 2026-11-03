import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_result.dart';

import '../../../../core/networking/network_exceptions.dart';
import '../../domain/usecases/get_movie_trailer_usecase.dart';

part 'movie_trailer_cubit.freezed.dart';
part 'movie_trailer_state.dart';

class MovieTrailerCubit extends Cubit<MovieTrailerState> {
  final GetMovieTrailerUseCase _getMovieTrailerUseCase;
  String? _cachedTrailerKey;

  MovieTrailerCubit({required GetMovieTrailerUseCase getMovieTrailerUseCase})
    : _getMovieTrailerUseCase = getMovieTrailerUseCase,
      super(const MovieTrailerState.idle());

  Future<void> getMovieTrailer(int movieId) async {
    if (_cachedTrailerKey != null) {
      emit(const MovieTrailerState.idle());
      emit(MovieTrailerState.success(_cachedTrailerKey!));
      return;
    }
    emit(const MovieTrailerState.loading());
    final response = await _getMovieTrailerUseCase(movieId);
    if (isClosed) return;
    response.when(
      success: (key) {
        if (key != null && key.isNotEmpty) {
          _cachedTrailerKey = key;
          emit(MovieTrailerState.success(key));
        } else {
          emit(const MovieTrailerState.noTrailer());
        }
      },
      failure: (error) => emit(MovieTrailerState.error(error)),
    );
  }
}
