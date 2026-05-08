import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/helpers.dart';
import '../../../../core/routing/routes.dart';
import '../../../home/data/models/genre.dart';
import '../../../home/data/models/movie.dart';
import '../../../home/ui/widgets/movie_section/movie_item.dart';

class AllMoviesGridView extends StatelessWidget {
  final List<Movie> movies;
  final List<Genre> genres;

  const AllMoviesGridView({
    super.key,
    required this.movies,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 135 / 231,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        final genreNames = Helpers.getGenreTitles(
          allGenres: genres,
          genreIds: movie.genreIds,
        );
        return MovieItem(
          title: movie.title ?? '',
          genres: genreNames,
          posterPath: movie.posterPath ?? '',
          rating: movie.tmdbRating ?? 0,
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
