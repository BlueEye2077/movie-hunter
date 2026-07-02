import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class ProfileStatCard extends StatelessWidget {
  final String svgPath;
  final Color iconColor;
  final int count;
  final String label;

  const ProfileStatCard({
    super.key,
    required this.svgPath,
    required this.iconColor,
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.primarySoft,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgPath,
            width: 20.w,
            height: 20.w,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                count.toString(),
                style: TextStyles.font18SemiBold.copyWith(
                  color: AppColors.textWhite,
                ),
              ),
              Text(
                label,
                style: TextStyles.font12Medium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
