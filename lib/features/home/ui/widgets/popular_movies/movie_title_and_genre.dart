import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/core/theming/styles.dart';

class MovieTitleAndGenre extends StatelessWidget {
  final String title;
  final List<String> genres;
  final int maxGenres;
  const MovieTitleAndGenre({
    super.key,
    required this.title,
    required this.genres,
    this.maxGenres = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.font14SemiBold.copyWith(color: AppColors.textWhite),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 4.h),
        Text(
          genres.take(maxGenres).join(', '),
          style: TextStyles.font10Medium.copyWith(color: AppColors.textGrey),
        ),
      ],
    );
  }
}
