import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/app_network_image.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/theming/colors.dart';

class PosterCard extends StatelessWidget {
  final String? posterPath;
  final String? heroTag;

  const PosterCard({super.key, this.posterPath, this.heroTag});

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: 205.w,
      height: 287.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.primarySoft, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: posterPath != null && posterPath!.trim().isNotEmpty
            ? AppNetworkImage(
                imageUrl: '${ApiConstants.imagesUrl}$posterPath',
                fit: BoxFit.cover,
                errorWidget: (context, error) => _posterPlaceholder(),
              )
            : _posterPlaceholder(),
      ),
    );

    if (heroTag == null) return card;
    return Hero(tag: heroTag!, child: card);
  }

  Widget _posterPlaceholder() {
    return Container(
      color: AppColors.primarySoft,
      child: Icon(Icons.movie, color: AppColors.textDarkGrey, size: 48.w),
    );
  }
}
