import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class MovieDetailsActionButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;
  final String? tooltip;

  const MovieDetailsActionButton({
    super.key,
    required this.icon,
    this.iconColor = AppColors.textWhite,
    required this.onPressed,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      constraints: BoxConstraints(minWidth: 48.w, minHeight: 48.w),
      icon: Icon(icon, color: iconColor, size: 20.w),
    );
  }
}

