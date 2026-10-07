import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.dontHaveAccount,
          style: TextStyles.font14Medium.copyWith(
            color: AppColors.textWhite,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, Routes.signUp);
          },
          child: Text(
            AppStrings.signUp,
            style: TextStyles.font14SemiBold.copyWith(
              color: AppColors.primaryBlueAccent,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryBlueAccent,
            ),
          ),
        ),
      ],
    );
  }
}

