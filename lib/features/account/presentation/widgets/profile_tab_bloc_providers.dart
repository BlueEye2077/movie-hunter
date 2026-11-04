import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../cubit/account_movies_cubit.dart';
import '../cubit/logout_cubit.dart';

class ProfileTabBlocProviders extends StatelessWidget {
  final Widget child;

  const ProfileTabBlocProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<FavoriteMoviesCubit>()..fetchInitialMovies(),
        ),
        BlocProvider(
          create: (_) => getIt<WatchlistMoviesCubit>()..fetchInitialMovies(),
        ),
        BlocProvider(
          create: (_) => getIt<LogoutCubit>(),
        ),
      ],
      child: child,
    );
  }
}

