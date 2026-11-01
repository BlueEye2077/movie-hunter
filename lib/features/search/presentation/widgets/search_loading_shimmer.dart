import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/common/movie_shimmer_list_view.dart';
import '../../../../core/theming/app_spacing.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import 'search_actor_shimmer_item.dart';
import 'search_section_header.dart';

class SearchLoadingShimmer extends StatelessWidget {
  const SearchLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchSectionHeader(title: AppStrings.actors),
          SizedBox(
            height: 90.h,
            child: Shimmer.fromColors(
              baseColor: AppColors.primarySoft,
              highlightColor: AppColors.primarySoft.withValues(alpha: 0.5),
              child: ListView.separated(
                padding: AppSpacing.screenPadding,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (_, _) => SizedBox(width: 16.w),
                itemBuilder: (_, _) => const SearchActorShimmerItem(),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          const SearchSectionHeader(title: AppStrings.movieRelated),
          Padding(
            padding: AppSpacing.screenPadding,
            child: const MovieShimmerListView(),
          ),
        ],
      ),
    );
  }
}

