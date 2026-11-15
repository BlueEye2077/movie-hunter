import 'package:flutter/material.dart';

import '../domain/entities/movie_entity.dart';
import '../theming/app_strings.dart';
import '../theming/colors.dart';
import 'error_retry_view.dart';
import 'movies_browser_app_bar.dart';
import 'movies_browser_loading_view.dart';
import 'movies_browser_message_view.dart';
import 'movies_browser_switcher.dart';
import 'scroll_index_calculator.dart';

class MoviesBrowserScaffold extends StatefulWidget {
  final String title;
  final List<MovieEntity> movies;
  final bool isLoading;
  final bool isLoadingPagination;
  final VoidCallback? onFetchNextPage;
  final String? emptyMessage;
  final String? errorMessage;
  final VoidCallback? onRetry;

  const MoviesBrowserScaffold({
    super.key,
    required this.title,
    required this.movies,
    required this.isLoading,
    required this.isLoadingPagination,
    this.onFetchNextPage,
    this.emptyMessage,
    this.errorMessage,
    this.onRetry,
  });

  @override
  State<MoviesBrowserScaffold> createState() => _MoviesBrowserScaffoldState();
}

class _MoviesBrowserScaffoldState extends State<MoviesBrowserScaffold> {
  static const double _paginationTriggerOffset = 200;

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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (widget.isLoading) {
      return MoviesBrowserLoadingView(isGridView: _isGridView);
    }

    if (widget.errorMessage != null) {
      if (widget.onRetry != null) {
        return ErrorRetryView(
          message: widget.errorMessage!,
          onRetry: widget.onRetry!,
        );
      }
      return MoviesBrowserMessageView(message: widget.errorMessage!);
    }

    if (widget.movies.isEmpty) {
      return MoviesBrowserMessageView(
        message: widget.emptyMessage ?? AppStrings.noMoviesFound,
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: MoviesBrowserSwitcher(
        isGridView: _isGridView,
        movies: widget.movies,
        isLoadingPagination: widget.isLoadingPagination,
        scrolledMovieIndex: _currentScrollMovieIndex,
      ),
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    _maybeFetchNextPage(notification);
    if (notification is ScrollUpdateNotification) {
      _updateScrolledMovieIndex(notification.metrics.pixels);
    }
    return false;
  }

  void _maybeFetchNextPage(ScrollNotification notification) {
    if (notification is! ScrollUpdateNotification &&
        notification is! ScrollEndNotification) {
      return;
    }
    final double max = notification.metrics.maxScrollExtent;
    if (max > 0 &&
        notification.metrics.pixels >= max - _paginationTriggerOffset) {
      widget.onFetchNextPage?.call();
    }
  }

  void _updateScrolledMovieIndex(double pixels) {
    final int maxMoviesListIndex = widget.movies.isNotEmpty
        ? widget.movies.length - 1
        : 0;

    _currentScrollMovieIndex = _isGridView
        ? ScrollIndexCalculator.getCurrentGridViewScrollMovieIndex(
            fullScreenWidth: MediaQuery.sizeOf(context).width,
            maxMoviesListIndex: maxMoviesListIndex,
            maxScrollPixels: pixels,
          )
        : ScrollIndexCalculator.getCurrentListViewScrollMovieIndex(
            maxMoviesListIndex: maxMoviesListIndex,
            maxScrollPixels: pixels,
          );
  }
}
