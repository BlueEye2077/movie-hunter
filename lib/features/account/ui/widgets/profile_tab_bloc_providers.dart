import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../logic/cubit/favorite_movies_cubit.dart';
import '../../logic/cubit/watchlist_movies_cubit.dart';

class ProfileTabBlocProviders extends StatelessWidget {
  final Widget child;

  const ProfileTabBlocProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<FavoriteMoviesCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<WatchlistMoviesCubit>(),
        ),
      ],
      child: child,
    );
  }
}
