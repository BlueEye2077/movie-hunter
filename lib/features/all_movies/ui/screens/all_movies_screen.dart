import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/features/all_movies/logic/cubit/all_movies_cubit.dart';
import 'package:movie_hunter/features/home/data/models/movie.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../home/data/models/genre.dart';
import '../../../home/logic/cubit/genres_cubit.dart';
import '../../../home/logic/cubit/requests_state.dart';
import '../../data/models/all_movies_args.dart';
import '../widgets/all_movies_grid_view.dart';
import '../widgets/all_movies_list_view.dart';

class AllMoviesScreen extends StatefulWidget {
  final AllMoviesArgs args;

  const AllMoviesScreen({super.key, required this.args});

  @override
  State<AllMoviesScreen> createState() => _AllMoviesScreenState();
}

class _AllMoviesScreenState extends State<AllMoviesScreen> {
  bool _isGridView = false;
  String get title => widget.args.title;
  // List<Movie> get movies => widget.args.movies;
  bool _isLoadingPagination = false;

  List<Movie> _movies = [];

  @override
  void initState() {
    super.initState();
    _movies = widget.args.movies;
  }

  @override
  Widget build(BuildContext context) {
    final genresState = context.watch<GenresCubit>().state;
    final List<Genre> genres = genresState.when(
      idle: () => [],
      loading: () => [],
      success: (g) => g,
      error: (_) => [],
    );

    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textWhite,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          title,
          style: TextStyles.font16SemiBold.copyWith(color: AppColors.textWhite),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.view_list_rounded,
              color: _isGridView
                  ? AppColors.textDarkGrey
                  : AppColors.primaryBlueAccent,
            ),
            onPressed: () => setState(() => _isGridView = false),
          ),
          IconButton(
            icon: Icon(
              Icons.grid_view_rounded,
              color: _isGridView
                  ? AppColors.primaryBlueAccent
                  : AppColors.textDarkGrey,
            ),
            onPressed: () => setState(() => _isGridView = true),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: BlocBuilder<AllMoviesCubit, AllMoviesState>(
        builder: (context, state) {
          state.maybeWhen(
            successPaginationAllMovies: (data) => _movies = data,
            orElse: () => _movies,
          );
          state is LoadingPaginationAllMovies
              ? _isLoadingPagination = true
              : _isLoadingPagination = false;
          return NotificationListener(
            onNotification: (ScrollNotification notification) {
              if (notification is ScrollEndNotification) {
                final double pixels = notification.metrics.pixels;
                final double max = notification.metrics.maxScrollExtent;
                final int trigger = 200;

                if (pixels >= max - trigger) {
                  context.read<AllMoviesCubit>().fetchNextPage();
                }
              }
              return false;
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: _isGridView
                  ? AllMoviesGridView(
                      key: const ValueKey('grid'),
                      movies: _movies,
                      genres: genres,
                      isLoadingmore: _isLoadingPagination,
                    )
                  : AllMoviesListView(
                      key: const ValueKey('list'),
                      movies: _movies,
                      genres: genres,
                      isLoadingmore: _isLoadingPagination,
                    ),
            ),
          );
        },
      ),
    );
  }
}
