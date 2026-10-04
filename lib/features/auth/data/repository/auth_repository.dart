import '../../../../core/helpers/secure_storage_helper.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../models/create_new_session_model.dart';
import '../models/create_request_token_model.dart';
import '../models/login_model.dart';
import '../web_services/auth_api_services.dart';

class AuthRepository {
  final AuthApiService authApiService;

  AuthRepository({required this.authApiService});

  Future<ApiResult<CreateNewSessionModel>> performFullLogin(
    String username,
    String password,
  ) async {
    try {
      final CreateRequestTokenModel tokenResponse =
          await authApiService.createRequestToken();
      final String? requestToken = tokenResponse.requestToken;
      if (requestToken == null || requestToken.isEmpty) {
        return ApiResult.failure(
          const NetworkExceptions.defaultError("Failed to obtain request token"),
        );
      }

      await authApiService.login(
        LoginModel(
          username: username,
          password: password,
          requestToken: requestToken,
        ),
      );

      final CreateNewSessionModel sessionResponse = await authApiService
          .createSession({"request_token": requestToken});

      final sessionId = sessionResponse.sessionId;
      if (sessionId == null || sessionId.isEmpty) {
        return ApiResult.failure(
          const NetworkExceptions.defaultError("Failed to create session"),
        );
      }

      await SecureStorageHelper.saveSessionId(sessionId);

      return ApiResult.success(sessionResponse);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
