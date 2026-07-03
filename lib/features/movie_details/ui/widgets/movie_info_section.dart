import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/requests_state.dart';
import '../../../home/data/models/movie.dart';
import '../../logic/cubit/movie_details_cubit.dart';
import '../../logic/cubit/movie_details_state.dart';
import 'movie_info_row.dart';

class MovieInfoSection extends StatelessWidget {
  final Movie movie;
  const MovieInfoSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, RequestsState<MovieDetailsData>>(
      buildWhen: (prev, curr) => curr is Success || curr is Error,
      builder: (context, state) {
        return state.when(
          idle: () => MovieInfoRow(releaseDate: movie.releaseDate),
          loading: () => MovieInfoRow(releaseDate: movie.releaseDate),
          success: (data) => MovieInfoRow(
            releaseDate: data.details.releaseDate ?? movie.releaseDate,
            runtime: data.details.runtime,
            genre: data.details.genres?.isNotEmpty == true
                ? data.details.genres!.first.name
                : null,
          ),
          error: (_) => MovieInfoRow(releaseDate: movie.releaseDate),
        );
      },
    );
  }
}
