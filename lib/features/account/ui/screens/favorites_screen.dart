import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hunter/core/common/movies_browser_scaffold.dart';
import 'package:movie_hunter/core/networking/api_response.dart';
import 'package:movie_hunter/core/networking/requests_state.dart';
import 'package:movie_hunter/core/theming/app_strings.dart';
import 'package:movie_hunter/features/account/logic/cubit/favorite_movies_cubit.dart';
import 'package:movie_hunter/features/home/data/models/genre.dart';
import 'package:movie_hunter/features/home/data/models/movie.dart';
import 'package:movie_hunter/features/home/logic/cubit/genres_cubit.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final genresState = context.watch<GenresCubit>().state;
    final List<Genre> genres = genresState.whenOrNull(success: (g) => g) ?? [];

    return BlocBuilder<FavoriteMoviesCubit, RequestsState<ApiResponse<Movie>>>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => MoviesBrowserScaffold(
            title: AppStrings.favorites,
            genres: [],
            movies: [],
            isLoadingPagination: false,
            isLoading: true,
          ),
          success: (response) {
            return MoviesBrowserScaffold(
              title: AppStrings.favorites,
              genres: genres,
              movies: response.results ?? [],
              isLoadingPagination: false,
              isLoading: false,
            );
          },
          error: (error) => MoviesBrowserScaffold(
            title: AppStrings.favorites,
            movies: const [],
            genres: genres,
            isLoading: false,
            isLoadingPagination: false,
            emptyMessage: 'Failed to load favorite movies',
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
