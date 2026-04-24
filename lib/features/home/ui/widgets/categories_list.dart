import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/core/theming/styles.dart';
import 'package:movie_hunter/features/home/ui/widgets/category_pill.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  final List<String> categories = ['All', 'Comedy', 'Animation', 'Documentary'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // The categories title
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: TextStyles.horizontalPadding,
          ),
          child: Text(
            'Categories',
            style: TextStyles.font16SemiBold.copyWith(
              color: AppColors.textWhite,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        // The categories list
        SizedBox(
          height: 40.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: TextStyles.horizontalPadding,
            ),
            scrollDirection: Axis.horizontal,
            clipBehavior:
                Clip.none, // Allows items to scroll into screen margins
            itemCount: categories.length,
            // add a fixed space between every element
            separatorBuilder: (context, index) => SizedBox(width: 8.w),
            itemBuilder: (context, index) {
              final isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  // TODO: implement category filtering
                  setState(() {
                    selectedIndex = index;
                  });
                },
                // The categories animation when select a category item
                child: CategoryPill(
                  category: categories[index],
                  isSelected: isSelected,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
