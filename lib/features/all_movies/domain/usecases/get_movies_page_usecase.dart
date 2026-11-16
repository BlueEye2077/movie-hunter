import '../../../../core/domain/entities/movie_entity.dart';
import '../../../../core/domain/models/paginated_list.dart';
import '../../../../core/networking/api_result.dart';
import '../../../home/domain/usecases/get_now_playing_movies_usecase.dart';
import '../../../home/domain/usecases/get_popular_movies_usecase.dart';
import '../../../home/domain/usecases/get_top_rated_movies_usecase.dart';
import '../../../home/domain/usecases/get_upcoming_movies_usecase.dart';
import '../entities/all_movies_source.dart';
import 'get_movies_by_genre_usecase.dart';

class GetMoviesPageUseCase {
  final GetUpcomingMoviesUseCase getUpcomingMoviesUseCase;
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  final GetMoviesByGenreUseCase getMoviesByGenreUseCase;

  const GetMoviesPageUseCase({
    required this.getUpcomingMoviesUseCase,
    required this.getNowPlayingMoviesUseCase,
    required this.getPopularMoviesUseCase,
    required this.getTopRatedMoviesUseCase,
    required this.getMoviesByGenreUseCase,
  });

  Future<ApiResult<PaginatedList<MovieEntity>>> call({
    required AllMoviesSource allMoviesSource,
    int page = 1,
  }) {
    switch (allMoviesSource) {
      case UpcomingMoviesSource():
        return getUpcomingMoviesUseCase(page: page);
      case NowPlayingMoviesSource():
        return getNowPlayingMoviesUseCase(page: page);
      case PopularMoviesSource():
        return getPopularMoviesUseCase(page: page);
      case TopRatedMoviesSource():
        return getTopRatedMoviesUseCase(page: page);
      case final MovieCategorySource source:
        return getMoviesByGenreUseCase(page: page, genreId: source.genreId);
    }
  }
}
