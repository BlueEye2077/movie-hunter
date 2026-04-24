import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/core/theming/styles.dart';
import 'package:movie_hunter/features/home/data/models/genre.dart';
import 'package:movie_hunter/features/home/data/models/movie.dart';
import 'package:movie_hunter/features/home/logic/cubit/genres_cubit.dart';
import 'package:movie_hunter/features/home/logic/cubit/requests_state.dart';
import 'package:movie_hunter/features/search/ui/widgets/search_movie_info_row.dart';

class SearchMovieDetails extends StatelessWidget {
  final Movie movie;
  final String year;
  final String language;
  final bool isAdult;

  const SearchMovieDetails({
    super.key,
    required this.movie,
    required this.year,
    required this.language,
    required this.isAdult,
  });

  @override
  Widget build(BuildContext context) {
    final genresState = context.watch<GenresCubit>().state;
    final List<Genre> allGenres = genresState.when(
      idle: () => [],
      loading: () => [],
      success: (g) => g,
      error: (_) => [],
    );

    final genreNames = movie.genreIds?.map((id) {
          return allGenres.firstWhere(
            (g) => g.id == id,
            orElse: () => Genre(id: -1, name: 'Unknown'),
          ).name;
        }).where((name) => name != 'Unknown').toList() ??
        [];

    final genresString = genreNames.isNotEmpty
        ? genreNames.take(2).join(', ')
        : 'Unknown Genre';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          movie.title ?? movie.originalTitle ?? 'Unknown',
          style: TextStyles.font16SemiBold.copyWith(
            color: AppColors.textWhite,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 12.h),
        SearchMovieInfoRow(
          svgIcon: 'assets/svgs/calendar.svg',
          text: year,
        ),
        SizedBox(height: 8.h),
        SearchMovieInfoRow(
          iconData: Icons.language,
          text: 'Language: $language',
        ),
        SizedBox(height: 8.h),
        SearchMovieInfoRow(
          iconData: isAdult ? Icons.explicit : Icons.family_restroom,
          text: isAdult ? 'Adult 18+' : 'Family Friendly',
        ),
        SizedBox(height: 8.h),
        SearchMovieInfoRow(
          iconData: Icons.movie_creation_outlined,
          text: genresString,
        ),
      ],
    );
  }
}
