import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/movie_list_view_item.dart';
import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/theming/app_spacing.dart';

class SearchMovieList extends StatelessWidget {
  final List<MovieEntity> movies;

  const SearchMovieList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: AppSpacing.screenPadding,
      sliver: SliverList.separated(
        itemCount: movies.length,
        separatorBuilder: (_, _) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          return MovieListViewItem(movie: movies[index]);
        },
      ),
    );
  }
}

