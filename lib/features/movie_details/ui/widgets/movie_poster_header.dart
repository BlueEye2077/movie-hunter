import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'poster_backdrop_image.dart';
import 'poster_card.dart';
import 'poster_gradient_overlay.dart';

class MoviePosterHeader extends StatelessWidget {
  final String? posterPath;
  final String? backdropPath;

  const MoviePosterHeader({
    super.key,
    required this.posterPath,
    this.backdropPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background blurred poster
          PosterBackdropImage(imagePath: backdropPath ?? posterPath),
          // Gradient overlay
          const PosterGradientOverlay(),
          // Main poster card
          Positioned(
            top: 108.h,
            child: PosterCard(posterPath: posterPath),
          ),
        ],
      ),
    );
  }
}
