import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../domain/entities/movie_entity.dart';
import '../routing/routes.dart';
import '../theming/app_spacing.dart';
import '../theming/colors.dart';
import 'movie_item.dart';

class MoviesListView extends StatelessWidget {
  final List<MovieEntity> movies;
  final bool isShimmer;

  const MoviesListView.shimmer({super.key})
      : movies = const [],
        isShimmer = true;

  const MoviesListView.showMovies({
    super.key,
    required this.movies,
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
              return const MovieItem(
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
            return MovieItem(
              title: movie.displayTitle,
              genres: movie.topTwoGenres,
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

