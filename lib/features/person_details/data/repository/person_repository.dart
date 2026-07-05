import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../models/person_details_response.dart';
import '../web_services/person_api_service.dart';

class PersonRepository {
  final PersonApiService personApiService;
  final _token = ApiConstants.apiKey;

  PersonRepository({required this.personApiService});

  Future<ApiResult<PersonDetailsResponse>> getPersonDetails(
    int personId,
  ) async {
    try {
      final response = await personApiService.getPersonDetails(
        _token,
        personId,
        'movie_credits',
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
