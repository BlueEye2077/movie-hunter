import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/error_retry_view.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/theming/app_strings.dart';
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
          AppStrings.categories,
          style: TextStyles.font16SemiBold.copyWith(color: AppColors.textWhite),
        ),
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          return state.when(
            idle: () => const CategoriesShimmer(),
            loading: () => const CategoriesShimmer(),
            success: (categories) => categories.isEmpty
                ? Center(
                    child: Text(
                      AppStrings.noCategoriesFound,
                      style: TextStyles.font16SemiBold.copyWith(
                        color: AppColors.textWhiteGrey,
                      ),
                    ),
                  )
                : CategoriesGridView(categories: categories),
            error: (error) => ErrorRetryView(
              message: NetworkExceptions.getErrorMessage(error),
              onRetry: () => context.read<CategoriesCubit>().getCategories(),
            ),
          );
        },
      ),
    );
  }
}
