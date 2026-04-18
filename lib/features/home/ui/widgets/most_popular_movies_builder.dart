import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/core/networking/network_exceptions.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/core/theming/styles.dart';
import 'package:movie_hunter/features/home/data/models/genre.dart';
import 'package:movie_hunter/features/home/data/models/movie_api_response.dart';
import 'package:movie_hunter/features/home/logic/cubit/requests_state.dart';
import 'package:movie_hunter/features/home/logic/cubit/popular_movies_cubit.dart';
import 'package:movie_hunter/features/home/ui/widgets/movie_section/movies_section.dart';
import 'package:movie_hunter/features/home/logic/cubit/genres_cubit.dart';

class MostPopularMoviesBuilder extends StatelessWidget {
  const MostPopularMoviesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final genresState = context.watch<GenresCubit>().state;
    final List<Genre> genres = genresState.when(
      idle: () => [],
      loading: () => [],
      success: (g) => g,
      error: (_) => [],
    );
    // The bloc that controls the popular movies
    return BlocBuilder<PopularMoviesCubit, RequestsState<MovieApiResponse>>(
      builder: (context, state) {
        return state.when(
          idle: () => const SizedBox.shrink(),
          loading: () => MoviesSection(
            title: 'Most Popular',
            movies: [],
            genres: [],
            isShimmer: true,
          ),
          success: (response) {
            return MoviesSection(
              title: 'Most Popular',
              movies: response.movies ?? [],
              genres: genres,
              isShimmer: false,
            );
          },
          error: (error) => SizedBox(
            height: 270.h,
            child: Center(
              child: Text(
                NetworkExceptions.getErrorMessage(error),
                style: TextStyles.font14Regular.copyWith(
                  color: AppColors.textWhite,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
