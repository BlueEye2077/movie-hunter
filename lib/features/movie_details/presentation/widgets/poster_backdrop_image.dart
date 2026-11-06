import 'package:flutter/material.dart';

import '../../../../core/common/app_network_image.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/theming/colors.dart';

class PosterBackdropImage extends StatelessWidget {
  final String? imagePath;

  const PosterBackdropImage({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    if (imagePath == null || imagePath!.trim().isEmpty) {
      return const ColoredBox(color: AppColors.primaryDark);
    }
    return AppNetworkImage(
      imageUrl: '${ApiConstants.imagesUrl}$imagePath',
      fit: BoxFit.cover,
      color: AppColors.primaryDark.withValues(alpha: 0.40),
      colorBlendMode: BlendMode.darken,
      errorWidget: (context, error) =>
          const ColoredBox(color: AppColors.primaryDark),
    );
  }
}
