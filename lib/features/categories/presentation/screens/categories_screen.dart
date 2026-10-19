import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../cubit/categories_cubit.dart';
import '../widgets/categories_grid_view.dart';
import '../widgets/categories_shimmer.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Categories',
          style: TextStyles.font16SemiBold.copyWith(color: AppColors.textWhite),
        ),
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          return state.when(
            idle: () => const CategoriesShimmer(),
            loading: () => const CategoriesShimmer(),
            success: (categories) =>
                CategoriesGridView(categories: categories),
            error: (error) => Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      NetworkExceptions.getErrorMessage(error),
                      textAlign: TextAlign.center,
                      style: TextStyles.font16SemiBold.copyWith(
                        color: AppColors.textWhite,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CategoriesCubit>().getCategories();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlueAccent,
                        foregroundColor: AppColors.textWhite,
                      ),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
