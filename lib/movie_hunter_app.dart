import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/core/routing/app_router.dart';

class MovieHunterApp extends StatelessWidget {
  final AppRouter appRouter;

  const MovieHunterApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Movie Hunter',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
