import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/core/networking/network_exceptions.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/core/theming/styles.dart';
import 'package:movie_hunter/features/home/data/models/movie_api_response.dart';
import 'package:movie_hunter/features/home/logic/cubit/requests_state.dart';
import 'package:movie_hunter/features/home/logic/cubit/popular_movies_cubit.dart';
import 'package:movie_hunter/features/home/ui/widgets/popular_movies/popular_movies_list_view.dart';

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    // The bloc that controls the popular movies
    return BlocBuilder<PopularMoviesCubit, RequestsState<MovieApiResponse>>(
      builder: (context, state) {
        return state.when(
          idle: () => const SizedBox.shrink(),
          loading: () => SizedBox(
            height: 270.h,
            child: const Center(child: CircularProgressIndicator()),
          ),
          success: (response) {
            final movies = response.movies ?? [];
            return PopularMoviesListView(movies: movies);
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
