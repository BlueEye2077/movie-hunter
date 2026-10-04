import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/helpers/genres_helper.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/models/genre.dart';
import '../../../../../core/models/movie.dart';
import 'movie_item.dart';

class MoviesListView extends StatelessWidget {
  final List<Movie> movies;
  final List<Genre> genres;
  final bool isShimmer;
  const MoviesListView.shimmer({super.key})
    : movies = const [],
      genres = const [],
      isShimmer = true;
  const MoviesListView.showMovies({
    super.key,
    required this.movies,
    required this.genres,
  }) : isShimmer = false;

  @override
  Widget build(BuildContext context) {
    if (isShimmer) {
      return Shimmer.fromColors(
        baseColor: AppColors.primarySoft,
        highlightColor: AppColors.primarySoft.withValues(alpha: 0.5),
        child: SizedBox(
          height: 245.h,
          child: ListView.separated(
            padding: AppSpacing.screenPadding,
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: 5,
            separatorBuilder: (context, index) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              return MovieItem(
                title: '',
                genres: [],
                posterPath: '',
                rating: 0,
              );
            },
          ),
        ),
      );
    } else {
      return SizedBox(
        height: 245.h,
        child: ListView.separated(
          padding: AppSpacing.screenPadding,
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          itemCount: movies.length,
          separatorBuilder: (context, index) => SizedBox(width: 12.w),
          itemBuilder: (context, index) {
            final movie = movies[index];
            // Genres are guaranteed to be cached by the time movies are displayed
            final genreNames = GenresHelper.getGenreTitles(
              allGenres: genres,
              genreIds: movie.genreIds,
            );
            return MovieItem(
              title: movie.title ?? '',
              genres: genreNames,
              posterPath: movie.posterPath ?? "",
              rating: movie.tmdbRating ?? 0,
              onTap: () => Navigator.pushNamed(
                context,
                Routes.movieDetails,
                arguments: movie,
              ),
            );
          },
        ),
      );
    }
  }
}