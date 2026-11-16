import '../../../../core/domain/models/paginated_list.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/domain/entities/movie_entity.dart';

abstract class CategoriesRepository {
  Future<ApiResult<PaginatedList<MovieEntity>>> getMoviesByGenre({
    required int genreId,
    int page = 1,
  });
}

