import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import 'custom_text_form_field.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final VoidCallback onLoginSubmitted;
  const LoginForm({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
    required this.onLoginSubmitted,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isObscure = true;

  Future<void> _launchForgotPassword() async {
    final Uri url = Uri.parse(ApiConstants.tmdbResetPasswordUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTextField(
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return AppStrings.pleaseEnterUsername;
              }
              return null;
            },
            controller: widget.usernameController,
            label: AppStrings.username,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 24.h),
          CustomTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.pleaseEnterPassword;
              }
              return null;
            },
            controller: widget.passwordController,
            label: AppStrings.password,
            obscureText: _isObscure,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
              child: Icon(
                _isObscure ? Icons.visibility_off : Icons.visibility,
                color: AppColors.textGrey,
                size: 20.sp,
              ),
            ),
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => widget.onLoginSubmitted(),
          ),
          SizedBox(height: 8.h),
          GestureDetector(
            onTap: _launchForgotPassword,
            child: Text(
              AppStrings.forgotPassword,
              style: TextStyles.font12Medium.copyWith(
                color: AppColors.primaryBlueAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
