import '../../../networking/api_result.dart';
import '../entities/genre_entity.dart';

abstract class GenresRepository {
  Future<ApiResult<List<GenreEntity>>> getGenres();
}
