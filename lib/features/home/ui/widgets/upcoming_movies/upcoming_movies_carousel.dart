import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/core/common/animated_slider_dots.dart';
import 'package:movie_hunter/core/networking/api_constants.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/features/home/data/models/movie.dart';
import 'package:movie_hunter/features/home/ui/widgets/upcoming_movies/upcoming_movie_item.dart';
import 'package:shimmer/shimmer.dart';

class UpcomingMoviesCarousel extends StatefulWidget {
  final List<Movie> upComingMovies;

  // Constructor for showing the carousel
  const UpcomingMoviesCarousel.showCarousel({
    super.key,
    required this.upComingMovies,
  });

  // Constructor for showing the shimmer
  const UpcomingMoviesCarousel.showShimmer({super.key})
    : upComingMovies = const [];

  @override
  State<UpcomingMoviesCarousel> createState() => _UpcomingMoviesCarouselState();
}

class _UpcomingMoviesCarouselState extends State<UpcomingMoviesCarousel> {
  int _currentIndex = 0;

  bool get _isShimmer => widget.upComingMovies.isEmpty;
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
        viewportFraction: 0.8.r,
        enlargeCenterPage: true,
        autoPlay: autoPlay,
        onPageChanged: autoPlay
            // todo: manage the set state here
            ? (index, _) => setState(() => _currentIndex = index)
            : null,
      ),
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColors.primarySoft,
      highlightColor: AppColors.primarySoft.withValues(alpha: 0.5),
      child: Column(
        children: [
          _buildSlider(
            itemCount: 5,
            itemBuilder: (context, index, realIndex) => Container(
              height: 154.h,
              decoration: BoxDecoration(
                color: AppColors.primarySoft,
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
          ),
          const SizedBox(height: 11),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Container(
                margin: EdgeInsets.only(right: index == 4 ? 0 : 8.w),
                height: 10.h,
                width: index == 0 ? 32.w : 10.w,
                decoration: BoxDecoration(
                  color: AppColors.primarySoft,
                  borderRadius: BorderRadius.circular(100.r),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildCarousel() {
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

  @override
  Widget build(BuildContext context) {
    return _isShimmer ? _buildShimmer() : _buildCarousel();
  }
}
