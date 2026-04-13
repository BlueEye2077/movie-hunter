import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/core/theming/styles.dart';
import 'package:movie_hunter/features/home/ui/widgets/categories_list.dart';
import 'package:movie_hunter/features/home/ui/widgets/home_bottom_nav_bar.dart';
import 'package:movie_hunter/features/home/ui/widgets/home_search_bar.dart';
import 'package:movie_hunter/features/home/ui/widgets/home_top_bar.dart';
import 'package:movie_hunter/features/home/ui/widgets/popular_movies/most_popular_section.dart';
import 'package:movie_hunter/features/home/ui/widgets/upcoming_movies/upcoming_movies_section.dart';

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
                const UpcomingMoviesSection(),
                SizedBox(height: 24.h),
                const CategoriesList(),
                SizedBox(height: 24.h),
                const MostPopularSection(),
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
