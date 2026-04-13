import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/core/theming/styles.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.h,
      decoration: BoxDecoration(
        color: AppColors.primarySoft,
        borderRadius: BorderRadius.circular(24.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/svgs/search.svg',
            width: 16.w,
            height: 16.w,
            colorFilter: ColorFilter.mode(AppColors.textGrey, BlendMode.srcIn),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              style: TextStyles.font14Medium.copyWith(color: AppColors.textWhite),
              decoration: InputDecoration(
                hintText: 'Search a title..',
                hintStyle: TextStyles.font14Medium.copyWith(color: AppColors.textGrey),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            width: 1.w,
            height: 16.h,
            color: AppColors.textDarkGrey,
          ),
          SizedBox(width: 8.w),
          SvgPicture.asset(
            'assets/svgs/options.svg',
            width: 16.w,
            height: 16.w,
            colorFilter: ColorFilter.mode(AppColors.textWhite, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}
