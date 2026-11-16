import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/app_spacing.dart';
import '../../../../core/theming/colors.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: Shimmer.fromColors(
        baseColor: AppColors.primarySoft,
        highlightColor: AppColors.textDarkGrey,
        child: GridView.builder(
          padding: EdgeInsets.only(top: 24.h, bottom: 40.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 17.w,
            mainAxisSpacing: 24.h,
            childAspectRatio: 155 / 80,
          ),
          itemCount: 14,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.primarySoft,
                borderRadius: BorderRadius.circular(8.r),
              ),
            );
          },
        ),
      ),
    );
  }
}
