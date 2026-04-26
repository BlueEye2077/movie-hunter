import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
import 'core/theming/movie_hunter_theme.dart';

class MovieHunterApp extends StatelessWidget {
  final AppRouter appRouter;

  const MovieHunterApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // set the design size to 375x812 from the figma design
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Movie Hunter',
          debugShowCheckedModeBanner: false,
          theme: kMovieHunterTheme,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
