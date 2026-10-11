import '../../../../core/domain/models/paginated_list.dart';
import '../../../../core/networking/api_result.dart';
import '../entities/movie_entity.dart';
import '../repos/home_repository.dart';

class GetTopRatedMoviesUseCase {
  final HomeRepository _homeRepository;

  const GetTopRatedMoviesUseCase({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  Future<ApiResult<PaginatedList<MovieEntity>>> call({int page = 1}) {
    return _homeRepository.getTopRatedMovies(page: page);
  }
}

