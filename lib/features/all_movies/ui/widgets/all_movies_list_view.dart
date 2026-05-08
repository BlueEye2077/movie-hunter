import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/data/models/genre.dart';
import '../../../home/data/models/movie.dart';
import '../../../search/ui/widgets/search_movie_item.dart';

class AllMoviesListView extends StatelessWidget {
  final List<Movie> movies;
  final List<Genre> genres;

  const AllMoviesListView({
    super.key,
    required this.movies,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      itemCount: movies.length,
      separatorBuilder: (_, _) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        return SearchMovieItem(movie: movies[index]);
      },
    );
  }
}
