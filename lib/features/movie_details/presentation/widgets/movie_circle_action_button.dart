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
    return Material(
      color: AppColors.primarySoft,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: SizedBox(
          width: 48.w,
          height: 48.w,
          child: Icon(icon, color: iconColor, size: 24.w),
        ),
      ),
    );
  }
}

