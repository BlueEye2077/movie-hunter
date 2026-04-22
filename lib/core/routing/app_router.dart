import 'package:flutter/material.dart';
import 'package:movie_hunter/main_screen.dart';
import 'package:movie_hunter/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:movie_hunter/features/search/ui/screens/search_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.home:
        // BlocProviders are now scoped inside MainScreen per-tab (Option B)
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      default:
        return null;
    }
  }
}
