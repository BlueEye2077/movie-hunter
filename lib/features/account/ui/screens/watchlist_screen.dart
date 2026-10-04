import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/movies_browser_scaffold.dart';
import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/requests_state.dart';
import '../../../../core/theming/app_strings.dart';
import '../../logic/cubit/watchlist_movies_cubit.dart';
import '../../../../core/models/genre.dart';
import '../../../../core/models/movie.dart';
import '../../../home/logic/cubit/genres_cubit.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final genresState = context.watch<GenresCubit>().state;
    final List<Genre> genres = genresState.whenOrNull(success: (g) => g) ?? [];

    return BlocBuilder<WatchlistMoviesCubit, RequestsState<ApiResponse<Movie>>>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const MoviesBrowserScaffold(
            title: AppStrings.watchlist,
            genres: [],
            movies: [],
            isLoadingPagination: false,
            isLoading: true,
          ),
          success: (response) {
            return MoviesBrowserScaffold(
              title: AppStrings.watchlist,
              genres: genres,
              movies: response.results ?? [],
              isLoadingPagination: false,
              isLoading: false,
            );
          },
          error: (error) => MoviesBrowserScaffold(
            title: AppStrings.watchlist,
            movies: const [],
            genres: genres,
            isLoading: false,
            isLoadingPagination: false,
            emptyMessage: 'Failed to load watchlist movies',
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
