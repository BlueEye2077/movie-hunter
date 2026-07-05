import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildTextField(
          controller: widget.emailController,
          label: AppStrings.emailAddress,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 24.h),
        _buildTextField(
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
        ),
        SizedBox(height: 8.h),
        Text(
          AppStrings.forgotPassword,
          style: TextStyles.font12Medium.copyWith(color: AppColors.primaryBlueAccent),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: TextStyles.font14Medium.copyWith(color: AppColors.textWhite),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyles.font14Medium.copyWith(color: AppColors.textWhiteGrey),
        floatingLabelStyle: TextStyles.font14Medium.copyWith(color: AppColors.primaryBlueAccent),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        filled: true,
        fillColor: AppColors.primarySoft,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: AppColors.primaryBlueAccent, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: AppColors.secondaryRed, width: 1.5),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
