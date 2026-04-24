import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/core/theming/styles.dart';

class SearchMovieInfoRow extends StatelessWidget {
  final String? svgIcon;
  final IconData? iconData;
  final String text;

  const SearchMovieInfoRow({
    super.key,
    this.svgIcon,
    this.iconData,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (svgIcon != null)
          SvgPicture.asset(
            svgIcon!,
            width: 16.w,
            height: 16.h,
            colorFilter: const ColorFilter.mode(
              AppColors.textGrey,
              BlendMode.srcIn,
            ),
          )
        else if (iconData != null)
          Icon(iconData, size: 16.w, color: AppColors.textGrey),
        SizedBox(width: 4.w),
        Text(
          text,
          style: TextStyles.font12Medium.copyWith(color: AppColors.textGrey),
        ),
      ],
    );
  }
}
