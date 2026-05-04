import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class MovieInfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const MovieInfoChip({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.textGrey, size: 16.w),
        SizedBox(width: 4.w),
        Text(label, style: TextStyles.font12Medium),
      ],
    );
  }
}
