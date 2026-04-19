import 'package:movie_hunter/features/home/data/models/genre.dart';

class Helpers {
  static List<String> getGenreTitles({
    required List<int>? genreIds,
    required List<Genre> allGenres,
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
                    orElse: () => Genre(id: -1, name: ''),
                  )
                  .name ??
              '',
        )
        .where((name) => name.isNotEmpty)
        .toList();
  }
}
