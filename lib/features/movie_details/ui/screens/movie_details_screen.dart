import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/rating_badge.dart';
import '../../../../core/theming/colors.dart';
import '../../../home/data/models/movie.dart';
import '../../logic/cubit/movie_details_cubit.dart';
import '../widgets/cast_and_crew_section.dart';
import '../widgets/movie_action_buttons.dart';
import '../widgets/movie_details_app_bar.dart';
import '../widgets/movie_info_section.dart';
import '../widgets/movie_poster_header.dart';
import '../widgets/movie_story_line.dart';
import '../widgets/similar_movies_section.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MovieDetailsCubit>().fetchMovieDetails(widget.movie.id!);
  }

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster + App Bar overlay
            Stack(
              children: [
                MoviePosterHeader(
                  posterPath: movie.posterPath,
                  backdropPath: movie.horizontalPoster,
                ),
                SafeArea(
                  child: MovieDetailsAppBar(
                    title: movie.title ?? '',
                    onBackPressed: () => Navigator.pop(context),
                    movieId: movie.id!,
                  ),
                ),
              ],
            ),
            // Info row (year, runtime, genre) — updates when API data arrives
            MovieInfoSection(movie: movie),
            SizedBox(height: 24.h),
            // Rating badge centered
            Center(child: RatingBadge(rating: movie.tmdbRating ?? 0)),
            SizedBox(height: 24.h),
            // Action buttons
            MovieActionButtons(
              movieId: movie.id!,
              movieTitle: movie.title ?? 'this movie',
            ),
            SizedBox(height: 24.h),
            // Story line
            MovieStoryLine(overview: movie.overview ?? ''),
            SizedBox(height: 24.h),
            // Cast and Crew — loaded from API
            const CastAndCrewSection(),
            SizedBox(height: 32.h),
            // Similar Movies
            SimilarMoviesSection(movieId: movie.id!),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
