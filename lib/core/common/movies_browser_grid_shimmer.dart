import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../theming/colors.dart';
import 'movies_browser_grid_item_shimmer.dart';

class MoviesBrowserGridShimmer extends StatelessWidget {
  const MoviesBrowserGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primarySoft,
      highlightColor: AppColors.primarySoft.withValues(alpha: 0.5),
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 100 / 185,
        ),
        itemCount: 12,
        itemBuilder: (_, _) => const MoviesBrowserGridItemShimmer(),
      ),
    );
  }
}
