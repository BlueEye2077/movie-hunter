import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/person_details_response.dart';
import 'person_api_constants.dart';

part 'person_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class PersonApiService {
  factory PersonApiService(Dio dio, {String? baseUrl}) = _PersonApiService;

  @GET(PersonApiConstants.personDetails)
  Future<PersonDetailsResponse> getPersonDetails(
    @Header("Authorization") String token,
    @Path("person_id") int personId,
    @Query("append_to_response") String appendToResponse,
  );
}
