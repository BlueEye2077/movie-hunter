import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../home/ui/widgets/movie_section/movies_list_view.dart';
import '../../../home/ui/widgets/movie_section/movies_section.dart';

class PersonDetailsShimmer extends StatelessWidget {
  const PersonDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),

          // Avatar & Name Shimmer
          Shimmer.fromColors(
            baseColor: AppColors.primarySoft,
            highlightColor: AppColors.primarySoft.withValues(alpha: 0.5),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 110.w,
                    height: 110.w,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Container(width: 150.w, height: 18.h, color: Colors.white),
                  SizedBox(height: 8.h),
                  Container(width: 100.w, height: 12.h, color: Colors.white),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Container(
                        width: 120.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 28.h),

          // Biography Shimmer
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: TextStyles.horizontalPadding,
            ),
            child: Shimmer.fromColors(
              baseColor: AppColors.primarySoft,
              highlightColor: AppColors.primarySoft.withValues(alpha: 0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 100.w, height: 18.h, color: Colors.white),
                  SizedBox(height: 12.h),
                  Container(
                    width: double.infinity,
                    height: 12.h,
                    color: Colors.white,
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: double.infinity,
                    height: 12.h,
                    color: Colors.white,
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: double.infinity,
                    height: 12.h,
                    color: Colors.white,
                  ),
                  SizedBox(height: 8.h),
                  Container(width: 200.w, height: 12.h, color: Colors.white),
                ],
              ),
            ),
          ),

          SizedBox(height: 28.h),

          // Known For Shimmer
          MoviesSection(
            title: 'Known For',
            child: const MoviesListView.shimmer(),
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
