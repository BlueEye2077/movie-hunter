import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/movie_list_view_item.dart';
import '../../../../core/models/genre.dart';
import '../../../../core/models/movie.dart';
import '../../../../core/networking/requests_state.dart';
import '../../../../core/theming/app_spacing.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../home/presentation/cubit/genres_cubit.dart';

class SearchMovieList extends StatelessWidget {
  final List<Movie> movies;

  const SearchMovieList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox.shrink();

    final genresState = context.watch<GenresCubit>().state;
    final List<Genre> genres = genresState.when(
      idle: () => [],
      loading: () => [],
      success: (data) => data,
      error: (_) => [],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: AppSpacing.horizontalPadding,
            right: AppSpacing.horizontalPadding,
            bottom: 16.h,
          ),
          child: Text(
            AppStrings.movieRelated,
            style: TextStyles.font16SemiBold.copyWith(
              color: AppColors.textWhite,
            ),
          ),
        ),
        ListView.separated(
          padding: AppSpacing.screenPadding,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: movies.length,
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemBuilder: (context, index) {
            final movie = movies[index];
            return MovieListViewItem(
              movie: movie,
              genres: genres,
            );
          },
        ),
      ],
    );
  }
}