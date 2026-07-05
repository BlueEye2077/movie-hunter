import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/networking/requests_state.dart';
import '../../../home/data/models/genre.dart';
import '../../../home/data/models/movie.dart';
import '../../../home/logic/cubit/genres_cubit.dart';
import '../../../home/ui/widgets/movie_section/movies_list_view.dart';
import '../../../home/ui/widgets/movie_section/movies_section.dart';
import '../../logic/cubit/similar_movies_cubit.dart';

class SimilarMoviesSection extends StatelessWidget {
  final int movieId;

  const SimilarMoviesSection({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<SimilarMoviesCubit>()..getSimilarMovies(movieId),
      child: MoviesSection(
        title: "Similar Movies",
        child: BlocBuilder<SimilarMoviesCubit, RequestsState<List<Movie>>>(
          builder: (context, moviesState) {
            return moviesState.when(
              idle: () => const SizedBox.shrink(),
              loading: () => const MoviesListView.shimmer(),
              success: (movies) {
                if (movies.isEmpty) {
                  return const Center(child: Text("No similar movies"));
                }
                return BlocBuilder<GenresCubit, RequestsState<List<Genre>>>(
                  builder: (context, genresState) {
                    final genres = genresState.maybeWhen(
                      success: (g) => g,
                      orElse: () => <Genre>[],
                    );
                    return MoviesListView.showMovies(
                      movies: movies,
                      genres: genres,
                    );
                  },
                );
              },
              error: (error) {
                return Center(
                  child: Text(NetworkExceptions.getErrorMessage(error)),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
