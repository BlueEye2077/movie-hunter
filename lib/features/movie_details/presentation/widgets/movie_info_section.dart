import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/theming/app_strings.dart';
import '../cubit/movie_details_cubit.dart';
import 'movie_info_row.dart';

class MovieInfoSection extends StatelessWidget {
  final MovieEntity movie;

  const MovieInfoSection({super.key, required this.movie});

  static String? _safeYear(String? date) {
    if (date == null || date.isEmpty) return null;
    final parsed = DateTime.tryParse(date);
    if (parsed != null) return parsed.year.toString();
    if (date.length >= 4) return date.substring(0, 4);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final fallbackYear = _safeYear(movie.releaseDate);
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

