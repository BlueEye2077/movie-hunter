import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../models/person_details_response.dart';
import '../web_services/person_api_service.dart';

class PersonRepository {
  final PersonApiService personApiService;

  PersonRepository({required this.personApiService});

  Future<ApiResult<PersonDetailsResponse>> getPersonDetails(
    int personId,
  ) async {
    try {
      final response = await personApiService.getPersonDetails(
        personId,
        'movie_credits',
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
