import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_spacing.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  Future<void> _launchTMDBRegistration() async {
    final Uri url = Uri.parse('https://www.themoviedb.org/signup');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: AppSpacing.screenPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.open_in_new_rounded,
                      size: 80.w,
                      color: AppColors.primaryBlueAccent,
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      AppStrings.accountRegistration,
                      style: TextStyles.font24SemiBold.copyWith(
                        color: AppColors.textWhite,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      AppStrings.tmdbRegistrationNotice,
                      style: TextStyles.font14Medium.copyWith(
                        color: AppColors.textGrey,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 48.h),
                    SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: ElevatedButton(
                        onPressed: _launchTMDBRegistration,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryBlueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.r),
                          ),
                        ),
                        child: Text(
                          AppStrings.goToTmdbWebsite,
                          style: TextStyles.font16SemiBold.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Routes.login);
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.r),
                          ),
                        ),
                        child: Text(
                          AppStrings.backToLogin,
                          style: TextStyles.font16SemiBold.copyWith(
                            color: AppColors.textWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
