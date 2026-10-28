import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/movies_browser_scaffold.dart';
import '../../../../core/genres/cubit/genres_cubit.dart';
import '../../../../core/genres/domain/entities/genre_entity.dart';
import '../../../../core/models/movie.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../home/presentation/widgets/movie_section/movies_list_view.dart';
import '../../../home/presentation/widgets/movie_section/movies_section.dart';

class PersonKnownForSection extends StatelessWidget {
  final List<Movie> movies;

  const PersonKnownForSection({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    // Sort by vote average descending and take the top 20
    final sorted = [...movies]
      ..sort((a, b) => (b.tmdbRating ?? 0).compareTo(a.tmdbRating ?? 0));
    final topMovies = sorted.take(20).toList();

    // Todo: remove GenresCubit from UI after refactoring this feature to enrich MovieEntity in the domain layer
    final List<GenreEntity> genres = context
        .select<GenresCubit, List<GenreEntity>>(
          (cubit) => cubit.state.whenOrNull(success: (g) => g) ?? const [],
        );

    return MoviesSection(
      title: 'Known For',
      onSeeAllTap: topMovies.isEmpty
          ? null
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MoviesBrowserScaffold(
                    title: 'Known For',
                    movies: sorted.map((e) => e.toEntity()).toList(),
                    genres: genres,
                    isLoading: false,
                    isLoadingPagination: false,
                  ),
                ),
              );
            },
      child: topMovies.isEmpty
          ? SizedBox(
              height: 245.h,
              child: Center(
                child: Text(
                  "No known movies found",
                  style: TextStyles.font14Regular.copyWith(
                    color: AppColors.textDarkGrey,
                  ),
                ),
              ),
            )
          : MoviesListView.showMovies(movies: topMovies, genres: genres),
    );
  }
}
