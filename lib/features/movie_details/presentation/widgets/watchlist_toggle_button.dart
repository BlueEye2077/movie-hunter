import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors.dart';
import '../../../account/presentation/cubit/movie_account_status_cubit.dart';
import 'movie_circle_action_button.dart';

class WatchlistToggleButton extends StatelessWidget {
  final int movieId;

  const WatchlistToggleButton({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieAccountStatusCubit, MovieAccountStatusState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => MovieCircleActionButton(
            icon: Icons.hourglass_empty,
            iconColor: AppColors.textGrey,
            onPressed: () {},
          ),
          success: (status) {
            final isWatchlisted = status.isWatchlisted;
            final bookmarkIcon = isWatchlisted
                ? Icons.bookmark
                : Icons.bookmark_border;

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
                iconColor: isWatchlisted
                    ? AppColors.primaryBlueAccent
                    : AppColors.textWhite,
                onPressed: () {
                  context.read<MovieAccountStatusCubit>().toggleWatchlist(
                    movieId,
                  );
                },
              ),
            );
          },
          orElse: () => MovieCircleActionButton(
            icon: Icons.bookmark_border,
            iconColor: AppColors.textWhite,
            onPressed: () {
              context.read<MovieAccountStatusCubit>().loadStatus(movieId);
            },
          ),
        );
      },
    );
  }
}
