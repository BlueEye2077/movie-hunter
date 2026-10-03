import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Shared Dio factory — used by all feature API services.
Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = const Duration(seconds: 6)
    ..options.receiveTimeout = const Duration(seconds: 10);

  if (kDebugMode) {
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: false,
        responseHeader: false,
        request: true,
        requestBody: true,
      ),
    );
  }

  return dio;
}
