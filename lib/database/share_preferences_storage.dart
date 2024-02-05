import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorage {
  static const _introKey = '_introKey';

  static const _authKey = '_authKey';

  static const _didOnboardKey = '_didOnboardKey';

  //Get onboard
  static Future<bool> isOnboardCompleted() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_didOnboardKey) ?? false;
    } catch (e) {
      return false;
    }
  }

  //Get authKey
  // static Future<String> getApiTokenKey() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     return prefs.getString(_authKey) ?? "";
  //   } catch (e) {
  //     Logger.(e);
  //     return "";
  //   }
  // }

  //Set authKey
  // static void setApiTokenKey(String apiTokenKey) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(_authKey, apiTokenKey);
  // }

}
