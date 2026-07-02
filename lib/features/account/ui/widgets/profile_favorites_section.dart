import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/networking/requests_state.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../features/home/data/models/movie.dart';
import '../../../../features/home/ui/widgets/movie_section/movies_list_view.dart';
import '../../../../features/home/ui/widgets/movie_section/movies_section.dart';
import '../../../../features/search/ui/widgets/empty_search.dart';
import '../../logic/cubit/favorite_movies_cubit.dart';

class ProfileFavoritesSection extends StatelessWidget {
  const ProfileFavoritesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteMoviesCubit, RequestsState<ApiResponse<Movie>>>(
      builder: (context, state) {
        return state.when(
          idle: () => const SizedBox.shrink(),
          loading: () => MoviesSection(
            title: AppStrings.favorites,
            child: const MoviesListView.shimmer(),
          ),
          success: (response) {
            final movies = response.results ?? [];
            if (movies.isEmpty) {
              return MoviesSection(
                title: AppStrings.favorites,
                child: SizedBox(
                  height: 200.h,
                  child: const Center(
                    child: EmptySearch(
                      svgPath: 'assets/svgs/heart.svg',
                      iconSize: 60,
                      title: AppStrings.noFavorites,
                      subtitle: AppStrings.noFavoritesSubtitle,
                    ),
                  ),
                ),
              );
            }
            return MoviesSection(
              title: AppStrings.favorites,
              child: MoviesListView.showMovies(movies: movies, genres: const []),
            );
          },
          error: (error) => MoviesSection(
            title: AppStrings.favorites,
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
