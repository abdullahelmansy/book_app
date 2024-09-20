import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String token = '';
  static late SharedPreferences sharedPreferences;
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static chacedData({required String key, required dynamic value}) {
    if (value is String) {
      sharedPreferences.setString(key, value);
    } else if (value is int) {
      sharedPreferences.setInt(key, value);
    } else if (value is double) {
      sharedPreferences.setDouble(key, value);
    } else if (value is bool) {
      sharedPreferences.setBool(key, value);
    } else {
      sharedPreferences.setStringList(key, value);
    }
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }
}
