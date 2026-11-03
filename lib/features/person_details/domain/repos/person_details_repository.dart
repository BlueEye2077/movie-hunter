import '../../../../core/networking/api_result.dart';
import '../entities/person_details_entity.dart';

abstract class PersonDetailsRepository {
  Future<ApiResult<PersonDetailsEntity>> getPersonDetails(int personId);
}
