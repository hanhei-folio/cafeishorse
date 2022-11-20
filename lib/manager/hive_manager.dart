import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
  static const String boxName = 'userinfo';
  static const String tokenKey = 'token';
  static late Box box;

  static Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox(boxName);
  }

  // 로그인 or 자동로그인 성공시
  static void saveDeviceToken(String token) {
    box.put(tokenKey, token);
  }

  // 자동로그인 시도시
  static String? getDeviceToken() {
    return box.get(tokenKey);
  }

  // 로그아웃시
  static void deleteDeviceToken() {
    box.delete(tokenKey);
  }

  ////////// 아래는 하위 메소드

  static String? getUserInfoByString(String key) {
    return box.get(key, defaultValue: null);
  }

  static int getUserInfoByInt(String key) {
    return box.get(key, defaultValue: -1);
  }

  static bool getUserInfoByBool(String key) {
    return box.get(key, defaultValue: false);
  }

  static void deleteUserInfo(String key) {
    box.delete(key);
  }

  static void createUserInfoByString(String key, String value) {
    box.put(key, value);
  }

  static void createUserInfoByInt(String key, int value) {
    box.put(key, value);
  }

  static void createUserInfoByBool(String key, bool value) {
    box.put(key, value);
  }
}
