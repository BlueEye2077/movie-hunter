import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/rating_badge.dart';
import '../../../../core/constants/hero_tags.dart';
import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../widgets/cast_and_crew_section.dart';
import '../widgets/favorite_toggle_action_button.dart';
import '../widgets/movie_action_buttons.dart';
import '../widgets/movie_details_action_button.dart';
import '../widgets/movie_info_section.dart';
import '../widgets/movie_poster_header.dart';
import '../widgets/movie_story_line.dart';
import '../widgets/similar_movies_section.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieEntity movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final movieId = movie.id ?? 0;
    final title = movie.title ?? movie.originalTitle ?? AppStrings.unknown;

    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(
            context,
            movieId,
            title,
            movie.posterPath,
            movie.horizontalPoster,
          ),
          _buildSliverToBoxAdapter(movie),
        ],
      ),
    );
  }
}

SliverAppBar _buildSliverAppBar(
  BuildContext context,
  int movieId,
  String title,
  String? posterPath,
  String? backdropPath,
) {
  return SliverAppBar(
    pinned: true,
    stretch: true,
    expandedHeight: 450.h,
    backgroundColor: AppColors.primaryDark,
    surfaceTintColor: Colors.transparent,
    leading: MovieDetailsActionButton(
      icon: Icons.arrow_back_ios_new,
      onPressed: () => Navigator.pop(context),
    ),
    centerTitle: true,
    title: Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyles.font16SemiBold.copyWith(color: AppColors.textWhite),
    ),
    actions: [
      if (movieId > 0)
        Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: FavoriteToggleActionButton(movieId: movieId),
        ),
    ],
    flexibleSpace: FlexibleSpaceBar(
      background: MoviePosterHeader(
        posterPath: posterPath,
        backdropPath: backdropPath,
        heroTag: HeroTags.moviePoster(movieId),
      ),
    ),
  );
}

SliverToBoxAdapter _buildSliverToBoxAdapter(MovieEntity movie) {
  return SliverToBoxAdapter(
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieInfoSection(movie: movie),
          SizedBox(height: 24.h),
          Center(child: RatingBadge(rating: movie.tmdbRating ?? 0.0)),
          SizedBox(height: 24.h),
          if (movie.id != null && movie.id! > 0)
            MovieActionButtons(
              movieId: movie.id!,
              movieTitle:
                  movie.title ?? movie.originalTitle ?? AppStrings.unknown,
            ),
          SizedBox(height: 24.h),
          MovieStoryLine(overview: movie.overview ?? ''),
          SizedBox(height: 24.h),
          if (movie.id != null && movie.id! > 0) ...[
            CastAndCrewSection(movieId: movie.id!),
            SizedBox(height: 32.h),
            SimilarMoviesSection(movieId: movie.id!),
            SizedBox(height: 32.h),
          ],
        ],
      ),
    ),
  );
}
