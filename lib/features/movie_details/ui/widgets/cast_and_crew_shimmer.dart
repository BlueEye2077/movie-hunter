import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import 'movie_cast_item_shimmer.dart';

class CastAndCrewShimmer extends StatelessWidget {
  const CastAndCrewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: TextStyles.horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cast and Crew',
                style: TextStyles.font16SemiBold.copyWith(
                  color: AppColors.textWhite,
                ),
              ),
              Text(
                'See All',
                style: TextStyles.font14Medium.copyWith(
                  color: AppColors.primaryBlueAccent,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 40.h,
            child: Shimmer.fromColors(
              baseColor: AppColors.primarySoft,
              highlightColor: AppColors.primarySoft.withValues(
                alpha: 0.5,
              ),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                itemCount: 5,
                separatorBuilder: (context, index) => SizedBox(width: 16.w),
                itemBuilder: (context, index) {
                  return const MovieCastItemShimmer();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
