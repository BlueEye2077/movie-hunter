import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/networking/requests_state.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../features/all_movies/data/models/all_movies_args.dart';
import '../../../../features/home/data/models/movie.dart';
import '../../../../features/home/ui/widgets/movie_section/movies_list_view.dart';
import '../../../../features/home/ui/widgets/movie_section/movies_section.dart';
import '../../../../features/search/ui/widgets/empty_search.dart';
import '../../logic/cubit/watchlist_movies_cubit.dart';

class ProfileWatchlistSection extends StatelessWidget {
  const ProfileWatchlistSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistMoviesCubit, RequestsState<ApiResponse<Movie>>>(
      builder: (context, state) {
        return state.when(
          idle: () => const SizedBox.shrink(),
          loading: () => MoviesSection(
            title: AppStrings.watchlist,
            child: const MoviesListView.shimmer(),
          ),
          success: (response) {
            final movies = response.results ?? [];
            if (movies.isEmpty) {
              return MoviesSection(
                title: AppStrings.watchlist,
                child: SizedBox(
                  height: 200.h,
                  child: const Center(
                    child: EmptySearch(
                      svgPath: 'assets/svgs/no_results_large.svg',
                      iconSize: 60,
                      title: AppStrings.noWatchlist,
                      subtitle: AppStrings.noWatchlistSubtitle,
                    ),
                  ),
                ),
              );
            }
            return MoviesSection(
              title: AppStrings.watchlist,
              onSeeAllTap: () => Navigator.pushNamed(
                context,
                Routes.allMovies,
                arguments: AllMoviesArgs(
                  title: AppStrings.watchlist,
                  movies: movies,
                  category: MovieCategory.watchlistMovies,
                ),
              ),
              child: MoviesListView.showMovies(movies: movies, genres: const []),
            );
          },
          error: (error) => MoviesSection(
            title: AppStrings.watchlist,
            child: SizedBox(
              height: 200.h,
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
