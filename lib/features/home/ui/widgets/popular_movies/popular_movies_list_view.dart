import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/core/helpers/helpers.dart';
import 'package:movie_hunter/core/networking/api_constants.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/core/theming/styles.dart';
import 'package:movie_hunter/features/home/data/models/genre.dart';
import 'package:movie_hunter/features/home/data/models/movie.dart';
import 'package:movie_hunter/features/home/logic/cubit/popular_movies_cubit.dart';
import 'package:movie_hunter/features/home/ui/widgets/popular_movies/popular_movie_item.dart';

class PopularMoviesListView extends StatelessWidget {
  final List<Movie> movies;
  const PopularMoviesListView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    // Get all genres from the cubit
    final List<Genre> allGenres = context
        .read<PopularMoviesCubit>()
        .getGenreTitles();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: TextStyles.horizontalPadding,
          ),
          // Title and See All Button
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title
              Text(
                'Most popular',
                style: TextStyles.font16SemiBold.copyWith(
                  color: AppColors.textWhite,
                ),
              ),
              // See All Button
              GestureDetector(
                onTap: () {
                  // TODO: Navigate to see all popular movies
                },
                child: Text(
                  'See All',
                  style: TextStyles.font14Medium.copyWith(
                    color: AppColors.primaryBlueAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        // Horizontal List View of Popular Movies
        SizedBox(
          height: 245.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: TextStyles.horizontalPadding,
            ),
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: movies.length,
            separatorBuilder: (context, index) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              final movie = movies[index];
              // Genres are guaranteed to be cached by the time movies are displayed
              final genreNames = Helpers.getGenreTitles(
                allGenres: allGenres,
                genreIds: movie.genreIds,
              );
              return PopularMovieItem(
                title: movie.title ?? '',
                genres: genreNames,
                posterPath: movie.posterPath != null
                    ? '${ApiConstants.imagesUrl}${movie.posterPath}'
                    : '',
                rating: movie.tmdbRating ?? 0,
              );
            },
          ),
        ),
      ],
    );
  }
}
