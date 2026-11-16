import '../../../../core/networking/api_result.dart';
import '../entities/search_results_entity.dart';

abstract class SearchRepository {
  Future<ApiResult<SearchResultsEntity>> search(String query);
}

