import 'package:flutter/material.dart';

import '../domain/entities/movie_entity.dart';
import '../genres/domain/entities/genre_entity.dart';
import 'movies_browser_grid_view.dart';
import 'movies_browser_list_view.dart';

class MoviesBrowserSwitcher extends StatelessWidget {
  const MoviesBrowserSwitcher({
    super.key,
    required this.isGridView,
    required this.movies,
    this.genres = const [],
    required this.isLoadingPagination,
    required this.scrolledMovieIndex,
  });
  final bool isGridView;
  final List<MovieEntity> movies;
  final List<GenreEntity> genres;
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
              genres: genres,
              isLoadingMore: isLoadingPagination,
              scrolledMovieIndex: scrolledMovieIndex,
            ),
    );
  }
}
