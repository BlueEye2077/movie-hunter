import '../../../home/data/models/movie.dart';

/// Type-safe navigation arguments for the All Movies screen.
class AllMoviesArgs {
  final String title;
  final List<Movie> movies;

  const AllMoviesArgs({required this.title, required this.movies});
}
