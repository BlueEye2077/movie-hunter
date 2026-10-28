import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/movie_list_view_item.dart';
import '../../../../core/genres/cubit/genres_cubit.dart';
import '../../../../core/genres/domain/entities/genre_entity.dart';
import '../../../../core/models/movie.dart';
import '../../../../core/theming/app_spacing.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class SearchMovieList extends StatelessWidget {
  final List<Movie> movies;

  const SearchMovieList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox.shrink();

    // Todo: remove GenresCubit from UI after refactoring this feature to enrich MovieEntity in the domain layer
    final List<GenreEntity> genres = context.select<GenresCubit, List<GenreEntity>>(
      (cubit) => cubit.state.whenOrNull(success: (data) => data) ?? const [],
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
              movie: movie.toEntity(),
              genres: genres,
            );
          },
        ),
      ],
    );
  }
}
