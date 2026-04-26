import 'package:flutter/material.dart';
import 'colors.dart';

final ThemeData kMovieHunterTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.primaryDark,
  canvasColor: AppColors.primaryDark,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      .android: CupertinoPageTransitionsBuilder(),
      .iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);
