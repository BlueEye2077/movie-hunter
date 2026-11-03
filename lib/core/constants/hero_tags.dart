abstract final class HeroTags {
  static const String searchBar = 'search_bar';

  static String moviePoster(int? movieId) => 'movie_poster_${movieId ?? 0}';
}
