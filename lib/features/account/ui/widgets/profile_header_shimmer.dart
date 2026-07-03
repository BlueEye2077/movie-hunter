import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/colors.dart';

class ProfileHeaderShimmer extends StatelessWidget {
  const ProfileHeaderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primarySoft,
      highlightColor: AppColors.primarySoft.withValues(alpha: 0.5),
      child: Column(
        children: [
          CircleAvatar(radius: 45.r, backgroundColor: AppColors.primarySoft),
          SizedBox(height: 12.h),
          Container(
            width: 120.w,
            height: 18.h,
            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            width: 80.w,
            height: 14.h,
            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ],
      ),
    );
  }
}
