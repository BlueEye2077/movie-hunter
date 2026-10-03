import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../theming/colors.dart';
import 'movie_shimmer_list_view_item.dart';

class MovieShimmerListView extends StatelessWidget {
  final int itemCount;

  const MovieShimmerListView({super.key, this.itemCount = 5});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primarySoft,
      highlightColor: AppColors.primarySoft.withValues(alpha: 0.5),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemCount,
        separatorBuilder: (_, _) => SizedBox(height: 16.h),
        itemBuilder: (_, _) => const MovieShimmerListViewItem(),
      ),
    );
  }
}