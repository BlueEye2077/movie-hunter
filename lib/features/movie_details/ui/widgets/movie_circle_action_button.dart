import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class MovieCircleActionButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;

  const MovieCircleActionButton({
    super.key,
    required this.icon,
    this.iconColor = AppColors.secondaryOrange,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 48.w,
        height: 48.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primarySoft,
        ),
        child: Icon(icon, color: iconColor, size: 24.w),
      ),
    );
  }
}
