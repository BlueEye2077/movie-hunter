import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/home/data/models/genre.dart';
import '../../features/home/data/models/movie.dart';
import '../theming/app_spacing.dart';
import 'movie_list_view_item.dart';
import 'movie_shimmer_list_view.dart';
import 'scroll_index_calculator.dart';

class MoviesBrowserListView extends StatefulWidget {
  final List<Movie> movies;
  final List<Genre> genres;
  final bool isLoadingMore;
  final int scrolledMovieIndex;

  const MoviesBrowserListView({
    super.key,
    required this.movies,
    required this.genres,
    required this.isLoadingMore,
    required this.scrolledMovieIndex,
  });

  @override
  State<MoviesBrowserListView> createState() => _MoviesBrowserListViewState();
}

class _MoviesBrowserListViewState extends State<MoviesBrowserListView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    final offset = ScrollIndexCalculator.getCurrentListViewScrollMovieOffset(
      scrolledMovieIndex: widget.scrolledMovieIndex,
    );

    _scrollController = ScrollController(initialScrollOffset: offset);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.horizontalPadding,
        vertical: 16.h,
      ),
      itemCount: widget.isLoadingMore
          ? widget.movies.length + 1
          : widget.movies.length,
      separatorBuilder: (_, _) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        if (index == widget.movies.length) {
          return const MovieShimmerListView(itemCount: 3);
        }
        return MovieListViewItem(movie: widget.movies[index]);
      },
    );
  }
}
