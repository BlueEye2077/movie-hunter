import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/account/logic/cubit/favorite_movies_cubit.dart';
import '../../features/account/logic/cubit/profile_cubit.dart';
import '../../features/account/logic/cubit/watchlist_movies_cubit.dart';
import '../../features/account/ui/screens/favorites_screen.dart';
import '../../features/account/ui/screens/watchlist_screen.dart';
import '../../features/all_movies/presentation/cubit/all_movies_cubit.dart';
import '../../features/all_movies/presentation/models/all_movies_args.dart';
import '../../features/all_movies/presentation/screens/all_movies_screen.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/sign_up_screen.dart';
import '../../features/movie_details/presentation/cubit/movie_credits_cubit.dart';
import '../../features/movie_details/presentation/cubit/movie_details_cubit.dart';
import '../../features/movie_details/presentation/cubit/movie_trailer_cubit.dart';
import '../../features/movie_details/presentation/cubit/similar_movies_cubit.dart';
import '../../features/movie_details/presentation/models/cast_and_crew_args.dart';
import '../../features/movie_details/presentation/screens/cast_and_crew_screen.dart';
import '../../features/movie_details/presentation/screens/movie_details_screen.dart';
import '../../features/onboarding/ui/screens/onboarding_screen.dart';
import '../../features/person_details/presentation/cubit/person_details_cubit.dart';
import '../../features/person_details/presentation/models/person_details_args.dart';
import '../../features/person_details/presentation/screens/person_details_screen.dart';
import '../../features/search/presentation/cubit/search_cubit.dart';
import '../../features/search/presentation/screens/search_screen.dart';
import '../../main_screen.dart';
import '../di/dependency_injection.dart';
import '../domain/entities/movie_entity.dart';
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
          builder: (_) => BlocProvider(
            create: (context) => getIt<SearchCubit>(),
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
        final dynamic arg = settings.arguments;
        // TODO: Remove `Movie` fallback once `account` is refactored to use `MovieEntity`.
        final MovieEntity movie = switch (arg) {
          MovieEntity entity => entity,
          Movie legacyMovie => legacyMovie.toEntity(),
          _ => const MovieEntity(),
        };
        final int movieId = movie.id ?? 0;

        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) {
                  final cubit = getIt<MovieDetailsCubit>();
                  if (movieId > 0) cubit.fetchMovieDetails(movieId);
                  return cubit;
                },
              ),
              BlocProvider(
                create: (_) {
                  final cubit = getIt<MovieCreditsCubit>();
                  if (movieId > 0) cubit.fetchMovieCredits(movieId);
                  return cubit;
                },
              ),
              BlocProvider(create: (_) => getIt<MovieTrailerCubit>()),
              BlocProvider(
                create: (_) {
                  final cubit = getIt<SimilarMoviesCubit>();
                  if (movieId > 0) cubit.getSimilarMovies(movieId);
                  return cubit;
                },
              ),
            ],
            child: MovieDetailsScreen(movie: movie),
          ),
        );

      case Routes.castAndCrew:
        final args = settings.arguments as CastAndCrewArgs;
        return MaterialPageRoute(
          builder: (_) => CastAndCrewScreen(credits: args.credits),
        );

      case Routes.allMovies:
        final args = settings.arguments as AllMoviesArgs;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<AllMoviesCubit>()
              ..setInitial(movies: args.movies, source: args.allMoviesSource),
            child: AllMoviesScreen(args: args),
          ),
        );

      case Routes.personDetails:
        final args = settings.arguments as PersonDetailsArgs;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) =>
                getIt<PersonDetailsCubit>()..getPersonDetails(args.id),
            child: PersonDetailsScreen(args: args),
          ),
        );

      case Routes.favorites:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<FavoriteMoviesCubit>()..getFavoriteMovies(),
            child: const FavoritesScreen(),
          ),
        );

      case Routes.watchlist:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<WatchlistMoviesCubit>()..getWatchlistMovies(),
            child: const WatchlistScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
