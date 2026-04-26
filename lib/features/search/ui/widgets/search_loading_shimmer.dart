import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import 'search_actor_shimmer_item.dart';
import 'search_movie_shimmer_item.dart';
import 'package:shimmer/shimmer.dart';

class SearchLoadingShimmer extends StatelessWidget {
  const SearchLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: TextStyles.horizontalPadding,
                  right: TextStyles.horizontalPadding,
                  bottom: 16.h,
                ),
                child: Text(
                  'Actors',
                  style: TextStyles.font16SemiBold.copyWith(
                    color: AppColors.textWhite,
                  ),
                ),
              ),
              SizedBox(
                height: 90.h,
                child: Shimmer.fromColors(
                  baseColor: AppColors.primarySoft,
                  highlightColor: AppColors.primarySoft.withValues(alpha: 0.5),
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    separatorBuilder: (context, index) => SizedBox(width: 16.w),
                    itemBuilder: (context, index) {
                      return const SearchActorShimmerItem();
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: TextStyles.horizontalPadding,
                  right: TextStyles.horizontalPadding,
                  bottom: 16.h,
                ),
                child: Text(
                  'Movie Related',
                  style: TextStyles.font16SemiBold.copyWith(
                    color: AppColors.textWhite,
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: AppColors.primarySoft,
                highlightColor: AppColors.primarySoft.withValues(alpha: 0.5),
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  separatorBuilder: (context, index) => SizedBox(height: 16.h),
                  itemBuilder: (context, index) {
                    return const SearchMovieShimmerItem();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
