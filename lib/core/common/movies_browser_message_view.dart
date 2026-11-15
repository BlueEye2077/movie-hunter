import 'package:flutter/material.dart';

import '../theming/app_spacing.dart';
import '../theming/colors.dart';
import '../theming/text_styles.dart';

class MoviesBrowserMessageView extends StatelessWidget {
  final String message;

  const MoviesBrowserMessageView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppSpacing.screenPadding,
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyles.font18Regular.copyWith(color: AppColors.textWhite),
        ),
      ),
    );
  }
}
