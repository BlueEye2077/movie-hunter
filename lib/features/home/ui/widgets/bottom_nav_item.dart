import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class BottomNavItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Build the bottom nav item with animation
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primarySoft : Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            width: 24.w,
            height: 24.w,
            colorFilter: ColorFilter.mode(
              isSelected ? AppColors.primaryBlueAccent : AppColors.textGrey,
              BlendMode.srcIn,
            ),
          ),
          if (isSelected) ...[
            SizedBox(width: 4.w),
            Text(
              label,
              style: TextStyles.font12Medium.copyWith(
                color: AppColors.primaryBlueAccent,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
