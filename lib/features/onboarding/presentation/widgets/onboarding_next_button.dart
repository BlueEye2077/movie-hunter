import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/colors.dart';

class OnboardingNextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const OnboardingNextButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60.w,
        height: 60.w,
        decoration: BoxDecoration(
          color: AppColors.primaryBlueAccent,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Center(
          child: RotatedBox(
            quarterTurns: 2, // Rotate 180 degrees
            child: SvgPicture.asset(
              AppAssets.arrowBackSvg,
              height: 24.w,
              width: 24.w,
              colorFilter: const ColorFilter.mode(
                AppColors.textBlack,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

