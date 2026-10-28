import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/movies_browser_scaffold.dart';
import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../cubit/all_movies_cubit.dart';
import '../models/all_movies_args.dart';

class AllMoviesScreen extends StatelessWidget {
  final AllMoviesArgs args;

  const AllMoviesScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllMoviesCubit, AllMoviesState>(
      listener: (context, state) {
        if (state is ErrorPaginationAllMovies) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  NetworkExceptions.getErrorMessage(state.networkExceptions),
                ),
              ),
            );
        }
      },
      builder: (context, state) {
        final List<MovieEntity> currentMovies = state.currentMovies;
        final bool isLoading =
            state is LoadingAllMovies && currentMovies.isEmpty;
        final bool isLoadingPagination =
            state is LoadingPaginationAllMovies && currentMovies.isNotEmpty;
        final String? errorMessage = state is ErrorAllMovies
            ? NetworkExceptions.getErrorMessage(state.networkExceptions)
            : null;

        return MoviesBrowserScaffold(
          title: args.title,
          movies: currentMovies,
          isLoading: isLoading,
          isLoadingPagination: isLoadingPagination,
          emptyMessage: errorMessage,
          onFetchNextPage: () => context.read<AllMoviesCubit>().fetchNextPage(),
        );
      },
    );
  }
}
