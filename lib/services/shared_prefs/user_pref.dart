import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _prefs;

  static const _id = "id";
  static const _token = "token";
  static const _userInfo = "user_info";

  static Future init() async => _prefs = await SharedPreferences.getInstance();

  static int getId() => _prefs!.getInt(_id) ?? -1;

  static String getToken() => _prefs!.getString(_token) ?? "";

  static List<String> getUserInfo() => _prefs!.getStringList(_userInfo) ?? [];

  static Future toggleId(int id) async {
    await _prefs!.setInt(_id, id);
  }

  static Future toggleToken(String value) async {
    await _prefs!.setString(_token, value);
  }

  static Future toggleUserInfo(List<String> value) async {
    await _prefs!.setStringList(_userInfo, value);
  }
}
