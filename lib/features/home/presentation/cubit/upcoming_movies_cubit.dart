import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/models/paginated_list.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/domain/entities/movie_entity.dart';
import '../../domain/usecases/get_upcoming_movies_usecase.dart';

part 'upcoming_movies_cubit.freezed.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesCubit extends Cubit<UpComingMoviesState> {
  final GetUpcomingMoviesUseCase _getUpcomingMoviesUseCase;

  UpcomingMoviesCubit({
    required GetUpcomingMoviesUseCase getUpcomingMoviesUseCase,
  }) : _getUpcomingMoviesUseCase = getUpcomingMoviesUseCase,
       super(const UpComingMoviesState.idle());

  // Get upcoming movies
  Future<void> getUpcomingMovies() async {
    emit(const UpComingMoviesState.loading());
    final response = await _getUpcomingMoviesUseCase();
    if (isClosed) return;
    response.when(
      success: (movies) => emit(UpComingMoviesState.success(movies)),
      failure: (error) => emit(UpComingMoviesState.error(error)),
    );
  }

  Future<void> getUpComingMovies() => getUpcomingMovies();
}
