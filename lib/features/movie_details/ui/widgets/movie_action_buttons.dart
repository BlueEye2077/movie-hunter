import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import 'movie_circle_action_button.dart';

class MovieActionButtons extends StatelessWidget {
  const MovieActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Play button
        ElevatedButton.icon(
          onPressed: () {
            // TODO: Play trailer
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondaryOrange,
            foregroundColor: AppColors.textWhite,
            shape: const StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          ),
          icon: Icon(Icons.play_arrow, size: 24.w),
          label: Text(AppStrings.play, style: TextStyles.font16Medium),
        ),
        SizedBox(width: 16.w),
        // Download button
        MovieCircleActionButton(
          icon: Icons.download_outlined,
          onPressed: () {
            // TODO: Download
          },
        ),
        SizedBox(width: 16.w),
        // Share button
        MovieCircleActionButton(
          icon: Icons.share,
          iconColor: AppColors.primaryBlueAccent,
          onPressed: () {
            // TODO: Share
          },
        ),
      ],
    );
  }
}
