import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import 'movie_details_action_button.dart';

class MovieDetailsAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onBackPressed;

  const MovieDetailsAppBar({
    super.key,
    required this.title,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          MovieDetailsActionButton(
            icon: Icons.arrow_back_ios_new,
            onPressed: onBackPressed,
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.font16SemiBold.copyWith(
                color: AppColors.textWhite,
              ),
            ),
          ),
          MovieDetailsActionButton(
            icon: Icons.favorite,
            iconColor: AppColors.secondaryRed,
            onPressed: () {
              // TODO: Add to wishlist
            },
          ),
        ],
      ),
    );
  }
}
