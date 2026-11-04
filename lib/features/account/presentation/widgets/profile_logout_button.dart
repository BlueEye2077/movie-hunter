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

        return SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton.icon(
            onPressed: isLoading ? null : () => _onLogoutPressed(context),
            icon: const Icon(Icons.logout_rounded, size: 24),
            label: Text(
              AppStrings.logout,
              style: TextStyles.font16SemiBold.copyWith(
                color: AppColors.secondaryRed,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondaryRed.withValues(alpha: 0.1),
              foregroundColor: AppColors.secondaryRed,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
                side: BorderSide(
                  color: AppColors.secondaryRed.withValues(alpha: 0.5),
                  width: 1,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

