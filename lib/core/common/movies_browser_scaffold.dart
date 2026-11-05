import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../domain/entities/movie_entity.dart';
import '../genres/domain/entities/genre_entity.dart';
import '../theming/app_spacing.dart';
import '../theming/colors.dart';
import '../theming/text_styles.dart';
import 'movie_shimmer_list_view.dart';
import 'movies_browser_app_bar.dart';
import 'movies_browser_grid_item_shimmer.dart';
import 'movies_browser_switcher.dart';
import 'scroll_index_calculator.dart';

class MoviesBrowserScaffold extends StatefulWidget {
  final String title;
  final List<MovieEntity> movies;
  final List<GenreEntity> genres;
  final bool isLoading;
  final bool isLoadingPagination;
  final VoidCallback? onFetchNextPage;
  final String? emptyMessage;

  const MoviesBrowserScaffold({
    super.key,
    required this.title,
    required this.movies,
    this.genres = const [],
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
          ? (_isGridView
                ? Shimmer.fromColors(
                    baseColor: AppColors.primarySoft,
                    highlightColor: AppColors.primarySoft.withValues(
                      alpha: 0.5,
                    ),
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8.w,
                        mainAxisSpacing: 16.h,
                        childAspectRatio: 100 / 185,
                      ),
                      itemCount: 12,
                      itemBuilder: (_, _) =>
                          const MoviesBrowserGridItemShimmer(),
                    ),
                  )
                : MovieShimmerListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.horizontalPadding,
                      vertical: 16.h,
                    ),
                  ))
          : widget.movies.isEmpty
          ? Center(
              child: Text(
                widget.emptyMessage ?? 'No movies found.',
                style: TextStyles.font18Regular.copyWith(
                  color: AppColors.textWhite,
                ),
              ),
            )
          : NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollUpdateNotification ||
                    notification is ScrollEndNotification) {
                  final double pixels = notification.metrics.pixels;
                  final double max = notification.metrics.maxScrollExtent;
                  const int trigger = 200;

                  if (max > 0 && pixels >= max - trigger) {
                    widget.onFetchNextPage?.call();
                  }
                }
                if (notification is ScrollUpdateNotification) {
                  final double pixels = notification.metrics.pixels;
                  final int maxMoviesListIndex = widget.movies.isNotEmpty
                      ? widget.movies.length - 1
                      : 0;

                  if (_isGridView) {
                    _currentScrollMovieIndex =
                        ScrollIndexCalculator.getCurrentGridViewScrollMovieIndex(
                          fullScreenWidth: MediaQuery.sizeOf(context).width,
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
