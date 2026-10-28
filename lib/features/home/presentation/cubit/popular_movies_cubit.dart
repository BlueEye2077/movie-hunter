import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/models/paginated_list.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/domain/entities/movie_entity.dart';
import '../../domain/usecases/get_popular_movies_usecase.dart';

part 'popular_movies_cubit.freezed.dart';
part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;

  PopularMoviesCubit({
    required GetPopularMoviesUseCase getPopularMoviesUseCase,
  }) : _getPopularMoviesUseCase = getPopularMoviesUseCase,
       super(const PopularMoviesState.idle());

  // Get popular movies
  Future<void> getPopularMovies() async {
    emit(const PopularMoviesState.loading());
    final response = await _getPopularMoviesUseCase();
    if (isClosed) return;
    response.when(
      success: (movies) => emit(PopularMoviesState.success(movies)),
      failure: (error) => emit(PopularMoviesState.error(error)),
    );
  }
}
