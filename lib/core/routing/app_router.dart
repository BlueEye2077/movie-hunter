import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/account/logic/cubit/profile_cubit.dart';
import '../../features/auth/logic/cubit/auth_cubit.dart';
import '../../features/auth/ui/screens/login_screen.dart';

import '../../features/all_movies/data/models/all_movies_args.dart';
import '../../features/all_movies/logic/cubit/all_movies_cubit.dart';
import '../../features/all_movies/ui/screens/all_movies_screen.dart';
import '../../features/home/data/models/movie.dart';
import '../../features/home/logic/cubit/genres_cubit.dart';
import '../../features/movie_details/data/models/cast_and_crew_args.dart';
import '../../features/movie_details/logic/cubit/movie_details_cubit.dart';
import '../../features/movie_details/ui/screens/cast_and_crew_screen.dart';
import '../../features/movie_details/ui/screens/movie_details_screen.dart';
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
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProfileCubit>()..getAccountDetails(),
            child: const MainScreen(),
          ),
        );

      case Routes.search:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<SearchCubit>()),
              BlocProvider(create: (context) => getIt<GenresCubit>()..getGenres()),
            ],
            child: const SearchScreen(),
          ),
        );

      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.movieDetails:
        final movie = settings.arguments as Movie;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<MovieDetailsCubit>(),
            child: MovieDetailsScreen(movie: movie),
          ),
        );

      case Routes.castAndCrew:
        final args = settings.arguments as CastAndCrewArgs;
        return MaterialPageRoute(
          builder: (_) => CastAndCrewScreen(cast: args.cast, crew: args.crew),
        );

      case Routes.allMovies:
        final args = settings.arguments as AllMoviesArgs;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<GenresCubit>()..getGenres()),
              BlocProvider(
                create: (_) => getIt<AllMoviesCubit>()
                  ..setInitial(movies: args.movies, category: args.category),
              ),
            ],
            child: AllMoviesScreen(args: args),
          ),
        );

      default:
        return null;
    }
  }
}
