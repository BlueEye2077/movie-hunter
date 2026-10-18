import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../networking/api_result.dart';
import '../../networking/network_exceptions.dart';
import '../domain/entities/genre_entity.dart';
import '../domain/usecases/get_genres_usecase.dart';

part 'genres_cubit.freezed.dart';
part 'genres_state.dart';

class GenresCubit extends Cubit<GenresState> {
  final GetGenresUseCase _getGenresUseCase;

  GenresCubit({required GetGenresUseCase getGenresUseCase})
    : _getGenresUseCase = getGenresUseCase,
      super(const GenresState.idle());

  Future<void> getGenres() async {
    if (state is _Success || state is _Loading) return;
    emit(const GenresState.loading());
    final result = await _getGenresUseCase();
    if (isClosed) return;
    result.when(
      success: (genres) => emit(GenresState.success(genres)),
      failure: (networkExceptions) =>
          emit(GenresState.error(networkExceptions)),
    );
  }
}
