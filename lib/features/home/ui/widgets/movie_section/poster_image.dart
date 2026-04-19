import 'package:flutter/material.dart';
import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/core/theming/colors.dart';

class PosterImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  const PosterImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
      child: SizedBox(
        height: 178.h,
        width: 135.w,
        child: imageUrl.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: AppColors.primarySoft,
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
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
            : Container(color: AppColors.primarySoft),
      ),
    );
  }
}
