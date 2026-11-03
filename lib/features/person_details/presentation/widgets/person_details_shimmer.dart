import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/common/movies_list_view.dart';
import '../../../../core/common/movies_section.dart';
import '../../../../core/theming/app_spacing.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';

class PersonDetailsShimmer extends StatelessWidget {
  const PersonDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          Shimmer.fromColors(
            baseColor: AppColors.primarySoft,
            highlightColor: AppColors.primarySoft.withValues(alpha: 0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _HeaderShimmer(),
                SizedBox(height: 28.h),
                Padding(
                  padding: AppSpacing.screenPadding,
                  child: const _BiographyShimmer(),
                ),
              ],
            ),
          ),
          SizedBox(height: 28.h),
          const MoviesSection(
            title: AppStrings.knownFor,
            child: MoviesListView.shimmer(),
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}

class _ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const _ShimmerBox({
    required this.width,
    required this.height,
    this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

class _HeaderShimmer extends StatelessWidget {
  const _HeaderShimmer();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 110.w,
            height: 110.w,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(height: 16.h),
          _ShimmerBox(width: 150.w, height: 18.h),
          SizedBox(height: 8.h),
          _ShimmerBox(width: 100.w, height: 12.h),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ShimmerBox(width: 80.w, height: 32.h, radius: 16.r),
              SizedBox(width: 16.w),
              _ShimmerBox(width: 120.w, height: 32.h, radius: 16.r),
            ],
          ),
        ],
      ),
    );
  }
}

class _BiographyShimmer extends StatelessWidget {
  const _BiographyShimmer();

  static const int _fullLines = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ShimmerBox(width: 100.w, height: 18.h),
        SizedBox(height: 12.h),
        for (var i = 0; i < _fullLines; i++) ...[
          _ShimmerBox(width: double.infinity, height: 12.h),
          SizedBox(height: 8.h),
        ],
        _ShimmerBox(width: 200.w, height: 12.h),
      ],
    );
  }
}
