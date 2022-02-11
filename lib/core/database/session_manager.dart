import 'dart:convert';

import 'package:artisan/core/helper/configs/instances.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

import 'hive_database.dart';

/// A class for managing sessions, handles saving and retrieving of data
class SessionManager {
  SessionManager._internal();

  SharedPreferences? sharedPreferences;

  static final SessionManager _instance = SessionManager._internal();

  factory SessionManager() => _instance;

  static SessionManager get instance => _instance;

  Future<void> initializeSession() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String keyAuthToken = 'auth_token';
  static const String keyAuthTokenType = 'token_type';
  static const String keyUserData = 'users_data';
  static const String logginKey = 'loggin';

  String get authTokenType =>
      sharedPreferences!.getString(keyAuthTokenType) ?? '';
  String get authToken => sharedPreferences!.getString(keyAuthToken) ?? '';

  bool get isLoggedIn => sharedPreferences!.getBool(logginKey) ?? false;

  set isLoggedIn(bool logging) =>
      sharedPreferences!.setBool(logginKey, logging);

  set authToken(String authToken) =>
      sharedPreferences!.setString(keyAuthToken, authToken);

  set authTokenType(String authTokenType) =>
      sharedPreferences!.setString(keyAuthTokenType, authTokenType);

  Map<String, dynamic> get usersData =>
      json.decode(sharedPreferences!.getString(keyUserData) ?? '');

  set usersData(Map<String, dynamic>? map) =>
      sharedPreferences!.setString(keyUserData, json.encode(map));

  Future<bool> logOut() async {
    await sharedPreferences!.clear();
    await HiveBoxes.clearAllBox();
    try {
      final cacheDir = await getTemporaryDirectory();
      if (cacheDir.existsSync()) {
        cacheDir.deleteSync(recursive: true);
      }
      final appDir = await getApplicationSupportDirectory();
      if (appDir.existsSync()) {
        appDir.deleteSync(recursive: true);
      }
    } catch (e) {
      logger.d("error clearing cache");
    }
    return true;
  }
}
