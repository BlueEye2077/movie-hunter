import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/data/models/genre.dart';
import 'category_card.dart';

class CategoriesGridView extends StatelessWidget {
  final List<Genre> genres;
  final Map<int, String> imagesMap;

  const CategoriesGridView({
    super.key,
    required this.genres,
    required this.imagesMap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: GridView.builder(
        padding: EdgeInsets.only(top: 24.h, bottom: 40.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 17.w,
          mainAxisSpacing: 24.h,
          childAspectRatio: 155 / 80,
        ),
        itemCount: genres.length,
        itemBuilder: (context, index) {
          final genre = genres[index];
          final imageUrl = imagesMap[genre.id];

          return CategoryCard(
            genre: genre,
            imageUrl: imageUrl,
          );
        },
      ),
    );
  }
}
