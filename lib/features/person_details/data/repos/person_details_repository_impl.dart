import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../domain/entities/person_details_entity.dart';
import '../../domain/repos/person_details_repository.dart';
import '../web_services/person_api_constants.dart';
import '../web_services/person_api_service.dart';

class PersonDetailsRepositoryImpl implements PersonDetailsRepository {
  final PersonApiService _personApiService;

  const PersonDetailsRepositoryImpl({
    required PersonApiService personApiService,
  }) : _personApiService = personApiService;

  @override
  Future<ApiResult<PersonDetailsEntity>> getPersonDetails(
    int personId,
  ) async {
    try {
      final response = await _personApiService.getPersonDetails(
        personId,
        PersonApiConstants.appendMovieCredits,
      );
      return ApiResult.success(response.toEntity());
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
