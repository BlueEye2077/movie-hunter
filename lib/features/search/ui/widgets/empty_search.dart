import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/core/theming/styles.dart';

class EmptySearch extends StatelessWidget {
  final String svgPath;
  final double iconSize;
  final String title;
  final String subtitle;

  const EmptySearch({
    super.key,
    required this.svgPath,
    required this.title,
    required this.subtitle,
    this.iconSize = 76,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(svgPath, width: iconSize.w, height: iconSize.w),
        SizedBox(height: 16.h),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyles.font16SemiBold.copyWith(
            color: AppColors.textWhiteGrey,
            height: 1.6,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyles.font12Medium.copyWith(
            color: AppColors.textGrey,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
