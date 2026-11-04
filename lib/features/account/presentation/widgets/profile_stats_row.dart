import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../cubit/account_movies_cubit.dart';
import 'profile_stat_card.dart';

class ProfileStatsRow extends StatelessWidget {
  const ProfileStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocSelector<FavoriteMoviesCubit, AccountMoviesState, int>(
            selector: (state) => state.maybeWhen(
              success: (_, totalResults, _, _) => totalResults,
              orElse: () => 0,
            ),
            builder: (context, count) {
              return ProfileStatCard(
                svgPath: AppAssets.heartSvg,
                iconColor: AppColors.secondaryRed,
                count: count,
                label: AppStrings.favorites,
              );
            },
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: BlocSelector<WatchlistMoviesCubit, AccountMoviesState, int>(
            selector: (state) => state.maybeWhen(
              success: (_, totalResults, _, _) => totalResults,
              orElse: () => 0,
            ),
            builder: (context, count) {
              return ProfileStatCard(
                svgPath: AppAssets.starSvg,
                iconColor: AppColors.primaryBlueAccent,
                count: count,
                label: AppStrings.watchlist,
              );
            },
          ),
        ),
      ],
    );
  }
}

