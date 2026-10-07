import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import '../models/genre.dart';
import '../models/movie.dart';
import '../theming/text_styles.dart';
import 'movie_shimmer_list_view.dart';
import 'movies_browser_app_bar.dart';
import 'movies_browser_switcher.dart';
import 'scroll_index_calculator.dart';

class MoviesBrowserScaffold extends StatefulWidget {
  final String title;
  final List<Movie> movies;
  final List<Genre> genres;
  final bool isLoading;
  final bool isLoadingPagination;
  final VoidCallback? onFetchNextPage;
  final String? emptyMessage;

  const MoviesBrowserScaffold({
    super.key,
    required this.title,
    required this.movies,
    required this.genres,
    required this.isLoading,
    required this.isLoadingPagination,
    this.onFetchNextPage,
    this.emptyMessage,
  });

  @override
  State<MoviesBrowserScaffold> createState() => _MoviesBrowserScaffoldState();
}

class _MoviesBrowserScaffoldState extends State<MoviesBrowserScaffold> {
  bool _isGridView = false;
  int _currentScrollMovieIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: MoviesBrowserAppBar(
        title: widget.title,
        isGridView: _isGridView,
        onViewChanged: (isGrid) => setState(() => _isGridView = isGrid),
      ),
      body: widget.isLoading
          ? const MovieShimmerListView()
          : widget.movies.isEmpty
          ? Center(
              child: Text(
                widget.emptyMessage ?? 'No movies found.',
                style: TextStyles.font18Regular.copyWith(
                  color: AppColors.textWhite,
                ),
              ),
            )
          : NotificationListener(
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollEndNotification) {
                  final double pixels = notification.metrics.pixels;
                  final double max = notification.metrics.maxScrollExtent;
                  final int trigger = 200;

                  if (pixels >= max - trigger) {
                    widget.onFetchNextPage?.call();
                  }
                }
                if (notification is ScrollUpdateNotification) {
                  // Get the current pixels of the scroll view
                  final double pixels = notification.metrics.pixels;

                  // Get the maximum index of the movies list
                  final int maxMoviesListIndex = widget.movies.isNotEmpty
                      ? widget.movies.length - 1
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
              child: MoviesBrowserSwitcher(
                isGridView: _isGridView,
                movies: widget.movies,
                genres: widget.genres,
                isLoadingPagination: widget.isLoadingPagination,
                scrolledMovieIndex: _currentScrollMovieIndex,
              ),
            ),
    );
  }
}
