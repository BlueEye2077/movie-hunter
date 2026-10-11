import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/models/paginated_list.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';

part 'top_rated_movies_cubit.freezed.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  final GetTopRatedMoviesUseCase _getTopRatedMoviesUseCase;

  TopRatedMoviesCubit({
    required GetTopRatedMoviesUseCase getTopRatedMoviesUseCase,
  }) : _getTopRatedMoviesUseCase = getTopRatedMoviesUseCase,
       super(const TopRatedMoviesState.idle());

  // Get top rated movies
  Future<void> getTopRatedMovies() async {
    emit(const TopRatedMoviesState.loading());
    final response = await _getTopRatedMoviesUseCase();
    if (isClosed) return;
    response.when(
      success: (movies) => emit(TopRatedMoviesState.success(movies)),
      failure: (error) => emit(TopRatedMoviesState.error(error)),
    );
  }
}
