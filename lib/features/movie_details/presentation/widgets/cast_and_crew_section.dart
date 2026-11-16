import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/error_retry_view.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../cubit/movie_credits_cubit.dart';
import 'cast_and_crew_shimmer.dart';
import 'movie_cast_and_crew.dart';

class CastAndCrewSection extends StatelessWidget {
  final int movieId;

  const CastAndCrewSection({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCreditsCubit, MovieCreditsState>(
      builder: (context, state) {
        return state.when(
          idle: () => const SizedBox.shrink(),
          loading: () => const CastAndCrewShimmer(),
          success: (credits) => MovieCastAndCrew(credits: credits),
          error: (error) => ErrorRetryView(
            message: NetworkExceptions.getErrorMessage(error),
            onRetry: () =>
                context.read<MovieCreditsCubit>().fetchMovieCredits(movieId),
          ),
        );
      },
    );
  }
}

