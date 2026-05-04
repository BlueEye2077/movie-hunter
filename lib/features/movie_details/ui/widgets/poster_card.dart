import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/theming/colors.dart';

class PosterCard extends StatelessWidget {
  final String? posterPath;
  const PosterCard({super.key, this.posterPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 205.w,
      height: 287.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.primarySoft, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: posterPath != null
            ? CachedNetworkImage(
                imageUrl: '${ApiConstants.imagesUrl}$posterPath',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _posterPlaceholder(),
              )
            : _posterPlaceholder(),
      ),
    );
  }

  Widget _posterPlaceholder() {
    return Container(
      color: AppColors.primarySoft,
      child: Icon(Icons.movie, color: AppColors.textDarkGrey, size: 48.w),
    );
  }
}
