import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/core/constants/constants.dart';
import 'package:movie_hunter/core/helpers/secure_storage_helper.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/shared_preferance_helper.dart';
import 'core/routing/app_router.dart';
import 'movie_hunter_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferanceHelper.prefsInit();
  await checkIfLoggedInUser();
  checkSeenOnBoarding();
  await ScreenUtil.ensureScreenSize();
  initGetIt();
  runApp(MovieHunterApp(appRouter: AppRouter()));
}

Future<void> checkIfLoggedInUser() async {
  String? sessionId = await SecureStorageHelper.getSessionId();
  if (sessionId != null) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}

void checkSeenOnBoarding() {
  bool seenOnBoardingValue = SharedPreferanceHelper.getSeenOnBoarding();
  isSeenOnBoarding = seenOnBoardingValue;
}
