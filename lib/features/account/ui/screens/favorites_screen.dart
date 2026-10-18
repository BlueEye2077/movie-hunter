import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/movies_browser_scaffold.dart';
import '../../../../core/genres/domain/entities/genre_entity.dart';
import '../../../../core/models/movie.dart';
import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/requests_state.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/genres/cubit/genres_cubit.dart';
import '../../logic/cubit/favorite_movies_cubit.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Todo: remove GenresCubit from UI after refactoring this feature to enrich MovieEntity in the domain layer
    final List<GenreEntity> genres = context.select<GenresCubit, List<GenreEntity>>(
      (cubit) => cubit.state.whenOrNull(success: (g) => g) ?? const [],
    );

    return BlocBuilder<FavoriteMoviesCubit, RequestsState<ApiResponse<Movie>>>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const MoviesBrowserScaffold(
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
