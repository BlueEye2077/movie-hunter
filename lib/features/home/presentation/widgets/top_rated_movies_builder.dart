import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/genre.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../all_movies/data/models/all_movies_args.dart';
import '../cubit/genres_cubit.dart';
import '../cubit/top_rated_movies_cubit.dart';
import 'movie_section/home_movie_section_content.dart';

class TopRatedMoviesBuilder extends StatelessWidget {
  const TopRatedMoviesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final genresState = context.watch<GenresCubit>().state;
    final List<Genre> genres = genresState.when(
      idle: () => [],
      loading: () => [],
      success: (g) => g,
      error: (_) => [],
    );
    return BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
      builder: (context, state) {
        return state.when(
          idle: () => const SizedBox.shrink(),
          loading: () => HomeMovieSectionContent(
            title: AppStrings.topRated,
            category: MovieCategory.topRatedMovies,
            genres: genres,
            isLoading: true,
          ),
          success: (response) => HomeMovieSectionContent(
            title: AppStrings.topRated,
            category: MovieCategory.topRatedMovies,
            genres: genres,
            movies: response.results,
          ),
          error: (error) => HomeMovieSectionContent(
            title: AppStrings.topRated,
            category: MovieCategory.topRatedMovies,
            genres: genres,
            error: error,
          ),
        );
      },
    );
  }
}
