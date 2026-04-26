import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_response.dart';
import 'search_api_constants.dart';

part 'search_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SearchApiService {
  factory SearchApiService(Dio dio, {String? baseUrl}) = _SearchApiService;

  // Search for movies, tv shows, and people [multi search]
  @GET(SearchApiConstants.search)
  Future<ApiResponse<dynamic>> search(
    @Header("Authorization") String token,
    @Query("query") String query,
  );
}
