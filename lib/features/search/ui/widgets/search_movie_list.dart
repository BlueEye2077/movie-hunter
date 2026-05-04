import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../home/data/models/movie.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

import 'search_movie_item.dart';

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
            'Movie Related',
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
            return SearchMovieItem(movie: movie);
          },
        ),
      ],
    );
  }
}
