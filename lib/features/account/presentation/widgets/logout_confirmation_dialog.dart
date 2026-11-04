import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({super.key});

  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (_) => const LogoutConfirmationDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.primarySoft,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      title: Text(
        AppStrings.confirmLogout,
        style: TextStyles.font16SemiBold.copyWith(
          color: AppColors.textWhite,
        ),
      ),
      content: Text(
        AppStrings.confirmLogoutMessage,
        style: TextStyles.font14Medium.copyWith(color: AppColors.textGrey),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(
            AppStrings.cancel,
            style: TextStyles.font14Medium.copyWith(
              color: AppColors.textWhite,
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondaryRed,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          onPressed: () => Navigator.pop(context, true),
          child: Text(
            AppStrings.logout,
            style: TextStyles.font14Medium.copyWith(
              color: AppColors.textWhite,
            ),
          ),
        ),
      ],
    );
  }
}

