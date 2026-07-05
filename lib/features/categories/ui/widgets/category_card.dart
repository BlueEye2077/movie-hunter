import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../all_movies/data/models/all_movies_args.dart';
import '../../../home/data/models/genre.dart';

class CategoryCard extends StatelessWidget {
  final Genre genre;
  final String? imageUrl;

  const CategoryCard({super.key, required this.genre, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.allMovies,
          arguments: AllMoviesArgs(
            title: genre.name ?? 'Unknown',
            movies: [],
            category: MovieCategory.genreMovies,
            entityId: genre.id,
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (imageUrl != null && imageUrl!.isNotEmpty)
              CachedNetworkImage(
                imageUrl: '${ApiConstants.imagesUrl}$imageUrl',
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: AppColors.primarySoft,
                  highlightColor: AppColors.textDarkGrey,
                  child: Container(color: AppColors.primarySoft),
                ),
                errorBuilder: (context, url, error) =>
                    Container(color: AppColors.primarySoft),
              )
            else
              Container(color: AppColors.primarySoft),

            // Dark overlay matching the Figma design
            Container(
              color: AppColors.primaryDark.withValues(alpha: 0.4), // Overlay
            ),

            // Category Name
            Center(
              child: Text(
                genre.name ?? 'Unknown',
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
