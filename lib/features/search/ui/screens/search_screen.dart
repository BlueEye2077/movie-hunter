import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/features/search/ui/widgets/empty_search.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/core/theming/styles.dart';
import 'package:movie_hunter/features/home/ui/widgets/home_search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: TextStyles.horizontalPadding,
            vertical: 16.h,
          ),
          child: Column(
            children: [
              // Search bar + Cancel
              Row(
                children: [
                  Expanded(
                    child: Hero(
                      tag: 'search_bar',
                      child: Material(
                        type: MaterialType.transparency,
                        child: const HomeSearchBar(),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Text(
                      'Cancel',
                      style: TextStyles.font12Medium.copyWith(
                        color: AppColors.textWhite,
                      ),
                    ),
                  ),
                ],
              ),
              //Todo: implement search
              // Body — empty state for now
              Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: const EmptySearch(
                      svgPath: 'assets/svgs/no_results_large.svg',
                      title: 'we are sorry, we can\nnot find the movie :(',
                      subtitle:
                          'Find your movie by Type title,\ncategories, years, etc ',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
