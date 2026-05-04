import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/colors.dart';

class MovieInfoChipShimmer extends StatelessWidget {
  final IconData icon;

  const MovieInfoChipShimmer({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primarySoft,
      highlightColor: AppColors.primarySoft.withValues(alpha: 0.5),
      child: Row(
        children: [
          Icon(icon, size: 16.w),
          SizedBox(width: 4.w),
          Container(
            width: 50.w,
            height: 15.h,
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
