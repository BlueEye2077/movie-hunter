import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/core/theming/styles.dart';

class UpcomingMovieItem extends StatelessWidget {
  final String posterUrl;
  final String title;
  final String releaseDate;

  const UpcomingMovieItem({
    super.key,
    required this.posterUrl,
    required this.title,
    required this.releaseDate,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Poster image
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),

            image: DecorationImage(
              image: CachedNetworkImageProvider(posterUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Gradient overlay
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                AppColors.primaryDark.withValues(alpha: 0.9),
                Colors.transparent,
              ],
            ),
          ),
        ),
        // Movie title and release date
        Positioned(
          bottom: 16.h,
          left: 16.w,
          right: 16.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.font16SemiBold.copyWith(
                  color: AppColors.textWhite,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4.h),
              Text(
                releaseDate,
                style: TextStyles.font12Medium.copyWith(
                  color: AppColors.textWhiteGrey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
