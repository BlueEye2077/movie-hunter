import '../../domain/entities/movie_entity.dart';
import '../../domain/models/paginated_list.dart';
import '../domain/entities/genre_entity.dart';

class GenresHelper {
  static List<String> getGenreTitles({
    required List<int>? genreIds,
    required List<GenreEntity> allGenres,
    int limit = 2,
  }) {
    if (genreIds == null || allGenres.isEmpty) return [];
    return genreIds
        .take(limit)
        .map(
          (id) =>
              allGenres
                  .firstWhere(
                    (genre) => genre.id == id,
                    orElse: () => const GenreEntity(id: -1, name: ''),
                  )
                  .name ??
              '',
        )
        .where((name) => name.isNotEmpty)
        .toList();
  }

  static List<MovieEntity> enrichMovies({
    required List<MovieEntity> movies,
    required List<GenreEntity> allGenres,
    int limit = 2,
  }) {
    return movies
        .map(
          (movie) => movie.copyWith(
            genreNames: getGenreTitles(
              genreIds: movie.genreIds,
              allGenres: allGenres,
              limit: limit,
            ),
          ),
        )
        .toList();
  }

  static PaginatedList<MovieEntity> enrichPaginatedMovies({
    required PaginatedList<MovieEntity> paginatedList,
    required List<GenreEntity> allGenres,
    int limit = 2,
  }) {
    return PaginatedList(
      page: paginatedList.page,
      results: enrichMovies(
        movies: paginatedList.results,
        allGenres: allGenres,
        limit: limit,
      ),
      totalPages: paginatedList.totalPages,
      totalResultsItems: paginatedList.totalResultsItems,
    );
  }
}
