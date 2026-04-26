import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/common/animated_slider_dots.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../../data/models/movie.dart';
import 'upcoming_movie_item.dart';

class UpcomingMoviesCarousel extends StatefulWidget {
  final List<Movie> upComingMovies;

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
  List<Movie> get _movies => widget.upComingMovies;

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
            // TODO: manage the set state here
            ? (index, _) => setState(() => _currentIndex = index)
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSlider(
          itemCount: _movies.length,
          autoPlay: true,
          itemBuilder: (context, index, realIndex) {
            final movie = _movies[index];
            return UpcomingMovieItem(
              posterUrl:
                  '${ApiConstants.imagesUrl}${movie.horizontalPoster ?? movie.posterPath ?? ''}',
              title: movie.title ?? 'No title',
              releaseDate: movie.releaseDate ?? '',
            );
          },
        ),
        const SizedBox(height: 11),
        AnimatedSliderDots(
          currentIndex: _currentIndex,
          totalDots: _movies.length > 5 ? 5 : _movies.length,
        ),
      ],
    );
  }
}
