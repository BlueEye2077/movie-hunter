import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/genre.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../domain/usecases/get_genres_usecase.dart';

part 'genres_cubit.freezed.dart';
part 'genres_state.dart';

class GenresCubit extends Cubit<GenresState> {
  final GetGenresUseCase _getGenresUseCase;

  GenresCubit({required GetGenresUseCase getGenresUseCase})
      : _getGenresUseCase = getGenresUseCase,
        super(const GenresState.idle());

  void getGenres() async {
    // Avoid redundant network requests if genres are already loaded
    final isAlreadyLoaded = state.maybeWhen(
      success: (_) => true,
      orElse: () => false,
    );
    if (isAlreadyLoaded) return;

    emit(const GenresState.loading());
    final result = await _getGenresUseCase();
    if (isClosed) return;
    result.when(
      success: (genres) => emit(GenresState.success(genres)),
      failure: (networkExceptions) => emit(GenresState.error(networkExceptions)),
    );
  }
}
