import '../../../home/data/models/movie.dart';

enum MovieCategory {
  nowPlayingMovies,
  popularMovies,
  topRatedMovies,
  upcomingMovies,
  favoriteMovies,
  watchlistMovies,
  staticList,
}

/// Type-safe navigation arguments for the All Movies screen.
class AllMoviesArgs {
  final String title;
  final List<Movie> movies;
  final MovieCategory category;

  const AllMoviesArgs({
    required this.title,
    required this.movies,
    required this.category,
  });
}
