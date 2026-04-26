import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/common/poster_image.dart';
import '../../../../../core/common/rating_badge.dart';
import 'movie_title_and_genre.dart';
import '../../../../../core/theming/colors.dart';

class MovieItem extends StatelessWidget {
  final String title;
  final List<String> genres;
  final String posterPath;
  final double rating;

  const MovieItem({
    super.key,
    required this.title,
    required this.genres,
    required this.posterPath,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
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
          PosterImage(imageUrl: posterPath, height: 178.h, width: 135.w),
          // Rating badge
          Positioned(
            top: 8.h,
            right: 8.w,
            child: RatingBadge(rating: rating),
          ),
          // Title and genre
          Positioned(
            // bottom: 8.h,
            top: 189.h,
            left: 8.w,
            right: 8.w,
            child: MovieTitleAndGenre(title: title, genres: genres),
          ),
        ],
      ),
    );
  }
}
