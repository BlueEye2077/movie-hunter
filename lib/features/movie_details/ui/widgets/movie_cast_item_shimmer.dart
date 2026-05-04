import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class MovieCastItemShimmer extends StatelessWidget {
  const MovieCastItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40.w,
          height: 40.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primarySoft,
          ),
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 12.h,
              width: 80.w,
              decoration: BoxDecoration(
                color: AppColors.primarySoft,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            SizedBox(height: 6.h),
            Container(
              height: 10.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: AppColors.primarySoft,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
