import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';

class PosterGradientOverlay extends StatelessWidget {
  const PosterGradientOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryDark.withValues(alpha: 0.2),
              AppColors.primaryDark,
            ],
          ),
        ),
      ),
    );
  }
}
