import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData kMovieHunterTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: AppColors.primaryDark,
    primary: AppColors.primaryBlueAccent,
  ),
  scrollbarTheme: const ScrollbarThemeData(
    thumbVisibility: WidgetStatePropertyAll(false),
    trackVisibility: WidgetStatePropertyAll(false),
    thickness: WidgetStatePropertyAll(0),
  ),
  scaffoldBackgroundColor: AppColors.primaryDark,
  canvasColor: AppColors.primaryDark,
  dialogTheme: const DialogThemeData(backgroundColor: AppColors.primaryDark),
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      for (final platform in TargetPlatform.values)
        platform: const ZoomPageTransitionsBuilder(),
    },
  ),
);
