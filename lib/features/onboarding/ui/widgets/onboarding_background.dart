import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../data/onboarding_data.dart';

class OnboardingBackground extends StatelessWidget {
  final OnboardingData data;

  const OnboardingBackground({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.isFullBleedImage) {
      return Stack(
        children: [
          Positioned(
            top: 0,
            left: 10,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.70,
            child: Image.asset(
              data.imagePath,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.70,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primaryDark.withValues(alpha: 0.0),
                    AppColors.primaryDark.withValues(alpha: 0.0),
                    AppColors.primaryDark.withValues(alpha: 0.8),
                    AppColors.primaryDark,
                  ],
                  stops: const [0.0, 0.6, 0.9, 1.0],
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Positioned(
        top: 59.h,
        left: 30.w,
        right: 30.w,
        child: Image.asset(data.imagePath, fit: BoxFit.contain),
      );
    }
  }
}
