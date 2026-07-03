import 'package:dio/dio.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/create_new_session_model.dart';
import '../models/create_request_token_model.dart';
import '../models/login_model.dart';
import 'auth_api_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String? baseUrl}) = _AuthApiService;

  // Step 1: Create Request Token
  @GET(AuthApiConstants.createRequestToken)
  Future<CreateRequestTokenModel> createRequestToken(
    @Header("Authorization") String token,
  );
  // Step 2: Validate With Login
  @POST(AuthApiConstants.validateWithLogin)
  Future<CreateRequestTokenModel> login(
    @Header("Authorization") String token,
    @Body() LoginModel body,
  );
  // Step 3: Create Session
  @POST(AuthApiConstants.createSession)
  Future<CreateNewSessionModel> createSession(
    @Header("Authorization") String token,
    @Body() Map<String, dynamic> body,
  );
}
