import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/core/networking/network_exceptions.dart';
import 'package:movie_hunter/core/theming/styles.dart';
import 'package:movie_hunter/core/networking/api_response.dart';
import 'package:movie_hunter/features/home/data/models/movie.dart';
import 'package:movie_hunter/features/home/logic/cubit/upcoming_movies_cubit.dart';
import 'package:movie_hunter/features/home/logic/cubit/requests_state.dart';
import 'package:movie_hunter/features/home/ui/widgets/upcoming_movies/upcoming_movies_carousel.dart';

class UpcomingMoviesBuilder extends StatelessWidget {
  const UpcomingMoviesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    // The bloc that controls the upcoming movies
    return BlocBuilder<UpComingMoviesCubit, RequestsState<ApiResponse<Movie>>>(
      builder: (context, state) {
        return state.when(
          idle: () => const SizedBox.shrink(),
          loading: () => const UpcomingMoviesCarousel.showShimmer(),
          success: (response) {
            final movies = response.results ?? [];
            return UpcomingMoviesCarousel.showCarousel(upComingMovies: movies);
          },
          error: (error) => SizedBox(
            height: 174.h,
            child: Center(
              child: Text(
                NetworkExceptions.getErrorMessage(error),
                style: TextStyles.font14Regular,
              ),
            ),
          ),
        );
      },
    );
  }
}
