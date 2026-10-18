import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_strings.dart';
import '../../../all_movies/data/models/all_movies_args.dart';
import '../cubit/top_rated_movies_cubit.dart';
import 'movie_section/home_movie_section_content.dart';

class TopRatedMoviesBuilder extends StatelessWidget {
  const TopRatedMoviesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
      builder: (context, state) {
        return state.when(
          idle: () => const SizedBox.shrink(),
          loading: () => const HomeMovieSectionContent(
            title: AppStrings.topRated,
            category: MovieCategory.topRatedMovies,
            isLoading: true,
          ),
          success: (response) => HomeMovieSectionContent(
            title: AppStrings.topRated,
            category: MovieCategory.topRatedMovies,
            movies: response.results,
          ),
          error: (error) => HomeMovieSectionContent(
            title: AppStrings.topRated,
            category: MovieCategory.topRatedMovies,
            error: error,
          ),
        );
      },
    );
  }
}
