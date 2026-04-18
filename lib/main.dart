import 'package:flutter/material.dart';
import 'package:movie_hunter/movie_hunter_app.dart';

import 'package:movie_hunter/core/di/dependency_injection.dart';
import 'package:movie_hunter/core/routing/app_router.dart';

void main() {
  initGetIt();
  runApp(MovieHunterApp(appRouter: AppRouter()));
}
