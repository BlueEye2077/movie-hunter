import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/core/helpers/app_strings.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/core/theming/styles.dart';

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
        labelStyle: TextStyles.font12Medium.copyWith(color: AppColors.textWhiteGrey),
        floatingLabelStyle: TextStyles.font12Medium.copyWith(color: AppColors.textWhiteGrey),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: const BorderSide(color: AppColors.primarySoft, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: const BorderSide(color: AppColors.primaryBlueAccent, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: const BorderSide(color: AppColors.secondaryRed, width: 1),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
