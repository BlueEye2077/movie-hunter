import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class MoviesSection extends StatelessWidget {
  final String title;
  final Widget child;

  const MoviesSection({
    super.key,
    required this.title,
    required this.child,
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
                onTap: () {
                  // TODO: Navigate to see all popular movies
                },
                child: Text(
                  'See All',
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
