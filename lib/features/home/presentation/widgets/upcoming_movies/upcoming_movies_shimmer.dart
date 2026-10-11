import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/theming/colors.dart';

class UpcomingMoviesShimmer extends StatelessWidget {
  const UpcomingMoviesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primarySoft,
      highlightColor: AppColors.primarySoft.withValues(alpha: 0.5),
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: 5,
            itemBuilder: (context, index, realIndex) => Container(
              height: 154.h,
              decoration: BoxDecoration(
                color: AppColors.primarySoft,
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            options: CarouselOptions(
              height: 154.h,
              viewportFraction: 0.7.r,
              enlargeCenterPage: true,
              autoPlay: false,
            ),
          ),
          const SizedBox(height: 11),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Container(
                margin: EdgeInsets.only(right: index == 4 ? 0 : 8.w),
                height: 10.h,
                width: index == 0 ? 32.w : 10.w,
                decoration: BoxDecoration(
                  color: AppColors.primarySoft,
                  borderRadius: BorderRadius.circular(100.r),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
