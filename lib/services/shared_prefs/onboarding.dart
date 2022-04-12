import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPreferences {
  static SharedPreferences? _prefs;

  static const _name = "connected";

  static Future init() async => _prefs = await SharedPreferences.getInstance();

  static bool status() => _prefs!.getBool(_name) ?? false;

  static Future toggleStatus() async {
    await _prefs!.setBool(_name, !(status()));
  }
}
