import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_spacing.dart';
import 'movie_shimmer_list_view.dart';
import 'movies_browser_grid_shimmer.dart';

class MoviesBrowserLoadingView extends StatelessWidget {
  final bool isGridView;

  const MoviesBrowserLoadingView({super.key, required this.isGridView});

  @override
  Widget build(BuildContext context) {
    if (isGridView) {
      return const MoviesBrowserGridShimmer();
    }
    return MovieShimmerListView(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.horizontalPadding,
        vertical: 16.h,
      ),
    );
  }
}
