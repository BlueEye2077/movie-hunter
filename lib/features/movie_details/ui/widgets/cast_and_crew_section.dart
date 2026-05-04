import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/logic/cubit/requests_state.dart';
import '../../logic/cubit/movie_details_cubit.dart';
import '../../logic/cubit/movie_details_state.dart';
import 'cast_and_crew_shimmer.dart';
import 'movie_cast_and_crew.dart';

class CastAndCrewSection extends StatelessWidget {
  const CastAndCrewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, RequestsState<MovieDetailsData>>(
      builder: (context, state) {
        return state.when(
          idle: () => const SizedBox.shrink(),
          loading: () => const CastAndCrewShimmer(),
          success: (data) => MovieCastAndCrew(
            cast: data.credits.cast ?? [],
            crew: data.credits.crew ?? [],
          ),
          error: (_) => const SizedBox.shrink(),
        );
      },
    );
  }
}
