import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/core/theming/styles.dart';
import 'package:movie_hunter/features/home/ui/widgets/categories_list.dart';
import 'package:movie_hunter/features/home/ui/widgets/home_bottom_nav_bar.dart';
import 'package:movie_hunter/features/home/ui/widgets/home_search_bar.dart';
import 'package:movie_hunter/features/home/ui/widgets/home_top_bar.dart';
import 'package:movie_hunter/features/home/ui/widgets/most_popular_movies_builder.dart';
import 'package:movie_hunter/features/home/ui/widgets/now_playing_movies_builder.dart';
import 'package:movie_hunter/features/home/ui/widgets/top_rated_movies_builder.dart';
import 'package:movie_hunter/features/home/ui/widgets/upcoming_movies/upcoming_movies_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Bar
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: TextStyles.horizontalPadding,
                  ),
                  child: const HomeTopBar(),
                ),
                SizedBox(height: 32.h),
                // Search Bar
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: TextStyles.horizontalPadding,
                  ),
                  child: const HomeSearchBar(),
                ),
                SizedBox(height: 24.h),
                const UpcomingMoviesBuilder(),
                SizedBox(height: 24.h),
                const CategoriesList(),
                SizedBox(height: 24.h),
                const NowPlayingMoviesBuilder(),
                SizedBox(height: 24.h),
                const MostPopularMoviesBuilder(),
                SizedBox(height: 24.h),
                const TopRatedMoviesBuilder(),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const HomeBottomNavBar(),
    );
  }
}
