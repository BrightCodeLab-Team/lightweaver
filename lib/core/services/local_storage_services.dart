// ignore_for_file: unnecessary_null_in_if_null_operators, avoid_print

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServices {
  static SharedPreferences? _preferences;

  ///
  /// initializing instance
  ///
  init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  ///
  /// List of const keys
  ///
  static const String onboardingCountKey = 'onBoardingCount';
  static const String notificationsCountKey = 'snotificationsCount';
  static const String accessTokenKey = 'accessToken';
  static const String refreshTokenKey = 'refreshToken';
  static const String userid = 'userid';

  ///
  /// Setters and getters
  ///

  ///
  /// get and set onboarding page count
  ///
  int get onBoardingPageCount => _getFromDisk(onboardingCountKey) ?? 0;
  set onBoardingPageCount(int count) => _saveToDisk(onboardingCountKey, count);

  ///
  /// get and set Notifications Count
  ///
  int get setNotificationsCount => _getFromDisk(notificationsCountKey) ?? 0;
  set setNotificationsCount(int count) =>
      _saveToDisk(notificationsCountKey, count);

  ///
  /// get and set access token
  ///
  dynamic get accessToken => _getFromDisk(accessTokenKey) ?? null;
  set accessToken(token) => _saveToDisk(accessTokenKey, token);

  dynamic get getUserid => _getFromDisk(userid) ?? null;
  set setUserid(token) => _saveToDisk(userid, token);

  ///
  /// get refresh token
  ///
  dynamic get refreshToken => _getFromDisk(refreshTokenKey) ?? null;

  ///
  /// get data from the disk
  ///
  dynamic _getFromDisk(String key) {
    var value = _preferences!.get(key);
    print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  ///
  /// save data
  ///
  void _saveToDisk<T>(String key, T? content) {
    print(
      '(TRACE) LocalStorageService:c_saveToDisk. key: $key value: $content',
    );

    if (content is String) {
      _preferences!.setString(key, content);
    }
    if (content is bool) {
      _preferences!.setBool(key, content);
    }
    if (content is int) {
      _preferences!.setInt(key, content);
    }
    if (content is double) {
      _preferences!.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences!.setStringList(key, content);
    }

    if (content == null) {
      _preferences!.remove(key);
    }
  }

  // static Future<LocalStorageService> getInstance() async {
  //   if (_instance == null) {
  //     _instance = LocalStorageService();
  //   }
  //   if (_preferences == null) {
  //     _preferences = await SharedPreferences.getInstance();
  //   }
  //   return _instance!;
  // }
}
