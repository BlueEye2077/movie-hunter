import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class MovieDetailsActionButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;

  const MovieDetailsActionButton({
    super.key,
    required this.icon,
    this.iconColor = AppColors.textWhite,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 32.w,
        height: 32.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
        child: Icon(icon, color: iconColor, size: 18.w),
      ),
    );
  }
}
