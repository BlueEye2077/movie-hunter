import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/core/constants/constants.dart';
import 'package:movie_hunter/core/routing/routes.dart';

import 'core/routing/app_router.dart';
import 'core/theming/movie_hunter_theme.dart';
import 'core/theming/strings.dart';

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
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          theme: kMovieHunterTheme,
          initialRoute: getInitialRoute(),
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}

String getInitialRoute() {
  if (isLoggedInUser && isSeenOnBoarding) {
    return Routes.mainScreen;
  } else if (!isLoggedInUser && isSeenOnBoarding) {
    return Routes.login;
  } else {
    return Routes.onboarding;
  }
}
