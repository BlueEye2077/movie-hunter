import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/networking/network_exceptions.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/networking/api_response.dart';
import '../../../data/models/movie.dart';
import '../../../logic/cubit/upcoming_movies_cubit.dart';
import '../../../logic/cubit/requests_state.dart';
import 'upcoming_movies_carousel.dart';
import 'upcoming_movies_shimmer.dart';

class UpcomingMoviesBuilder extends StatelessWidget {
  const UpcomingMoviesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    // The bloc that controls the upcoming movies
    return BlocBuilder<UpComingMoviesCubit, RequestsState<ApiResponse<Movie>>>(
      builder: (context, state) {
        return state.when(
          idle: () => const SizedBox.shrink(),
          loading: () => const UpcomingMoviesShimmer(),
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
