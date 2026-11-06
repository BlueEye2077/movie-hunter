import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/common/app_network_image.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../all_movies/domain/entities/all_movies_source.dart';
import '../../../all_movies/presentation/models/all_movies_args.dart';
import '../../domain/entities/category_entity.dart';

class CategoryCard extends StatelessWidget {
  final CategoryEntity category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.allMovies,
          arguments: AllMoviesArgs(
            title: category.name,
            movies: category.initialMovies,
            allMoviesSource: AllMoviesSource.category(genreId: category.id),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (category.imageUrl.isNotEmpty)
              AppNetworkImage(
                imageUrl: '${ApiConstants.imagesUrl}${category.imageUrl}',
                fit: BoxFit.cover,
                placeholder: (context) => Shimmer.fromColors(
                  baseColor: AppColors.primarySoft,
                  highlightColor: AppColors.textDarkGrey,
                  child: Container(color: AppColors.primarySoft),
                ),
                errorWidget: (context, error) =>
                    Container(color: AppColors.primarySoft),
              )
            else
              Container(color: AppColors.primarySoft),

            // Dark overlay matching the Figma design
            Container(
              color: AppColors.primaryDark.withValues(alpha: 0.4),
            ),

            // Category Name
            Center(
              child: Text(
                category.name,
                textAlign: TextAlign.center,
                style: TextStyles.font12Medium.copyWith(
                  color: AppColors.textWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
