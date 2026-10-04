import 'package:flutter/material.dart';

import '../models/genre.dart';
import '../models/movie.dart';
import 'movies_browser_grid_view.dart';
import 'movies_browser_list_view.dart';

class MoviesBrowserSwitcher extends StatelessWidget {
  const MoviesBrowserSwitcher({
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
          ? MoviesBrowserGridView(
              key: const ValueKey('grid'),
              movies: movies,
              genres: genres,
              isLoadingMore: isLoadingPagination,
              scrolledMovieIndex: scrolledMovieIndex,
            )
          : MoviesBrowserListView(
              key: const ValueKey('list'),
              movies: movies,
              genres: genres,
              isLoadingMore: isLoadingPagination,
              scrolledMovieIndex: scrolledMovieIndex,
            ),
    );
  }
}
