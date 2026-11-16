import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_spacing.dart';
import '../../domain/entities/account_movie_list_type.dart';
import '../cubit/account_movies_cubit.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_logout_button.dart';
import '../widgets/profile_movies_section.dart';
import '../widgets/profile_stats_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: ProfileHeader()),
              SizedBox(height: 32.h),
              Padding(
                padding: AppSpacing.screenPadding,
                child: const ProfileStatsRow(),
              ),
              SizedBox(height: 32.h),
              const ProfileMoviesSection<FavoriteMoviesCubit>(
                listType: AccountMovieListType.favorites,
              ),
              SizedBox(height: 24.h),
              const ProfileMoviesSection<WatchlistMoviesCubit>(
                listType: AccountMovieListType.watchlist,
              ),
              SizedBox(height: 32.h),
              Padding(
                padding: AppSpacing.screenPadding,
                child: const ProfileLogoutButton(),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}

