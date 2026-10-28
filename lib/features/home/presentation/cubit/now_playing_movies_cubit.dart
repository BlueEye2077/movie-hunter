import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/models/paginated_list.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/domain/entities/movie_entity.dart';
import '../../domain/usecases/get_now_playing_movies_usecase.dart';

part 'now_playing_movies_cubit.freezed.dart';
part 'now_playing_movies_state.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  final GetNowPlayingMoviesUseCase _getNowPlayingMoviesUseCase;

  NowPlayingMoviesCubit({
    required GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase,
  }) : _getNowPlayingMoviesUseCase = getNowPlayingMoviesUseCase,
       super(const NowPlayingMoviesState.idle());

  // Get now playing movies
  Future<void> getNowPlayingMovies() async {
    emit(const NowPlayingMoviesState.loading());
    final response = await _getNowPlayingMoviesUseCase();
    if (isClosed) return;
    response.when(
      success: (movies) => emit(NowPlayingMoviesState.success(movies)),
      failure: (error) => emit(NowPlayingMoviesState.error(error)),
    );
  }
}
