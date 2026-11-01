import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/empty_state_view.dart';
import '../../../../core/common/error_retry_view.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/theming/app_spacing.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../cubit/search_cubit.dart';
import 'search_actor_list.dart';
import 'search_loading_shimmer.dart';
import 'search_movie_list.dart';
import 'search_section_header.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return state.when(
          idle: () => Center(
            child: Text(
              AppStrings.typeToSearch,
              style: TextStyles.font14Medium.copyWith(
                color: AppColors.textGrey,
              ),
            ),
          ),
          loading: () => const SearchLoadingShimmer(),
          empty: () => Center(
            child: Padding(
              padding: AppSpacing.screenPadding,
              child: const EmptyStateView(
                svgPath: 'assets/svgs/no_results_large.svg',
                title: AppStrings.searchErrorTitle,
                subtitle: AppStrings.searchErrorSubtitle,
              ),
            ),
          ),
          success: (results) => CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              if (results.people.isNotEmpty)
                SliverToBoxAdapter(
                  child: SearchActorList(actors: results.people),
                ),
              if (results.people.isNotEmpty && results.movies.isNotEmpty)
                SliverToBoxAdapter(child: SizedBox(height: 24.h)),
              if (results.movies.isNotEmpty) ...[
                const SliverToBoxAdapter(
                  child: SearchSectionHeader(title: AppStrings.movieRelated),
                ),
                SearchMovieList(movies: results.movies),
              ],
            ],
          ),
          error: (error) => ErrorRetryView(
            message: NetworkExceptions.getErrorMessage(error),
            onRetry: () => context.read<SearchCubit>().retry(),
          ),
        );
      },
    );
  }
}
