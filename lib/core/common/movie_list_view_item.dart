import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helpers/genres_helper.dart';
import '../models/genre.dart';
import '../models/movie.dart';
import '../routing/routes.dart';
import '../theming/app_strings.dart';
import '../theming/colors.dart';
import '../theming/text_styles.dart';
import 'poster_image.dart';
import 'rating_badge.dart';

class MovieListViewItem extends StatelessWidget {
  final Movie movie;
  final List<Genre> genres;
  final VoidCallback? onTap;

  const MovieListViewItem({
    super.key,
    required this.movie,
    this.genres = const [],
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () => Navigator.pushNamed(
                context,
                Routes.movieDetails,
                arguments: movie,
              ),
      child: SizedBox(
        height: 147.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster & Rating Badge
            SizedBox(
              width: 112.w,
              height: 147.h,
              child: Stack(
                children: [
                  PosterImage(
                    imageUrl: movie.posterPath,
                    height: 147.h,
                    width: 112.w,
                    topRadius: 8.r,
                    bottomRadius: 8.r,
                  ),
                  Positioned(
                    top: 8.h,
                    left: 8.w,
                    child: RatingBadge(rating: movie.tmdbRating ?? 0.0),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            // Movie Details
            Expanded(
              child: _MovieListViewItemDetails(
                movie: movie,
                genres: genres,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MovieListViewItemDetails extends StatelessWidget {
  final Movie movie;
  final List<Genre> genres;

  const _MovieListViewItemDetails({
    required this.movie,
    this.genres = const [],
  });

  @override
  Widget build(BuildContext context) {
    final year = movie.releaseDate != null && movie.releaseDate!.length >= 4
        ? movie.releaseDate!.substring(0, 4)
        : AppStrings.unknown;
    final language = movie.originalLanguage?.toUpperCase() ?? 'EN';
    final isAdult = movie.isAdult ?? false;

    final genreNames = GenresHelper.getGenreTitles(
      genreIds: movie.genreIds,
      allGenres: genres,
      limit: 2,
    );

    final genresString = genreNames.isNotEmpty
        ? genreNames.join(', ')
        : AppStrings.unknownGenre;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.title ?? movie.originalTitle ?? AppStrings.unknown,
          style: TextStyles.font16SemiBold.copyWith(
            color: AppColors.textWhite,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 12.h),
        _MovieInfoRow(
          svgIcon: 'assets/svgs/calendar.svg',
          text: year,
        ),
        SizedBox(height: 8.h),
        _MovieInfoRow(
          iconData: Icons.language,
          text: '${AppStrings.languagePrefix}$language',
        ),
        SizedBox(height: 8.h),
        _MovieInfoRow(
          iconData: isAdult ? Icons.explicit : Icons.family_restroom,
          text: isAdult ? AppStrings.adultLabel : AppStrings.familyFriendly,
        ),
        SizedBox(height: 8.h),
        _MovieInfoRow(
          iconData: Icons.movie_creation_outlined,
          text: genresString,
        ),
      ],
    );
  }
}

class _MovieInfoRow extends StatelessWidget {
  final String? svgIcon;
  final IconData? iconData;
  final String text;

  const _MovieInfoRow({
    this.svgIcon,
    this.iconData,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (svgIcon != null)
          SvgPicture.asset(
            svgIcon!,
            width: 16.w,
            height: 16.h,
            colorFilter: const ColorFilter.mode(
              AppColors.textGrey,
              BlendMode.srcIn,
            ),
          )
        else if (iconData != null)
          Icon(iconData, size: 16.w, color: AppColors.textGrey),
        SizedBox(width: 4.w),
        Expanded(
          child: Text(
            text,
            style: TextStyles.font12Medium.copyWith(color: AppColors.textGrey),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
