import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class CategoryPill extends StatelessWidget {
  final String category;
  final bool isSelected;

  const CategoryPill({
    super.key,
    required this.category,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.symmetric(
        horizontal: isSelected ? 32.w : 12.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primarySoft : Colors.transparent,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        // Added center for alignment
        child: Text(
          category,
          style: TextStyles.font12Medium.copyWith(
            color: isSelected
                ? AppColors.primaryBlueAccent
                : AppColors.textWhiteGrey,
          ),
        ),
      ),
    );
  }
}
