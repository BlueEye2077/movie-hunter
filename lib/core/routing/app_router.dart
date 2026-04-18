import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hunter/core/di/dependency_injection.dart';
import 'package:movie_hunter/features/home/logic/cubit/now_playing_movies_cubit.dart';
import 'package:movie_hunter/features/home/logic/cubit/top_rated_movies_cubit.dart';
import 'package:movie_hunter/features/home/logic/cubit/upcoming_movies_cubit.dart';
import 'package:movie_hunter/features/home/logic/cubit/popular_movies_cubit.dart';
import 'package:movie_hunter/features/home/logic/cubit/genres_cubit.dart';
import 'package:movie_hunter/features/home/ui/screens/home_screen.dart';
import 'package:movie_hunter/features/onboarding/ui/screens/onboarding_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                // get upcoming movies [run the getUpComingMovies method right away]
                create: (context) =>
                    getIt<UpComingMoviesCubit>()..getUpComingMovies(),
              ),
              BlocProvider(
                // get popular movies [run the getPopularMovies method right away]
                create: (context) =>
                    getIt<PopularMoviesCubit>()..getPopularMovies(),
              ),
              BlocProvider(
                // get top rated movies [run the getTopRatedMovies method right away]
                create: (context) =>
                    getIt<TopRatedMoviesCubit>()..getTopRatedMovies(),
              ),
              BlocProvider(
                // get now playing movies [run the getNowPlayingMovies method right away]
                create: (context) =>
                    getIt<NowPlayingMoviesCubit>()..getNowPlayingMovies(),
              ),
              BlocProvider(
                // get genres [run the getGenres method right away]
                create: (context) => getIt<GenresCubit>()..getGenres(),
              ),
            ],
            child: const HomeScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
