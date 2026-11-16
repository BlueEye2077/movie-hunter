import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../cubit/logout_cubit.dart';
import 'logout_confirmation_dialog.dart';

class ProfileLogoutButton extends StatelessWidget {
  const ProfileLogoutButton({super.key});

  Future<void> _onLogoutPressed(BuildContext context) async {
    final confirmed = await LogoutConfirmationDialog.show(context);
    if (confirmed == true && context.mounted) {
      context.read<LogoutCubit>().logout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.login,
              (route) => false,
            );
          },
          error: (error) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(NetworkExceptions.getErrorMessage(error)),
                backgroundColor: AppColors.secondaryRed,
              ),
            );
          },
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return Material(
          color: AppColors.primarySoft,
          borderRadius: BorderRadius.circular(16.r),
          child: InkWell(
            borderRadius: BorderRadius.circular(16.r),
            onTap: isLoading ? null : () => _onLogoutPressed(context),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.secondaryRed.withValues(alpha: 0.12),
                    ),
                    child: Center(
                      child: isLoading
                          ? SizedBox(
                              width: 18.w,
                              height: 18.w,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.secondaryRed,
                              ),
                            )
                          : Icon(
                              Icons.logout_rounded,
                              color: AppColors.secondaryRed,
                              size: 20.w,
                            ),
                    ),
                  ),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Text(
                      AppStrings.logout,
                      style: TextStyles.font16SemiBold.copyWith(
                        color: AppColors.textWhite,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.textGrey,
                    size: 22.w,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

