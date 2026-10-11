import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/genre.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../all_movies/data/models/all_movies_args.dart';
import '../cubit/genres_cubit.dart';
import '../cubit/now_playing_movies_cubit.dart';
import 'movie_section/home_movie_section_content.dart';

class NowPlayingMoviesBuilder extends StatelessWidget {
  const NowPlayingMoviesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final genresState = context.watch<GenresCubit>().state;
    final List<Genre> genres = genresState.when(
      idle: () => [],
      loading: () => [],
      success: (g) => g,
      error: (_) => [],
    );
    return BlocBuilder<NowPlayingMoviesCubit, NowPlayingMoviesState>(
      builder: (context, state) {
        return state.when(
          idle: () => const SizedBox.shrink(),
          loading: () => HomeMovieSectionContent(
            title: AppStrings.nowPlaying,
            category: MovieCategory.nowPlayingMovies,
            genres: genres,
            isLoading: true,
          ),
          success: (response) => HomeMovieSectionContent(
            title: AppStrings.nowPlaying,
            category: MovieCategory.nowPlayingMovies,
            genres: genres,
            movies: response.results,
          ),
          error: (error) => HomeMovieSectionContent(
            title: AppStrings.nowPlaying,
            category: MovieCategory.nowPlayingMovies,
            genres: genres,
            error: error,
          ),
        );
      },
    );
  }
}
