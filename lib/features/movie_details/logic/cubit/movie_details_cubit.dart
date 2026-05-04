import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../../home/logic/cubit/requests_state.dart';
import '../../data/models/movie_credits_response.dart';
import '../../data/models/movie_details_response.dart';
import '../../data/repository/movie_details_repository.dart';
import 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<RequestsState<MovieDetailsData>> {
  final MovieDetailsRepository movieDetailsRepository;

  MovieDetailsCubit({required this.movieDetailsRepository})
    : super(const RequestsState.idle());

  void fetchMovieDetails(int movieId) async {
    emit(const RequestsState.loading());

    // Fetch both details and credits in parallel
    final results = await Future.wait([
      movieDetailsRepository.getMovieDetails(movieId),
      movieDetailsRepository.getMovieCredits(movieId),
    ]);

    final detailsResult = results[0] as ApiResult<MovieDetailsResponse>;
    final creditsResult = results[1] as ApiResult<MovieCreditsResponse>;

    detailsResult.when(
      success: (details) {
        creditsResult.when(
          success: (credits) {
            emit(
              RequestsState.success(
                MovieDetailsData(details: details, credits: credits),
              ),
            );
          },
          failure: (error) => emit(RequestsState.error(error)),
        );
      },
      failure: (error) => emit(RequestsState.error(error)),
    );
  }
}
