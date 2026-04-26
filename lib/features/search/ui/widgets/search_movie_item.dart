import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/poster_image.dart';
import '../../../../core/common/rating_badge.dart';
import '../../../home/data/models/movie.dart';
import 'search_movie_details.dart';

class SearchMovieItem extends StatelessWidget {
  final Movie movie;

  const SearchMovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final year = movie.releaseDate != null && movie.releaseDate!.length >= 4
        ? movie.releaseDate!.substring(0, 4)
        : 'Unknown';
    final language = movie.originalLanguage?.toUpperCase() ?? 'EN';
    final isAdult = movie.isAdult ?? false;

    return SizedBox(
      height: 147.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Poster
          SizedBox(
            width: 112.w,
            height: 147.h,
            child: Stack(
              children: [
                PosterImage(
                  imageUrl: movie.posterPath,
                  height: 147.h,
                  width: 112.w,
                  topRadius: 8.r,
                  bottomRadius: 8.r,
                ),
                Positioned(
                  top: 8.h,
                  left: 8.w,
                  child: RatingBadge(rating: movie.tmdbRating ?? 0.0),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          // Details
          Expanded(
            child: SearchMovieDetails(
              movie: movie,
              year: year,
              language: language,
              isAdult: isAdult,
            ),
          ),
        ],
      ),
    );
  }
}
