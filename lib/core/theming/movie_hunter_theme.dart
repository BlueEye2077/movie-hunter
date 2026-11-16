import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:material_ui/material_ui.dart';
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
