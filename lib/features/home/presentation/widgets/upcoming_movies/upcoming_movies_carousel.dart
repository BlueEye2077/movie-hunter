import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/animated_slider_dots.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/domain/entities/movie_entity.dart';
import 'upcoming_movie_item.dart';

class UpcomingMoviesCarousel extends StatefulWidget {
  final List<MovieEntity> upComingMovies;

  // Constructor for showing the carousel
  const UpcomingMoviesCarousel.showCarousel({
    super.key,
    required this.upComingMovies,
  });

  @override
  State<UpcomingMoviesCarousel> createState() => _UpcomingMoviesCarouselState();
}

class _UpcomingMoviesCarouselState extends State<UpcomingMoviesCarousel> {
  int _currentIndex = 0;
  // Used the get instead of late to make sure the data is updated if the a refresh feature is added in the future.
  List<MovieEntity> get _movies => widget.upComingMovies.take(5).toList();

  // Shared carousel slider — single source of truth for layout.
  Widget _buildSlider({
    required int itemCount,
    required Widget Function(BuildContext, int, int) itemBuilder,
    bool autoPlay = false,
  }) {
    return CarouselSlider.builder(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      options: CarouselOptions(
        height: 154.h,
        viewportFraction: 0.7.r,
        enlargeCenterPage: true,
        autoPlay: autoPlay,
        onPageChanged: autoPlay
            ? (index, _) => setState(() => _currentIndex = index)
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // To avoid calling the getter everytime
    final movies = _movies;
    if (movies.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        _buildSlider(
          itemCount: movies.length,
          autoPlay: true,
          itemBuilder: (context, index, realIndex) {
            final movie = movies[index];
            return GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                Routes.movieDetails,
                arguments: movie,
              ),
              child: UpcomingMovieItem(
                posterUrl:
                    '${ApiConstants.imagesUrl}${movie.horizontalPoster ?? movie.posterPath ?? ''}',
                title: movie.title ?? 'No title',
                releaseDate: movie.releaseDate ?? '',
              ),
            );
          },
        ),
        SizedBox(height: 11.h),
        AnimatedSliderDots(
          currentIndex: _currentIndex,
          totalDots: movies.length,
        ),
      ],
    );
  }
}
