import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../logic/cubit/genres_cubit.dart';
import '../../logic/cubit/now_playing_movies_cubit.dart';
import '../../logic/cubit/popular_movies_cubit.dart';
import '../../logic/cubit/top_rated_movies_cubit.dart';
import '../../logic/cubit/upcoming_movies_cubit.dart';

// Bloc providers for the home tab
class HomeTabBlocProviders extends StatelessWidget {
  final Widget child;

  const HomeTabBlocProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<UpComingMoviesCubit>()..getUpComingMovies(),
        ),
        BlocProvider(
          create: (_) => getIt<PopularMoviesCubit>()..getPopularMovies(),
        ),
        BlocProvider(
          create: (_) => getIt<TopRatedMoviesCubit>()..getTopRatedMovies(),
        ),
        BlocProvider(
          create: (_) => getIt<NowPlayingMoviesCubit>()..getNowPlayingMovies(),
        ),
        BlocProvider(create: (_) => getIt<GenresCubit>()..getGenres()),
      ],
      child: child,
    );
  }
}
