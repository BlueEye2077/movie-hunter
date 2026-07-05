import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/networking/requests_state.dart';
import '../../../home/data/models/genre.dart';

import '../../../all_movies/data/models/all_movies_args.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../home/data/models/movie.dart';
import '../../../home/logic/cubit/genres_cubit.dart';
import '../../../home/ui/widgets/movie_section/movies_list_view.dart';
import '../../../home/ui/widgets/movie_section/movies_section.dart';

class PersonKnownForSection extends StatelessWidget {
  final List<Movie> movies;

  const PersonKnownForSection({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    // Sort by vote average descending and take the top 20
    final sorted = [...movies]
      ..sort((a, b) => (b.tmdbRating ?? 0).compareTo(a.tmdbRating ?? 0));
    final topMovies = sorted.take(20).toList();

    final genresState = context.read<GenresCubit>().state;
    final List<Genre> genres = genresState.maybeWhen(
      success: (g) => g,
      orElse: () => [],
    );

    return MoviesSection(
      title: 'Known For',
      onSeeAllTap: topMovies.isEmpty
          ? null
          : () {
              Navigator.pushNamed(
                context,
                Routes.allMovies,
                arguments: AllMoviesArgs(
                  title: 'Known For',
                  movies: movies, // Pass all movies, not just top 20
                  category: MovieCategory.staticList,
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
