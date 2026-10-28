import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_strings.dart';
import '../../../all_movies/domain/entities/all_movies_source.dart';
import '../cubit/now_playing_movies_cubit.dart';
import 'movie_section/home_movie_section_content.dart';

class NowPlayingMoviesBuilder extends StatelessWidget {
  const NowPlayingMoviesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMoviesCubit, NowPlayingMoviesState>(
      builder: (context, state) {
        return state.when(
          idle: () => const SizedBox.shrink(),
          loading: () => const HomeMovieSectionContent(
            title: AppStrings.nowPlaying,
            source: AllMoviesSource.nowPlaying(),
            isLoading: true,
          ),
          success: (response) => HomeMovieSectionContent(
            title: AppStrings.nowPlaying,
            source: const AllMoviesSource.nowPlaying(),
            movies: response.results,
          ),
          error: (error) => HomeMovieSectionContent(
            title: AppStrings.nowPlaying,
            source: const AllMoviesSource.nowPlaying(),
            error: error,
          ),
        );
      },
    );
  }
}
