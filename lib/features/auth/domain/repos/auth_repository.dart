import '../../../../core/networking/api_result.dart';
import '../entities/user_session_entity.dart';

abstract class AuthRepository {
  Future<ApiResult<UserSessionEntity>> login(
    String username,
    String password,
  );
}
