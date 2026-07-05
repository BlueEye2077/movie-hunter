import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../account/logic/cubit/favourites_cubit.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import 'movie_details_action_button.dart';

class MovieDetailsAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onBackPressed;
  final int movieId;

  const MovieDetailsAppBar({
    super.key,
    required this.title,
    required this.onBackPressed,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          MovieDetailsActionButton(
            icon: Icons.arrow_back_ios_new,
            onPressed: onBackPressed,
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.font16SemiBold.copyWith(
                color: AppColors.textWhite,
              ),
            ),
          ),
          BlocProvider(
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
          ),
        ],
      ),
    );
  }
}
