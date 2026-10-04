import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../features/home/data/models/genre.dart';
import '../../features/home/data/models/movie.dart';
import '../routing/routes.dart';
import '../theming/colors.dart';
import 'movies_browser_grid_item.dart';
import 'movies_browser_grid_item_shimmer.dart';
import 'scroll_index_calculator.dart';

class MoviesBrowserGridView extends StatefulWidget {
  final List<Movie> movies;
  final List<Genre> genres;
  final bool isLoadingMore;
  final int scrolledMovieIndex;

  static const int _shimmerCount = 5;

  const MoviesBrowserGridView({
    super.key,
    required this.movies,
    required this.genres,
    required this.isLoadingMore,
    required this.scrolledMovieIndex,
  });

  @override
  State<MoviesBrowserGridView> createState() => _MoviesBrowserGridViewState();
}

class _MoviesBrowserGridViewState extends State<MoviesBrowserGridView> {
  ScrollController? _scrollController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_scrollController == null) {
      final offset = ScrollIndexCalculator.getGridViewScrollMovieOffset(
        scrolledMovieIndex: widget.scrolledMovieIndex,
        fullScreenWidth: MediaQuery.of(context).size.width,
      );
      _scrollController = ScrollController(initialScrollOffset: offset);
    }
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 100 / 185,
      ),
      itemCount: widget.isLoadingMore
          ? widget.movies.length + MoviesBrowserGridView._shimmerCount
          : widget.movies.length,
      itemBuilder: (context, index) {
        if (index >= widget.movies.length) {
          return Shimmer.fromColors(
            baseColor: AppColors.primarySoft,
            highlightColor: AppColors.primarySoft.withValues(alpha: 0.5),
            child: const MoviesBrowserGridItemShimmer(),
          );
        }

        final movie = widget.movies[index];
        final releaseDate = movie.releaseDate;
        final year = (releaseDate == null || releaseDate.length < 4)
            ? '—'
            : releaseDate.substring(0, 4);
        return MoviesBrowserGridItem(
          posterPath: movie.posterPath ?? '',
          title: movie.title ?? movie.originalTitle ?? 'Unknown',
          year: year,
          onTap: () => Navigator.pushNamed(
            context,
            Routes.movieDetails,
            arguments: movie,
          ),
        );
      },
    );
  }
}
