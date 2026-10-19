import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/models/movie.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_response.dart';
import 'categories_api_constants.dart';

part 'categories_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CategoriesApiService {
  factory CategoriesApiService(Dio dio, {String? baseUrl}) =
      _CategoriesApiService;

  @GET(CategoriesApiConstants.discoverMovie)
  Future<ApiResponse<Movie>> getMoviesByGenre(
    @Query('with_genres') int genreId,
    @Query('page') int page,
  );
}

