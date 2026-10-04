import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_spacing.dart';
import '../widgets/profile_favorites_section.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_logout_button.dart';
import '../widgets/profile_stats_row.dart';
import '../widgets/profile_watchlist_section.dart';

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
              // Avatar, Name, Username
              const Center(child: ProfileHeader()),
              SizedBox(height: 32.h),

              // Favorites & Watchlist count cards
              Padding(
                padding: AppSpacing.screenPadding,
                child: const ProfileStatsRow(),
              ),
              SizedBox(height: 32.h),

              // Favorites Movie List
              const ProfileFavoritesSection(),
              SizedBox(height: 24.h),

              // Watchlist Movie List
              const ProfileWatchlistSection(),
              SizedBox(height: 32.h),

              // Logout Button
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
