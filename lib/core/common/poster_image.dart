import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../networking/api_constants.dart';
import '../theming/colors.dart';

class PosterImage extends StatelessWidget {
  final String? imageUrl;
  final double height;
  final double width;
  final double topRadius;
  final double bottomRadius;
  const PosterImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
    this.topRadius = 12,
    this.bottomRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topRadius),
        topRight: Radius.circular(topRadius),
        bottomLeft: Radius.circular(bottomRadius),
        bottomRight: Radius.circular(bottomRadius),
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: imageUrl != null
            ? CachedNetworkImage(
                imageUrl: "${ApiConstants.imagesUrl}$imageUrl",
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: AppColors.primarySoft,
                  highlightColor: AppColors.primarySoft.withValues(alpha: 0.5),
                  child: Container(color: AppColors.primarySoft),
                ),
                errorBuilder: (context, url, error) => Container(
                  color: AppColors.primarySoft,
                  child: Icon(
                    Icons.movie,
                    color: AppColors.textDarkGrey,
                    size: 40.w,
                  ),
                ),
              )
            : Container(
                color: AppColors.primarySoft,
                child: Icon(
                  Icons.movie,
                  color: AppColors.textDarkGrey,
                  size: 40.w,
                ),
              ),
      ),
    );
  }
}
