import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/colors.dart';

class OnboardingSliderDots extends StatelessWidget {
  final int currentIndex;
  final int totalDots;

  const OnboardingSliderDots({
    super.key,
    required this.currentIndex,
    this.totalDots = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalDots, (index) {
        final isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          margin: EdgeInsets.only(right: index == totalDots - 1 ? 0 : 8.w),
          height: 10.h,
          width: isActive ? 32.w : 10.w,
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.primaryBlueAccent
                : AppColors.primaryBlueAccent.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(100.r),
          ),
        );
      }),
    );
  }
}
