import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constants.dart';

/// Shared Dio factory — used by all feature API services.
Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = const Duration(seconds: 6)
    ..options.receiveTimeout = const Duration(seconds: 10)
    ..options.headers['Authorization'] = ApiConstants.apiKey;

  dio.interceptors.add(
    PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      error: true,
      request: true,
    ),
  );
  return dio;
}
