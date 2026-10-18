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
}
