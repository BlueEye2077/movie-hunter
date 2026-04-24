import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hunter/core/di/dependency_injection.dart';
import 'package:movie_hunter/features/home/logic/cubit/genres_cubit.dart';
import 'package:movie_hunter/features/search/logic/cubit/search_cubit.dart';
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
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SearchCubit(searchRepository: getIt()),
              ),
              BlocProvider.value(
                value: getIt<GenresCubit>(),
              ),
            ],
            child: const SearchScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
