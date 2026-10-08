import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/account/logic/cubit/favorite_movies_cubit.dart';
import '../../features/account/logic/cubit/profile_cubit.dart';
import '../../features/account/logic/cubit/watchlist_movies_cubit.dart';
import '../../features/account/ui/screens/favorites_screen.dart';
import '../../features/account/ui/screens/watchlist_screen.dart';
import '../../features/all_movies/data/models/all_movies_args.dart';
import '../../features/all_movies/logic/cubit/all_movies_cubit.dart';
import '../../features/all_movies/ui/screens/all_movies_screen.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/sign_up_screen.dart';
import '../../features/home/presentation/cubit/genres_cubit.dart';
import '../../features/movie_details/data/models/cast_and_crew_args.dart';
import '../../features/movie_details/logic/cubit/movie_details_cubit.dart';
import '../../features/movie_details/ui/screens/cast_and_crew_screen.dart';
import '../../features/movie_details/ui/screens/movie_details_screen.dart';
import '../../features/onboarding/ui/screens/onboarding_screen.dart';
import '../../features/person_details/logic/cubit/person_details_cubit.dart';
import '../../features/person_details/ui/screens/person_details_screen.dart';
import '../../features/search/logic/cubit/search_cubit.dart';
import '../../features/search/ui/screens/search_screen.dart';
import '../../main_screen.dart';
import '../di/dependency_injection.dart';
import '../models/movie.dart';
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
              // Use .value so the route borrows the singleton GenresCubit without closing it when popped.
              BlocProvider.value(value: getIt<GenresCubit>()..getGenres()),
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

      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case Routes.movieDetails:
        final movie = settings.arguments as Movie;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<MovieDetailsCubit>()),
              // Use .value so the route borrows the singleton GenresCubit without closing it when popped.
              BlocProvider.value(value: getIt<GenresCubit>()..getGenres()),
            ],
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
              // Use .value so the route borrows the singleton GenresCubit without closing it when popped.
              BlocProvider.value(value: getIt<GenresCubit>()..getGenres()),
              BlocProvider(
                create: (_) => getIt<AllMoviesCubit>()
                  ..setInitial(
                    movies: args.movies,
                    category: args.category,
                    entityId: args.entityId,
                  ),
              ),
            ],
            child: AllMoviesScreen(args: args),
          ),
        );

      case Routes.personDetails:
        final args = settings.arguments as (int, String);
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<PersonDetailsCubit>()),
              // Use .value so the route borrows the singleton GenresCubit without closing it when popped.
              BlocProvider.value(value: getIt<GenresCubit>()..getGenres()),
            ],
            child: PersonDetailsScreen(personId: args.$1, personName: args.$2),
          ),
        );

      case Routes.favorites:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: getIt<FavoriteMoviesCubit>()..getFavoriteMovies(),
              ),
              BlocProvider.value(value: getIt<GenresCubit>()..getGenres()),
            ],
            child: const FavoritesScreen(),
          ),
        );

      case Routes.watchlist:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: getIt<WatchlistMoviesCubit>()..getWatchlistMovies(),
              ),
              BlocProvider.value(value: getIt<GenresCubit>()..getGenres()),
            ],
            child: const WatchlistScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
