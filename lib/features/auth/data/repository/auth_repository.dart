import '../../../../core/helpers/secure_storage_helper.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../models/create_new_session_model.dart';
import '../models/create_request_token_model.dart';
import '../models/login_model.dart';
import '../web_services/auth_api_services.dart';

class AuthRepository {
  final AuthApiService authApiService;
  final token = ApiConstants.apiKey;

  AuthRepository({required this.authApiService});

  Future<ApiResult<CreateNewSessionModel>> performFullLogin(
    String username,
    String password,
  ) async {
    try {
      final CreateRequestTokenModel tokenResponse = await authApiService
          .createRequestToken(token);
      final String requestToken = tokenResponse.requestToken!;

      await authApiService.login(
        token,
        LoginModel(
          username: username,
          password: password,
          requestToken: requestToken,
        ),
      );

      final CreateNewSessionModel sessionResponse = await authApiService
          .createSession(token, {"request_token": requestToken});
      
      final sessionId = sessionResponse.sessionId!;
      await SecureStorageHelper.saveSessionId(sessionId);

      return ApiResult.success(sessionResponse);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
