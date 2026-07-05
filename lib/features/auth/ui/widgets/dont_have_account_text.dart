import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account? ',
            style: TextStyles.font14Medium.copyWith(
              color: AppColors.textWhite,
            ),
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyles.font14SemiBold.copyWith(
              color: AppColors.primaryBlueAccent,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryBlueAccent,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacementNamed(context, Routes.signUp);
              },
          ),
        ],
      ),
    );
  }
}
