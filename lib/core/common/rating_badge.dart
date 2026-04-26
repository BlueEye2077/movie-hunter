import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class RatingBadge extends StatelessWidget {
  final double rating;
  const RatingBadge({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.primarySoft.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/svgs/star.svg',
            width: 12.w,
            height: 12.w,
            colorFilter: const ColorFilter.mode(
              AppColors.secondaryOrange,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 4.w),
          Text(
            (rating).toStringAsFixed(1),
            style: TextStyles.font12SemiBold.copyWith(
              color: AppColors.secondaryOrange,
            ),
          ),
        ],
      ),
    );
  }
}
