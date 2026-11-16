import 'package:flutter/material.dart';

import '../domain/entities/movie_entity.dart';
import 'movies_browser_grid_view.dart';
import 'movies_browser_list_view.dart';

class MoviesBrowserSwitcher extends StatelessWidget {
  const MoviesBrowserSwitcher({
    super.key,
    required this.isGridView,
    required this.movies,
    required this.isLoadingPagination,
    required this.scrolledMovieIndex,
  });
  final bool isGridView;
  final List<MovieEntity> movies;
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
              isLoadingMore: isLoadingPagination,
              scrolledMovieIndex: scrolledMovieIndex,
            )
          : MoviesBrowserListView(
              key: const ValueKey('list'),
              movies: movies,
              isLoadingMore: isLoadingPagination,
              scrolledMovieIndex: scrolledMovieIndex,
            ),
    );
  }
}
