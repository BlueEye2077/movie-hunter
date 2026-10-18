import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/networking/network_exceptions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../../../all_movies/data/models/all_movies_args.dart';
import '../../../data/mappers/movie_mapper.dart';
import '../../../domain/entities/movie_entity.dart';
import 'movies_list_view.dart';
import 'movies_section.dart';

class HomeMovieSectionContent extends StatelessWidget {
  final String title;
  final MovieCategory category;
  final bool isLoading;
  final List<MovieEntity>? movies;
  final NetworkExceptions? error;

  const HomeMovieSectionContent({
    super.key,
    required this.title,
    required this.category,
    this.isLoading = false,
    this.movies,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return MoviesSection(title: title, child: const MoviesListView.shimmer());
    }

    if (error != null) {
      return MoviesSection(
        title: title,
        child: SizedBox(
          height: 245.h,
          child: Center(
            child: Text(
              NetworkExceptions.getErrorMessage(error!),
              style: TextStyles.font14Regular.copyWith(
                color: AppColors.textWhite,
              ),
            ),
          ),
        ),
      );
    }

    final list = movies ?? [];
    if (list.isEmpty) return const SizedBox.shrink();

    return MoviesSection(
      title: title,
      onSeeAllTap: () => Navigator.pushNamed(
        context,
        Routes.allMovies,
        arguments: AllMoviesArgs(
          title: title,
          movies: list.map((e) => e.toMovie()).toList(),
          category: category,
        ),
      ),
      child: MoviesListView.showMovies(movies: list),
    );
  }
}
