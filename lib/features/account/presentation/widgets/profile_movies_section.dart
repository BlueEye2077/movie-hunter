import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/empty_state_view.dart';
import '../../../../core/common/error_retry_view.dart';
import '../../../../core/common/movies_list_view.dart';
import '../../../../core/common/movies_section.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../domain/entities/account_movie_list_type.dart';
import '../cubit/account_movies_cubit.dart';
import '../models/account_movie_list_type_ui.dart';

class ProfileMoviesSection<C extends AccountMoviesCubit>
    extends StatelessWidget {
  static const double _stateBoxHeight = 200;
  static const double _emptyIconSize = 60;

  final AccountMovieListType listType;

  const ProfileMoviesSection({super.key, required this.listType});

  @override
  Widget build(BuildContext context) {
    final title = listType.title;

    return BlocBuilder<C, AccountMoviesState>(
      builder: (context, state) {
        return state.when(
          idle: () => MoviesSection(
            title: title,
            child: const MoviesListView.shimmer(),
          ),
          loading: () => MoviesSection(
            title: title,
            child: const MoviesListView.shimmer(),
          ),
          success: (movies, _, _, _) {
            if (movies.isEmpty) {
              return MoviesSection(
                title: title,
                child: SizedBox(
                  height: _stateBoxHeight.h,
                  child: Center(
                    child: EmptyStateView(
                      svgPath: listType.emptySvgPath,
                      iconSize: _emptyIconSize,
                      title: listType.emptyTitle,
                      subtitle: listType.emptySubtitle,
                    ),
                  ),
                ),
              );
            }

            return MoviesSection(
              title: title,
              onSeeAllTap: () =>
                  Navigator.pushNamed(context, listType.seeAllRoute),
              child: MoviesListView.showMovies(movies: movies),
            );
          },
          error: (error) => MoviesSection(
            title: title,
            child: SizedBox(
              height: _stateBoxHeight.h,
              child: ErrorRetryView(
                message: NetworkExceptions.getErrorMessage(error),
                onRetry: () =>
                    context.read<C>().fetchInitialMovies(forceReload: true),
              ),
            ),
          ),
        );
      },
    );
  }
}

