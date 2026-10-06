import 'package:movie_hunter/core/networking/api_result.dart';
import 'package:movie_hunter/features/auth/domain/entities/user_session_entity.dart';

import '../repos/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase({required AuthRepository authRepository})
    : _authRepository = authRepository;

  Future<ApiResult<UserSessionEntity>> call(
    String username,
    String password,
  ) async {
    return await _authRepository.login(username, password);
  }
}
