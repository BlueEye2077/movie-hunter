import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/theming/colors.dart';
import '../../../account/presentation/cubit/movie_account_status_cubit.dart';
import 'movie_details_action_button.dart';

class FavoriteToggleActionButton extends StatelessWidget {
  final int movieId;

  const FavoriteToggleActionButton({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieAccountStatusCubit, MovieAccountStatusState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (failure) {
            ScaffoldMessenger.of(context)
              ..clearSnackBars()
              ..showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Text(NetworkExceptions.getErrorMessage(failure)),
                  backgroundColor: AppColors.secondaryRed,
                ),
              );
          },
        );
      },
      builder: (context, state) {
        final isFavorite = state.maybeWhen(
          success: (status) => status.isFavorite,
          orElse: () => false,
        );
        final favIcon = isFavorite ? Icons.favorite : Icons.favorite_border;

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
              context.read<MovieAccountStatusCubit>().toggleFavorite(movieId);
            },
          ),
        );
      },
    );
  }
}
