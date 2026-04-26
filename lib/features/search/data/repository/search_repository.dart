import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/networking/api_response.dart';
import '../../../home/data/models/actor.dart';
import '../../../home/data/models/movie.dart';
import '../web_services/search_api_service.dart';

class SearchRepository {
  final SearchApiService searchApiService;

  SearchRepository({required this.searchApiService});

  final token = ApiConstants.apiKey;

  List<dynamic> _mapSearchResults(List<dynamic> response) {
    return response.map((e) {
      switch (e['media_type']) {
        case 'movie':
          return Movie.fromJson(e);
        case 'person':
          return Actor.fromJson(e);
        default:
          return null;
      }
    }).nonNulls.toList();
  }

  // Search for movies, tv shows, and people
  Future<ApiResult<ApiResponse<dynamic>>> search(String query) async {
    try {
      var response = await searchApiService.search(token, query);

      return ApiResult.success(
        ApiResponse(
          page: response.page,
          totalPages: response.totalPages,
          totalResultsItems: response.totalResultsItems,
          results: (response.results ?? []).isNotEmpty
              ? _mapSearchResults(response.results!)
              : [],
        ),
      );
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
