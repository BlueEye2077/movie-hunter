import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hunter/core/di/dependency_injection.dart';
import 'package:movie_hunter/features/home/logic/cubit/home_cubit.dart';
import 'package:movie_hunter/features/home/ui/screens/home_screen.dart';
import 'package:movie_hunter/features/onboarding/screens/onboarding_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>()
              ..getUpComingMovies()
              ..getPopularMovies(),
            child: HomeScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
