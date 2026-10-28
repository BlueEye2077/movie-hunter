import '../../../../core/domain/entities/movie_entity.dart';
import '../../domain/entities/all_movies_source.dart';

/// Type-safe navigation arguments for the All Movies screen.
class AllMoviesArgs {
  final String title;
  final List<MovieEntity> movies;
  final AllMoviesSource allMoviesSource;

  const AllMoviesArgs({
    required this.title,
    required this.movies,
    required this.allMoviesSource,
  });
}

