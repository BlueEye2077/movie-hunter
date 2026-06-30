import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferanceHelper {
  SharedPreferanceHelper._();

  static late final SharedPreferences prefs;

  static Future<void> prefsInit() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveSeenOnBoarding() async {
    await prefs.setBool("has_seen_onboarding", true);
  }

  static bool getSeenOnBoarding() {
    final bool hasSeenOnboarding = prefs.getBool('has_seen_onboarding')?? false;
    return hasSeenOnboarding;
  }

}
