import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/genres/cubit/genres_cubit.dart';
import '../../../../core/genres/domain/entities/genre_entity.dart';
import '../../../../core/models/movie.dart';
import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/networking/requests_state.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../features/search/ui/widgets/empty_search.dart';
import '../../../home/presentation/widgets/movie_section/movies_list_view.dart';
import '../../../home/presentation/widgets/movie_section/movies_section.dart';
import '../../logic/cubit/watchlist_movies_cubit.dart';

class ProfileWatchlistSection extends StatelessWidget {
  const ProfileWatchlistSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Todo: remove GenresCubit from UI after refactoring this feature to enrich MovieEntity in the domain layer
    final List<GenreEntity> genresList = context.select<GenresCubit, List<GenreEntity>>(
      (cubit) => cubit.state.whenOrNull(success: (g) => g) ?? const [],
    );

    return BlocBuilder<WatchlistMoviesCubit, RequestsState<ApiResponse<Movie>>>(
      builder: (context, state) {
        return state.when(
          idle: () => const MoviesSection(
            title: AppStrings.watchlist,
            child: MoviesListView.shimmer(),
          ),
          loading: () => const MoviesSection(
            title: AppStrings.watchlist,
            child: MoviesListView.shimmer(),
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
