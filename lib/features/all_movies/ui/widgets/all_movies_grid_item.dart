import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/poster_image.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class AllMoviesGridItem extends StatelessWidget {
  final String posterPath;
  final String title;
  final String year;
  final VoidCallback? onTap;

  const AllMoviesGridItem({
    super.key,
    required this.posterPath,
    required this.title,
    required this.year,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Poster
          Expanded(
            child: PosterImage(
              imageUrl: posterPath,
              height: double.infinity,
              width: double.infinity,
              topRadius: 12,
              bottomRadius: 12,
            ),
          ),
          SizedBox(height: 6.h),
          // Movie title
          Text(
            title,
            style: TextStyles.font12SemiBold.copyWith(
              color: AppColors.textWhite,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 2.h),
          // Release year
          Text(
            year,
            style: TextStyles.font12Medium.copyWith(
              color: AppColors.textDarkGrey,
            ),
          ),
        ],
      ),
    );
  }
}
