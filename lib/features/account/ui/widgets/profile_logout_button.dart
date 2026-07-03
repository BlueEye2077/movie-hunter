import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/secure_storage_helper.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../data/repository/profile_repository.dart';

class ProfileLogoutButton extends StatelessWidget {
  const ProfileLogoutButton({super.key});

  Future<void> _onLogoutPressed(BuildContext context) async {
    await SecureStorageHelper.deleteSessionId();
    await SecureStorageHelper.deleteAccountId();
    getIt<ProfileRepository>().clearCache();
    isLoggedInUser = false;

    if (!context.mounted) return;
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.login,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: OutlinedButton(
        onPressed: () => _onLogoutPressed(context),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.secondaryRed, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Text(
          AppStrings.logout,
          style: TextStyles.font16SemiBold.copyWith(
            color: AppColors.secondaryRed,
          ),
        ),
      ),
    );
  }
}
