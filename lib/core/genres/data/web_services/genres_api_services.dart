import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/get_genres_api_response.dart';
import 'genres_api_constants.dart';

part 'genres_api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class GenresApiServices {
  factory GenresApiServices(Dio dio, {String? baseUrl}) = _GenresApiServices;

  // Get the genres list
  @GET(GenresApiConstants.genres)
  Future<GetGenresApiResponse> getGenres();
}
