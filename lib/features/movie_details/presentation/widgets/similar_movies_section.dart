import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/error_retry_view.dart';
import '../../../../core/common/movies_browser_scaffold.dart';
import '../../../../core/common/movies_list_view.dart';
import '../../../../core/common/movies_section.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../cubit/similar_movies_cubit.dart';

class SimilarMoviesSection extends StatelessWidget {
  final int movieId;

  const SimilarMoviesSection({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
      builder: (context, state) {
        return state.when(
          idle: () => const SizedBox.shrink(),
          loading: () => const MoviesSection(
            title: AppStrings.similarMovies,
            child: MoviesListView.shimmer(),
          ),
          success: (movies) {
            return MoviesSection(
              title: AppStrings.similarMovies,
              onSeeAllTap: movies.isEmpty
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MoviesBrowserScaffold(
                            title: AppStrings.similarMovies,
                            movies: movies,
                            isLoading: false,
                            isLoadingPagination: false,
                          ),
                        ),
                      );
                    },
              child: movies.isEmpty
                  ? SizedBox(
                      height: 120.h,
                      child: Center(
                        child: Text(
                          AppStrings.noSimilarMoviesFound,
                          style: TextStyles.font14Regular.copyWith(
                            color: AppColors.textDarkGrey,
                          ),
                        ),
                      ),
                    )
                  : MoviesListView.showMovies(movies: movies),
            );
          },
          error: (error) {
            return MoviesSection(
              title: AppStrings.similarMovies,
              child: ErrorRetryView(
                message: NetworkExceptions.getErrorMessage(error),
                onRetry: () =>
                    context.read<SimilarMoviesCubit>().getSimilarMovies(movieId),
              ),
            );
          },
        );
      },
    );
  }
}

