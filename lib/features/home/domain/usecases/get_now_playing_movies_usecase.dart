import 'package:movie_hunter/core/domain/models/paginated_list.dart';
import 'package:movie_hunter/core/networking/api_result.dart';
import 'package:movie_hunter/features/home/domain/entities/movie_entity.dart';

import '../repos/home_repository.dart';

class GetNowPlayingMoviesUseCase {
  final HomeRepository _homeRepository;
  const GetNowPlayingMoviesUseCase({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  Future<ApiResult<PaginatedList<MovieEntity>>> call({int page = 1}) {
    return _homeRepository.getNowPlayingMovies(page: page);
  }
}
