import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/movie_shimmer_list.dart';
import '../../../../core/common/search_movie_item.dart';
import '../../../home/data/models/genre.dart';
import '../../../home/data/models/movie.dart';
import '../../helpers/scroll_index_calculator.dart';

class AllMoviesListView extends StatefulWidget {
  final List<Movie> movies;
  final List<Genre> genres;
  final bool isLoadingMore;
  final int scrolledMovieIndex;

  const AllMoviesListView({
    super.key,
    required this.movies,
    required this.genres,
    required this.isLoadingMore,
    required this.scrolledMovieIndex,
  });

  @override
  State<AllMoviesListView> createState() => _AllMoviesListViewState();
}

class _AllMoviesListViewState extends State<AllMoviesListView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    // scroll to the movie that was scrolled on the previous screen
    // Reconverting the number of the index to a pixels
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
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      itemCount: widget.isLoadingMore
          ? widget.movies.length + 1
          : widget.movies.length,
      separatorBuilder: (_, _) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        if (index == widget.movies.length) {
          return const MovieShimmerList(itemCount: 3);
        }
        return GeneralMovieItem(movie: widget.movies[index]);
      },
    );
  }
}
