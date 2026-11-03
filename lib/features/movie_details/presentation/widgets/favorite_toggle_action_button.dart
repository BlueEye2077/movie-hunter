import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/theming/colors.dart';
import '../../../account/logic/cubit/favourites_cubit.dart';
import 'movie_details_action_button.dart';

class FavoriteToggleActionButton extends StatelessWidget {
  final int movieId;

  const FavoriteToggleActionButton({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<FavouritesCubit>()..isMovieFavorite(movieId),
      child: BlocConsumer<FavouritesCubit, FavouritesState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (failure) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Text(
                    NetworkExceptions.getErrorMessage(failure),
                  ),
                  backgroundColor: AppColors.secondaryRed,
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          final isFavorite = context.read<FavouritesCubit>().isFavorite;
          final favIcon = isFavorite
              ? Icons.favorite
              : Icons.favorite_border;

          return AnimatedSwitcher(
            switchInCurve: Curves.easeOutBack,
            switchOutCurve: Curves.easeIn,
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: MovieDetailsActionButton(
              key: ValueKey<IconData>(favIcon),
              icon: favIcon,
              iconColor: AppColors.secondaryRed,
              onPressed: () {
                context.read<FavouritesCubit>().toggleFavorite(movieId);
              },
            ),
          );
        },
      ),
    );
  }
}
