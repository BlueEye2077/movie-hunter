import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/networking/requests_state.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/models/genre.dart';
import '../../../../core/models/movie.dart';
import '../../../home/presentation/cubit/genres_cubit.dart';
import '../../../home/presentation/widgets/movie_section/movies_list_view.dart';
import '../../../home/presentation/widgets/movie_section/movies_section.dart';
import '../../../../features/search/ui/widgets/empty_search.dart';
import '../../logic/cubit/watchlist_movies_cubit.dart';

class ProfileWatchlistSection extends StatelessWidget {
  const ProfileWatchlistSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistMoviesCubit, RequestsState<ApiResponse<Movie>>>(
      builder: (context, state) {
        return state.when(
          idle: () => MoviesSection(
            title: AppStrings.watchlist,
            child: const MoviesListView.shimmer(),
          ),
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
            final genresState = getIt<GenresCubit>().state;
            final List<Genre> genresList = genresState.whenOrNull(
              success: (g) => g,
            ) ?? [];

            return MoviesSection(
              title: AppStrings.watchlist,
              onSeeAllTap: () => Navigator.pushNamed(context, Routes.watchlist),
              child: MoviesListView.showMovies(movies: movies, genres: genresList),
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
