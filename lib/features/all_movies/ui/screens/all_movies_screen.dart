import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/requests_state.dart';
import '../../../../core/theming/colors.dart';
import '../../../home/data/models/genre.dart';
import '../../../home/data/models/movie.dart';
import '../../../home/logic/cubit/genres_cubit.dart';
import '../../data/models/all_movies_args.dart';
import '../../helpers/scroll_index_calculator.dart';
import '../../logic/cubit/all_movies_cubit.dart';
import '../widgets/all_movies_app_bar.dart';
import '../widgets/all_movies_switcher.dart';

class AllMoviesScreen extends StatefulWidget {
  final AllMoviesArgs args;

  const AllMoviesScreen({super.key, required this.args});

  @override
  State<AllMoviesScreen> createState() => _AllMoviesScreenState();
}

class _AllMoviesScreenState extends State<AllMoviesScreen> {
  bool _isGridView = false;
  String get title => widget.args.title;
  int _currentScrollMovieIndex = 0;

  @override
  Widget build(BuildContext context) {
    final genresState = context.watch<GenresCubit>().state;
    final List<Genre> genres = genresState.when(
      idle: () => [],
      loading: () => [],
      success: (g) => g,
      error: (_) => [],
    );

    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AllMoviesAppBar(
        title: title,
        isGridView: _isGridView,
        onViewChanged: (isGrid) => setState(() => _isGridView = isGrid),
      ),
      body: BlocBuilder<AllMoviesCubit, AllMoviesState>(
        builder: (context, state) {
          final List<Movie> currentMovies = context
              .read<AllMoviesCubit>()
              .movies;
          final isLoadingPagination = state is LoadingPaginationAllMovies;

          return NotificationListener(
            onNotification: (ScrollNotification notification) {
              if (notification is ScrollEndNotification) {
                final double pixels = notification.metrics.pixels;
                final double max = notification.metrics.maxScrollExtent;
                final int trigger = 200;

                if (pixels >= max - trigger) {
                  context.read<AllMoviesCubit>().fetchNextPage();
                }
              }
              if (notification is ScrollUpdateNotification) {
                // Get the current pixels of the scroll view
                final double pixels = notification.metrics.pixels;

                // Get the maximum index of the movies list
                final int maxMoviesListIndex = currentMovies.isNotEmpty
                    ? currentMovies.length - 1
                    : 0;

                if (_isGridView) {
                  _currentScrollMovieIndex =
                      ScrollIndexCalculator.getCurrentGridViewScrollMovieIndex(
                        fullScreenWidth: MediaQuery.of(context).size.width,
                        maxMoviesListIndex: maxMoviesListIndex,
                        maxScrollPixels: pixels,
                      );
                } else {
                  _currentScrollMovieIndex =
                      ScrollIndexCalculator.getCurrentListViewScrollMovieIndex(
                        maxMoviesListIndex: maxMoviesListIndex,
                        maxScrollPixels: pixels,
                      );
                }
              }
              return false;
            },
            child: AllMoviesSwitcher(
              isGridView: _isGridView,
              movies: currentMovies,
              genres: genres,
              isLoadingPagination: isLoadingPagination,
              scrolledMovieIndex: _currentScrollMovieIndex,
            ),
          );
        },
      ),
    );
  }
}
