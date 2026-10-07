import 'package:movie_hunter/core/networking/api_result.dart';
import 'package:movie_hunter/features/auth/domain/entities/user_session_entity.dart';

abstract class AuthRepository {
  Future<ApiResult<UserSessionEntity>> login(
    String username,
    String password,
  );
}
