import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_strings.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/text_styles.dart';

class MoviesSection extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback? onSeeAllTap;

  const MoviesSection({
    super.key,
    required this.title,
    required this.child,
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: TextStyles.horizontalPadding,
          ),
          // Title and See All Button
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title
              Text(
                title,
                style: TextStyles.font16SemiBold.copyWith(
                  color: AppColors.textWhite,
                ),
              ),
              // See All Movies Button
              GestureDetector(
                onTap: onSeeAllTap,
                child: Text(
                  AppStrings.seeAll,
                  style: TextStyles.font14Medium.copyWith(
                    color: AppColors.primaryBlueAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        // The dynamic content of the section
        child,
      ],
    );
  }
}
