import 'package:flutter/material.dart';
import 'package:movie_hunter/features/onboarding/screens/onboarding_screen.dart';
import 'routes.dart';

class AppRouter {

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      default:
        return null;
    }
  }
}
