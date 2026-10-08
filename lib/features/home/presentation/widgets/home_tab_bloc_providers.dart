import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../cubit/genres_cubit.dart';
import '../cubit/now_playing_movies_cubit.dart';
import '../cubit/popular_movies_cubit.dart';
import '../cubit/top_rated_movies_cubit.dart';
import '../cubit/upcoming_movies_cubit.dart';

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
        // Use .value so this tab borrows the singleton GenresCubit without closing it on unmount.
        BlocProvider.value(value: getIt<GenresCubit>()..getGenres()),
      ],
      child: child,
    );
  }
}
