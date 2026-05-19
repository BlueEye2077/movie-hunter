import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../home/data/models/genre.dart';
import '../../../home/data/models/movie.dart';
import 'all_movies_grid_item.dart';

class AllMoviesGridView extends StatelessWidget {
  final List<Movie> movies;
  final List<Genre> genres;
  final bool isLoadingmore;

  const AllMoviesGridView({
    super.key,
    required this.movies,
    required this.genres,
    required this.isLoadingmore,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 100 / 185,
      ),
      itemCount: isLoadingmore ? movies.length + 1 : movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        final year = movie.releaseDate?.isNotEmpty == true
            ? movie.releaseDate!.substring(0, 4)
            : '—';

        if (index == movies.length) {
          return Center(child: CircularProgressIndicator());
        }
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
