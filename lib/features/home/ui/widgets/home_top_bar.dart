import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.primarySoft,
              child: SvgPicture.asset(
                'assets/svgs/person.svg',
                width: 24.w,
                height: 24.w,
                colorFilter: ColorFilter.mode(
                  AppColors.textGrey,
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // TODO: get user name from api
                  'Hello, Smith',
                  style: TextStyles.font16SemiBold.copyWith(
                    color: AppColors.textWhite,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Let\'s stream your favorite movie',
                  style: TextStyles.font12Medium,
                ),
              ],
            ),
          ],
        ),
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: AppColors.primarySoft.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/svgs/heart.svg',
              width: 20.w,
              height: 20.w,
              colorFilter: ColorFilter.mode(
                AppColors.secondaryRed,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
