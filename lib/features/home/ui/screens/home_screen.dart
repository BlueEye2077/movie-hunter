import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';
import '../widgets/categories_list.dart';
import '../widgets/clickable_search_bar.dart';
import '../widgets/home_top_bar.dart';
import '../widgets/most_popular_movies_builder.dart';
import '../widgets/now_playing_movies_builder.dart';
import '../widgets/top_rated_movies_builder.dart';
import '../widgets/upcoming_movies/upcoming_movies_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              // Clickable Search Bar
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: TextStyles.horizontalPadding,
                ),
                child: const ClickableSearchBar(),
              ),
              SizedBox(height: 24.h),
              // Upcoming Movies
              const UpcomingMoviesBuilder(),
              SizedBox(height: 24.h),
              // Categories List
              const CategoriesList(),
              SizedBox(height: 24.h),
              // Now Playing Movies
              const NowPlayingMoviesBuilder(),
              SizedBox(height: 24.h),
              // Most Popular Movies
              const MostPopularMoviesBuilder(),
              SizedBox(height: 24.h),
              // Top Rated Movies
              const TopRatedMoviesBuilder(),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
