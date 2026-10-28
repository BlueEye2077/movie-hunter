import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_strings.dart';
import '../../../all_movies/domain/entities/all_movies_source.dart';
import '../cubit/popular_movies_cubit.dart';
import 'movie_section/home_movie_section_content.dart';

class MostPopularMoviesBuilder extends StatelessWidget {
  const MostPopularMoviesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
      builder: (context, state) {
        return state.when(
          idle: () => const SizedBox.shrink(),
          loading: () => const HomeMovieSectionContent(
            title: AppStrings.mostPopular,
            source: AllMoviesSource.popular(),
            isLoading: true,
          ),
          success: (response) => HomeMovieSectionContent(
            title: AppStrings.mostPopular,
            source: const AllMoviesSource.popular(),
            movies: response.results,
          ),
          error: (error) => HomeMovieSectionContent(
            title: AppStrings.mostPopular,
            source: const AllMoviesSource.popular(),
            error: error,
          ),
        );
      },
    );
  }
}
