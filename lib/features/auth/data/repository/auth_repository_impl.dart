import '../../../../core/constants/constants.dart';
import '../../../../features/auth/domain/entities/user_session_entity.dart';
import '../../../../features/auth/domain/repos/auth_repository.dart';

import '../../../../core/helpers/secure_storage_helper.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../models/create_new_session_response_model.dart';
import '../models/create_request_token_reponse_model.dart';
import '../models/login_request_model.dart';
import '../web_services/auth_api_services.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService authApiService;

  AuthRepositoryImpl({required this.authApiService});

  @override
  Future<ApiResult<UserSessionEntity>> login(
    String username,
    String password,
  ) async {
    try {
      final CreateRequestTokenResponseModel tokenResponse = await authApiService
          .createRequestToken();
      final String? requestToken = tokenResponse.requestToken;
      if (requestToken == null || requestToken.isEmpty) {
        return ApiResult.failure(
          const NetworkExceptions.defaultError(
            "Failed to obtain request token",
          ),
        );
      }

      await authApiService.login(
        LoginRequestModel(
          username: username,
          password: password,
          requestToken: requestToken,
        ),
      );

      final CreateNewSessionResponseModel sessionResponse = await authApiService
          .createSession({"request_token": requestToken});

      final sessionId = sessionResponse.sessionId;
      if (sessionId == null || sessionId.isEmpty) {
        return ApiResult.failure(
          const NetworkExceptions.defaultError("Failed to create session"),
        );
      }

      await SecureStorageHelper.saveSessionId(sessionId);
      isLoggedInUser = true;

      return ApiResult.success(sessionResponse.toEntity());
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
