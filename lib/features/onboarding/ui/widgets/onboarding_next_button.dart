import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/colors.dart';

class OnboardingNextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double progress; // 0.0 to 1.0

  const OnboardingNextButton({
    super.key,
    required this.onPressed,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60.w,
        height: 60.w,
        decoration: BoxDecoration(
          color: AppColors.primaryBlueAccent,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Center(
          child: RotatedBox(
            quarterTurns: 2, // Rotate 180 degrees
            child: SvgPicture.asset(
              'assets/svgs/arrow_back.svg',
              height: 24.w,
              width: 24.w,
              colorFilter: const ColorFilter.mode(
                AppColors.textBlack, // very dark blue
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
