import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/movies_browser_scaffold.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/theming/colors.dart';
import '../../domain/entities/account_movie_list_type.dart';
import '../cubit/account_movies_cubit.dart';
import '../models/account_movie_list_type_ui.dart';

class AccountMoviesScreen<C extends AccountMoviesCubit>
    extends StatelessWidget {
  final AccountMovieListType listType;

  const AccountMoviesScreen({super.key, required this.listType});

  @override
  Widget build(BuildContext context) {
    final title = listType.title;

    return BlocConsumer<C, AccountMoviesState>(
      listenWhen: (previous, current) {
        final prevError = previous.whenOrNull(
          success: (_, _, _, paginationError) => paginationError,
        );
        final currError = current.whenOrNull(
          success: (_, _, _, paginationError) => paginationError,
        );
        return currError != null && currError != prevError;
      },
      listener: (context, state) {
        final paginationError = state.whenOrNull(
          success: (_, _, _, error) => error,
        );
        if (paginationError != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                backgroundColor: AppColors.secondaryRed,
                content: Text(
                  NetworkExceptions.getErrorMessage(paginationError),
                ),
              ),
            );
        }
      },
      builder: (context, state) {
        return state.when(
          idle: () => MoviesBrowserScaffold(
            title: title,
            movies: const [],
            isLoading: true,
            isLoadingPagination: false,
          ),
          loading: () => MoviesBrowserScaffold(
            title: title,
            movies: const [],
            isLoading: true,
            isLoadingPagination: false,
          ),
          success: (movies, _, isLoadingPagination, _) {
            return MoviesBrowserScaffold(
              title: title,
              movies: movies,
              isLoading: false,
             isLoadingPagination: isLoadingPagination,
              emptyMessage: listType.emptyTitle,
              onFetchNextPage: () => context.read<C>().fetchNextPage(),
            );
          },
          error: (error) => MoviesBrowserScaffold(
            title: title,
            movies: const [],
            isLoading: false,
            isLoadingPagination: false,
            errorMessage: NetworkExceptions.getErrorMessage(error),
            onRetry: () =>
                context.read<C>().fetchInitialMovies(forceReload: true),
          ),
        );
      },
    );
  }
}
