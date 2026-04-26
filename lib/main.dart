import 'package:flutter/material.dart';
import 'movie_hunter_app.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';

void main() {
  initGetIt();
  runApp(MovieHunterApp(appRouter: AppRouter()));
}
