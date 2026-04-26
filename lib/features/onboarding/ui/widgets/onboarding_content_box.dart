import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../core/common/animated_slider_dots.dart';
import '../../data/onboarding_data.dart';
import 'onboarding_next_button.dart';

class OnboardingContentBox extends StatelessWidget {
  final OnboardingData data;
  final int currentIndex;
  final int totalPages;
  final VoidCallback onNextPressed;

  const OnboardingContentBox({
    super.key,
    required this.data,
    required this.currentIndex,
    required this.totalPages,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Spacer(),
          // Description Box
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            width: double.infinity,
            height: 341.h,
            padding: EdgeInsets.all(32.w),
            decoration: BoxDecoration(
              color: AppColors.textBlack,
              borderRadius: BorderRadius.circular(32.r),
            ),
            child: Column(
              children: [
                // Using a key makes it crossfade text softly between pages if animated
                Text(
                  data.title,
                  key: ValueKey(data.title),
                  textAlign: TextAlign.center,
                  style: TextStyles.font18SemiBold.copyWith(height: 1.6),
                ),
                SizedBox(height: 14.h),
                Text(
                  data.description,
                  key: ValueKey(data.description),
                  textAlign: TextAlign.center,
                  style: TextStyles.font14Medium.copyWith(height: 1.6),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedSliderDots(
                      currentIndex: currentIndex,
                      totalDots: totalPages,
                    ),
                    OnboardingNextButton(
                      progress: (currentIndex + 1) / totalPages,
                      onPressed: onNextPressed,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
