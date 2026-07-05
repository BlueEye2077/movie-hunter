import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/theming/colors.dart';
import '../../../account/logic/cubit/watchlist_cubit.dart';
import '../../../account/logic/cubit/watchlist_state.dart';
import 'movie_circle_action_button.dart';

class WatchlistToggleButton extends StatelessWidget {
  final int movieId;

  const WatchlistToggleButton({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WatchlistCubit>()..isMovieWatchlisted(movieId),
      child: BlocConsumer<WatchlistCubit, WatchlistState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (failure) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Text(NetworkExceptions.getErrorMessage(failure)),
                  backgroundColor: AppColors.secondaryRed,
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return MovieCircleActionButton(
                icon: Icons.hourglass_empty,
                iconColor: Colors.grey,
                onPressed: () {}, // Disabled during loading to prevent spam
              );
            },
            success: (isWatchlisted) {
              final bookmarkIcon =
                  isWatchlisted ? Icons.bookmark : Icons.bookmark_border;

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
                child: MovieCircleActionButton(
                  key: ValueKey<IconData>(bookmarkIcon),
                  icon: bookmarkIcon,
                  iconColor:
                      isWatchlisted ? AppColors.primaryBlueAccent : Colors.white,
                  onPressed: () {
                    context
                        .read<WatchlistCubit>()
                        .toggleWatchlist(movieId, isWatchlisted);
                  },
                ),
              );
            },
            orElse: () {
              return MovieCircleActionButton(
                icon: Icons.bookmark_border,
                iconColor: Colors.white,
                onPressed: () {},
              );
            },
          );
        },
      ),
    );
  }
}
