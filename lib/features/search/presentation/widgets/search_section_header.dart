import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class SearchSectionHeader extends StatelessWidget {
  final String title;

  const SearchSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.horizontalPadding,
        right: AppSpacing.horizontalPadding,
        bottom: 16.h,
      ),
      child: Text(
        title,
        style: TextStyles.font16SemiBold.copyWith(
          color: AppColors.textWhite,
        ),
      ),
    );
  }
}

