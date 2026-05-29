import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../features/search/ui/widgets/search_movie_shimmer_item.dart';
import '../theming/colors.dart';

class MovieShimmerList extends StatelessWidget {
  final int itemCount;

  const MovieShimmerList({super.key, this.itemCount = 5});

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
        itemBuilder: (_, _) => const SearchMovieShimmerItem(),
      ),
    );
  }
}
