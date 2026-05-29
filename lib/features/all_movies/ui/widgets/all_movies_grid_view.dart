import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../home/data/models/genre.dart';
import '../../../home/data/models/movie.dart';
import '../../helpers/scroll_index_calculator.dart';
import 'all_movies_grid_item.dart';
import 'all_movies_grid_item_shimmer.dart';

class AllMoviesGridView extends StatefulWidget {
  final List<Movie> movies;
  final List<Genre> genres;
  final bool isLoadingMore;
  final int scrolledMovieIndex;

  static const int _shimmerCount = 5;

  const AllMoviesGridView({
    super.key,
    required this.movies,
    required this.genres,
    required this.isLoadingMore,
    required this.scrolledMovieIndex,
  });

  @override
  State<AllMoviesGridView> createState() => _AllMoviesGridViewState();
}

class _AllMoviesGridViewState extends State<AllMoviesGridView> {
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
          ? widget.movies.length + AllMoviesGridView._shimmerCount
          : widget.movies.length,
      itemBuilder: (context, index) {
        if (index >= widget.movies.length) {
          return Shimmer.fromColors(
            baseColor: AppColors.primarySoft,
            highlightColor: AppColors.primarySoft.withValues(alpha: 0.5),
            child: const AllMoviesGridItemShimmer(),
          );
        }

        final movie = widget.movies[index];
        final year = movie.releaseDate?.isNotEmpty == true
            ? movie.releaseDate!.substring(0, 4)
            : '—';
        return AllMoviesGridItem(
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
