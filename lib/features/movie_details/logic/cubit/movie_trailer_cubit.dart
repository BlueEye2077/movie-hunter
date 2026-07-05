import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/networking/requests_state.dart';
import '../../data/models/movie_video.dart';
import '../../data/repository/movie_details_repository.dart';

class MovieTrailerCubit extends Cubit<RequestsState<String>> {
  final MovieDetailsRepository movieDetailsRepository;

  MovieTrailerCubit({required this.movieDetailsRepository})
    : super(const RequestsState.idle());

  void getMovieTrailer(int movieId) async {
    emit(const RequestsState.loading());
    final result = await movieDetailsRepository.getMovieVideos(movieId);

    result.when(
      success: (data) {
        final videos = data.results ?? [];
        // 1. Try to find official trailer
        MovieVideo? trailer = videos
            .where(
              (v) =>
                  v.site == 'YouTube' &&
                  v.type == 'Trailer' &&
                  v.official == true,
            )
            .firstOrNull;

        // 2. Try to find any trailer
        trailer ??= videos
            .where((v) => v.site == 'YouTube' && v.type == 'Trailer')
            .firstOrNull;

        // 3. Try to find official teaser
        trailer ??= videos
            .where(
              (v) =>
                  v.site == 'YouTube' &&
                  v.type == 'Teaser' &&
                  v.official == true,
            )
            .firstOrNull;

        if (trailer != null && trailer.key != null) {
          emit(RequestsState.success(trailer.key!));
        } else {
          emit(
            const RequestsState.error(
              NetworkExceptions.defaultError(
                "No trailer available for this movie",
              ),
            ),
          );
        }
      },
      failure: (error) {
        emit(RequestsState.error(error));
      },
    );
  }
}
