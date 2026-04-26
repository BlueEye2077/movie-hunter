import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/genre.dart';
import '../../../../core/networking/api_response.dart';
import '../../data/models/movie.dart';
import '../../logic/cubit/requests_state.dart';
import '../../logic/cubit/top_rated_movies_cubit.dart';
import 'movie_section/movies_section.dart';
import 'movie_section/movies_list_view.dart';
import '../../logic/cubit/genres_cubit.dart';

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
    // The bloc that controls the top rated movies
    return BlocBuilder<TopRatedMoviesCubit, RequestsState<ApiResponse<Movie>>>(
      builder: (context, state) {
        return state.when(
          idle: () => const SizedBox.shrink(),
          loading: () => MoviesSection(
            title: 'Top Rated',
            child: const MoviesListView.shimmer(),
          ),
          success: (response) {
            return MoviesSection(
              title: 'Top Rated',
              child: MoviesListView.showMovies(
                movies: response.results ?? [],
                genres: genres,
              ),
            );
          },
          error: (error) => MoviesSection(
            title: 'Top Rated',
            child: SizedBox(
              height: 245.h,
              child: Center(
                child: Text(
                  NetworkExceptions.getErrorMessage(error),
                  style: TextStyles.font14Regular.copyWith(
                    color: AppColors.textWhite,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
