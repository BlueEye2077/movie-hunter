import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/create_new_session_response_model.dart';
import '../models/create_request_token_response_model.dart';
import '../models/create_session_request_model.dart';
import '../models/login_request_model.dart';
import 'auth_api_constants.dart';

part 'auth_api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String? baseUrl}) = _AuthApiService;

  // Step 1: Create Request Token
  @GET(AuthApiConstants.createRequestToken)
  Future<CreateRequestTokenResponseModel> createRequestToken();

  // Step 2: Validate With Login
  @POST(AuthApiConstants.validateWithLogin)
  Future<CreateRequestTokenResponseModel> login(
    @Body() LoginRequestModel body,
  );

  // Step 3: Create Session
  @POST(AuthApiConstants.createSession)
  Future<CreateNewSessionResponseModel> createSession(
    @Body() CreateSessionRequestModel body,
  );
}
