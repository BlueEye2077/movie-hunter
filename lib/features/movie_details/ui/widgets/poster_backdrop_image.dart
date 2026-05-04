import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/theming/colors.dart';

class PosterBackdropImage extends StatelessWidget {
  final String? imagePath;
  const PosterBackdropImage({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    if (imagePath == null) {
      return Container(color: AppColors.primaryDark);
    }
    return Positioned.fill(
      child: Opacity(
        opacity: 0.60,
        child: CachedNetworkImage(
          imageUrl: '${ApiConstants.imagesUrl}$imagePath',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              Container(color: AppColors.primaryDark),
        ),
      ),
    );
  }
}
