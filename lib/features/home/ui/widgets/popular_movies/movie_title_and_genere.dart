import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/core/theming/styles.dart';

class MovieTitleAndGenere extends StatelessWidget {
  final String title;
  final String genre;
  const MovieTitleAndGenere({super.key, required this.title, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Positioned(
            bottom: 8.h,
            left: 8.w,
            right: 8.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.font14SemiBold.copyWith(
                    color: AppColors.textWhite,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  genre,
                  style: TextStyles.font10Medium.copyWith(
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),
          );
  }
}