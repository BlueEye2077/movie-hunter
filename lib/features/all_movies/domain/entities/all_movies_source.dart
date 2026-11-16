sealed class AllMoviesSource {
  const AllMoviesSource();

  const factory AllMoviesSource.upcoming() = UpcomingMoviesSource;
  const factory AllMoviesSource.nowPlaying() = NowPlayingMoviesSource;
  const factory AllMoviesSource.popular() = PopularMoviesSource;
  const factory AllMoviesSource.topRated() = TopRatedMoviesSource;
  const factory AllMoviesSource.category({required int genreId}) =
      MovieCategorySource;
}

final class UpcomingMoviesSource extends AllMoviesSource {
  const UpcomingMoviesSource();
}

final class NowPlayingMoviesSource extends AllMoviesSource {
  const NowPlayingMoviesSource();
}

final class PopularMoviesSource extends AllMoviesSource {
  const PopularMoviesSource();
}

final class TopRatedMoviesSource extends AllMoviesSource {
  const TopRatedMoviesSource();
}

final class MovieCategorySource extends AllMoviesSource {
  final int genreId;

  const MovieCategorySource({required this.genreId});
}
