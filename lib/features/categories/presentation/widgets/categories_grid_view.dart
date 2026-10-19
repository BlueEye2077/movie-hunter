import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_spacing.dart';
import '../../domain/entities/category_entity.dart';
import 'category_card.dart';

class CategoriesGridView extends StatelessWidget {
  final List<CategoryEntity> categories;

  const CategoriesGridView({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: GridView.builder(
        padding: EdgeInsets.only(top: 24.h, bottom: 40.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 17.w,
          mainAxisSpacing: 24.h,
          childAspectRatio: 155 / 80,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}

