import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/movies_browser_scaffold.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../cubit/all_movies_cubit.dart';
import '../models/all_movies_args.dart';

class AllMoviesScreen extends StatelessWidget {
  final AllMoviesArgs args;

  const AllMoviesScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllMoviesCubit, AllMoviesState>(
      listenWhen: (previous, current) {
        final prevError = previous is SuccessAllMovies
            ? previous.paginationError
            : null;
        final currError = current is SuccessAllMovies
            ? current.paginationError
            : null;
        return currError != null && currError != prevError;
      },
      listener: (context, state) {
        if (state is SuccessAllMovies && state.paginationError != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  NetworkExceptions.getErrorMessage(state.paginationError!),
                ),
              ),
            );
        }
      },
      builder: (context, state) {
        return state.when(
          idle: () => MoviesBrowserScaffold(
            title: args.title,
            movies: const [],
            isLoading: true,
            isLoadingPagination: false,
          ),
          loadingAllMovies: () => MoviesBrowserScaffold(
            title: args.title,
            movies: const [],
            isLoading: true,
            isLoadingPagination: false,
          ),
          successAllMovies: (movies, paginationError, isLoadingPagination) =>
              MoviesBrowserScaffold(
                title: args.title,
                movies: movies,
                isLoading: false,
                isLoadingPagination: isLoadingPagination,
                onFetchNextPage: () =>
                    context.read<AllMoviesCubit>().fetchNextPage(),
              ),
          errorAllMovies: (networkExceptions) => MoviesBrowserScaffold(
            title: args.title,
            movies: const [],
            isLoading: false,
            isLoadingPagination: false,
            emptyMessage: NetworkExceptions.getErrorMessage(networkExceptions),
          ),
        );
      },
    );
  }
}
