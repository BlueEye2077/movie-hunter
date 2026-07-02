import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_strings.dart';

import '../../../home/data/models/actor.dart';
import '../../../home/data/models/movie.dart';
import '../../../../core/networking/requests_state.dart';
import '../../logic/cubit/search_cubit.dart';
import 'empty_search.dart';
import 'search_actor_list.dart';
import 'search_loading_shimmer.dart';
import 'search_movie_list.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, RequestsState>(
      builder: (context, state) {
        return state.when(
          idle: () => const Center(
            child: Text(
              AppStrings.typeToSearch,
              style: TextStyle(color: Colors.white54),
            ),
          ),
          loading: () => const SearchLoadingShimmer(),
          success: (response) {
            final List<dynamic> results = response.results ?? [];
            if (results.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: EmptySearch(
                    svgPath: 'assets/svgs/no_results_large.svg',
                    title: AppStrings.searchErrorTitle,
                    subtitle: AppStrings.searchErrorSubtitle,
                  ),
                ),
              );
            }

            final List<Actor> actors = results.whereType<Actor>().toList();
            final List<Movie> movies = results.whereType<Movie>().toList();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (actors.isNotEmpty) SearchActorList(actors: actors),
                  SizedBox(height: 24.h),
                  if (movies.isNotEmpty) SearchMovieList(movies: movies),
                ],
              ),
            );
          },
          error: (error) => const Center(
            child: Text(
              AppStrings.anErrorOccurred,
              style: TextStyle(color: Colors.red),
            ),
          ),
        );
      },
    );
  }
}
