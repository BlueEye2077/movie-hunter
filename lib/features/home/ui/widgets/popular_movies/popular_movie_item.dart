import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/features/home/ui/widgets/popular_movies/movie_title_and_genere.dart';
import 'package:movie_hunter/features/home/ui/widgets/popular_movies/poster_image.dart';
import 'package:movie_hunter/features/home/ui/widgets/popular_movies/rating_badge.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/theming/colors.dart';
import '../../../data/models/movie.dart';

class PopularMovieItem extends StatelessWidget {
  final Movie movie;

  const PopularMovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    // Store the poster path and image url
    final posterPath = movie.posterPath;
    final imageUrl = posterPath != null
        ? '${ApiConstants.imagesUrl}$posterPath'
        : '';

    return SizedBox(
      width: 135.w,
      height: 231.h,
      child: Stack(
        children: [
          // Background card
          Container(
            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          // Poster image
          PosterImage(imageUrl: imageUrl, height: 178.h, width: 135.w),
          // Rating badge
          RatingBadge(rating: movie.tmdbRating ?? 0),
          // Title and genre
          MovieTitleAndGenere(
            title: movie.title ?? '',
            // todo: fix the genere
            genre: "genere",
          ),
        ],
      ),
    );
  }
}
