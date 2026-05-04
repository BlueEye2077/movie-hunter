import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/logic/cubit/genres_cubit.dart';
import '../../features/onboarding/ui/screens/onboarding_screen.dart';
import '../../features/search/logic/cubit/search_cubit.dart';
import '../../features/search/ui/screens/search_screen.dart';
import '../../main_screen.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.mainScreen:
        // BlocProviders are passed through the main screen for better performance and state management
        // and to avoid unnecessary rebuilds when switching between tabs.
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
