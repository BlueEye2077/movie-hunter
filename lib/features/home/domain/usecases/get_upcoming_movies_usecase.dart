import '../../../../core/domain/models/paginated_list.dart';
import '../../../../core/networking/api_result.dart';
import '../entities/movie_entity.dart';
import '../repos/home_repository.dart';

class GetUpcomingMoviesUseCase {
  final HomeRepository _homeRepository;

  const GetUpcomingMoviesUseCase({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  Future<ApiResult<PaginatedList<MovieEntity>>> call({int page = 1}) {
    return _homeRepository.getUpcomingMovies(page: page);
  }
}

