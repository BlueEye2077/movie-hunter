import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/movies_browser_scaffold.dart';
import '../../../../core/common/movies_list_view.dart';
import '../../../../core/common/movies_section.dart';
import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class PersonKnownForSection extends StatelessWidget {
  final List<MovieEntity> knownFor;
  final List<MovieEntity> allMovies;

  const PersonKnownForSection({
    super.key,
    required this.knownFor,
    required this.allMovies,
  });

  @override
  Widget build(BuildContext context) {
    return MoviesSection(
      title: AppStrings.knownFor,
      onSeeAllTap: allMovies.isEmpty
          ? null
          : () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MoviesBrowserScaffold(
                  title: AppStrings.knownFor,
                  movies: allMovies,
                  isLoading: false,
                  isLoadingPagination: false,
                ),
              ),
            ),
      child: knownFor.isEmpty
          ? SizedBox(
              height: 120.h,
              child: Center(
                child: Text(
                  AppStrings.noKnownMovies,
                  style: TextStyles.font14Regular.copyWith(
                    color: AppColors.textDarkGrey,
                  ),
                ),
              ),
            )
          : MoviesListView.showMovies(movies: knownFor),
    );
  }
}

