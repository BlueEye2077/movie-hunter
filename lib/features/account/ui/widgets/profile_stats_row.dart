import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/networking/api_response.dart';
import '../../../../core/networking/requests_state.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../features/home/data/models/movie.dart';
import '../../logic/cubit/favorite_movies_cubit.dart';
import '../../logic/cubit/watchlist_movies_cubit.dart';
import 'profile_stat_card.dart';

class ProfileStatsRow extends StatelessWidget {
  const ProfileStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocBuilder<FavoriteMoviesCubit, RequestsState<ApiResponse<Movie>>>(
            builder: (context, state) {
              final count = state.maybeWhen(
                success: (data) => data.totalResultsItems ?? 0,
                orElse: () => 0,
              );
              return ProfileStatCard(
                svgPath: 'assets/svgs/heart.svg',
                iconColor: AppColors.secondaryRed,
                count: count,
                label: AppStrings.favorites,
              );
            },
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: BlocBuilder<WatchlistMoviesCubit, RequestsState<ApiResponse<Movie>>>(
            builder: (context, state) {
              final count = state.maybeWhen(
                success: (data) => data.totalResultsItems ?? 0,
                orElse: () => 0,
              );
              return ProfileStatCard(
                svgPath: 'assets/svgs/star.svg',
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
