import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late final SharedPreferences _instance;

  static Future<SharedPreferences> init() async =>
      _instance = await SharedPreferences.getInstance();

  /// Getter bool
  static bool? getBool(String key) => _instance.getBool(key);

  /// Setter bool
  static Future<bool> setBool(String key, bool value) =>
      _instance.setBool(key, value);

  /// Getter String
  static String? getString(String key) => _instance.getString(key);

  /// Setter String
  static Future<bool> setString(String key, String value) =>
      _instance.setString(key, value);

  /// Getter int
  static int? getInt(String key) => _instance.getInt(key);

  /// Setter int
  static Future<bool> setInt(String key, int value) =>
      _instance.setInt(key, value);
}
