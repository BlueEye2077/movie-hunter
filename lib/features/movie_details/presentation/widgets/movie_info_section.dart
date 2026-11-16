import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/theming/app_strings.dart';
import '../cubit/movie_details_cubit.dart';
import 'movie_info_row.dart';

class MovieInfoSection extends StatelessWidget {
  final MovieEntity movie;

  const MovieInfoSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final fallbackYear = movie.releaseYear.isNotEmpty
        ? movie.releaseYear
        : null;
    final fallbackGenre =
        movie.genreNames != null && movie.genreNames!.isNotEmpty
        ? movie.genreNames!.first
        : null;

    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        return state.when(
          idle: () => MovieInfoRow(
            year: fallbackYear ?? AppStrings.notAvailableDash,
            genre: fallbackGenre,
            isLoading: true,
          ),
          loading: () => MovieInfoRow(
            year: fallbackYear ?? AppStrings.notAvailableDash,
            genre: fallbackGenre,
            isLoading: true,
          ),
          success: (details) => MovieInfoRow(
            year: details.year ?? fallbackYear ?? AppStrings.notAvailableDash,
            formattedRuntime: details.formattedRuntime,
            genre: details.genres.isNotEmpty
                ? details.genres.first.name
                : fallbackGenre,
            isLoading: false,
          ),
          error: (_) => MovieInfoRow(
            year: fallbackYear ?? AppStrings.notAvailableDash,
            genre: fallbackGenre,
            isLoading: false,
          ),
        );
      },
    );
  }
}

