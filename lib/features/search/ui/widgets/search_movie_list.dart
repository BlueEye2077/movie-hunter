import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/search_movie_item.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../home/data/models/movie.dart';

class SearchMovieList extends StatelessWidget {
  final List<Movie> movies;

  const SearchMovieList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: TextStyles.horizontalPadding,
            right: TextStyles.horizontalPadding,
            bottom: 16.h,
          ),
          child: Text(
            AppStrings.movieRelated,
            style: TextStyles.font16SemiBold.copyWith(
              color: AppColors.textWhite,
            ),
          ),
        ),
        ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: movies.length,
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemBuilder: (context, index) {
            final movie = movies[index];
            return GeneralMovieItem(movie: movie);
          },
        ),
      ],
    );
  }
}
