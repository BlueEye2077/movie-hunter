import '../../../../core/domain/models/paginated_list.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../home/data/mappers/movie_mapper.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../../domain/repos/categories_repository.dart';
import '../web_services/categories_api_service.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesApiService _categoriesApiService;
  final Map<int, PaginatedList<MovieEntity>> _firstPageCache = {};

  CategoriesRepositoryImpl({
    required CategoriesApiService categoriesApiService,
  }) : _categoriesApiService = categoriesApiService;

  @override
  Future<ApiResult<PaginatedList<MovieEntity>>> getMoviesByGenre({
    required int genreId,
    int page = 1,
  }) async {
    if (page == 1 && _firstPageCache.containsKey(genreId)) {
      return ApiResult.success(_firstPageCache[genreId]!);
    }

    try {
      final response = await _categoriesApiService.getMoviesByGenre(
        genreId,
        page,
      );
      final paginatedList = response.toPaginatedList((item) => item.toEntity());
      if (page == 1) {
        _firstPageCache[genreId] = paginatedList;
      }
      return ApiResult.success(paginatedList);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}

