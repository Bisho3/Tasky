import 'package:todo/core/util/app_import.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static const FlutterSecureStorage _flutterSecureStorage =
      FlutterSecureStorage();

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is List) {
      List jsonList = value.map((e) => e.toJson()).toList();
      String jsonValue = jsonEncode(jsonList);

      return await sharedPreferences.setString(key, jsonValue);
    }
    return await sharedPreferences.setDouble(key, value);
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  static Future<void> saveSecureData({
    required String key,
    required String value,
  }) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }

  static Future<String?> getSecureData({required String key}) async {
    return await _flutterSecureStorage.read(key: key);
  }

  static Future<void> removeSecureData({required String key}) async {
    await _flutterSecureStorage.delete(key: key);
  }
}
