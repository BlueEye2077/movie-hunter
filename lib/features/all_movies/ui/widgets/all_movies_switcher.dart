import 'package:flutter/material.dart';

import '../../../home/data/models/genre.dart';
import '../../../home/data/models/movie.dart';
import 'all_movies_grid_view.dart';
import 'all_movies_list_view.dart';

class AllMoviesSwitcher extends StatelessWidget {
  const AllMoviesSwitcher({
    super.key,
    required this.isGridView,
    required this.movies,
    required this.genres,
    required this.isLoadingPagination,
    required this.scrolledMovieIndex,
  });
  final bool isGridView;
  final List<Movie> movies;
  final List<Genre> genres;
  final bool isLoadingPagination;
  final int scrolledMovieIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: isGridView
          ? AllMoviesGridView(
              key: const ValueKey('grid'),
              movies: movies,
              genres: genres,
              isLoadingMore: isLoadingPagination,
              scrolledMovieIndex: scrolledMovieIndex,
            )
          : AllMoviesListView(
              key: const ValueKey('list'),
              movies: movies,
              genres: genres,
              isLoadingMore: isLoadingPagination,
              scrolledMovieIndex: scrolledMovieIndex,
            ),
    );
  }
}
