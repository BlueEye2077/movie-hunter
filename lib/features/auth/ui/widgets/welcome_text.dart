import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/core/helpers/app_strings.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/core/theming/styles.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppStrings.welcomeTitle,
          style: TextStyles.font24SemiBold.copyWith(color: AppColors.textWhite),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Text(
          AppStrings.welcomeSubtitle,
          style: TextStyles.font12Medium.copyWith(color: AppColors.textWhiteGrey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
