import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static SharedPreferences? _pref;

  static const deviceId = 'deviceId';
  static const userID = 'userID';
  static const versionNbuildNum = 'AppVersionNumberAndBuildnumber';
  static const companyName = 'companyname';
  static const companyCode = 'companyCode';
  static const userPassword = 'upassword';
  static const userFirstName = 'uFirstName';
  static const userLastName = 'ulastName';
  static const useremail = 'email';
  static const unsyncNum = 'unsyncNum';
  static const adtsScannedList = 'adtscannedList';

  static Future initializeSharedPrefs() async {
    _pref = await SharedPreferences.getInstance();
  }

  static Future setString(String key, String value) async {
    await _pref?.setString(key, value);
  }

  static Future setInt(String key, int value) async {
    await _pref?.setInt(key, value);
  }

  static String getString(String key) {
    String? value = _pref?.getString(key);
    return value ?? '';
  }

  static int? getInt(String key) {
    int? value = _pref?.getInt(key);
    return value;
  }

  static Future setStringList(String key, List<String> value) async {
    await _pref?.setStringList(key, value);
  }

  static List<String> getStringList(String key) {
    List<String>? entries = _pref?.getStringList(key);
    return entries ?? [];
  }

  static Future<bool> clearPreferences() async {
    final cleared = await _pref!.clear();
    return cleared;
  }

  static Future<bool> removeKey(String key) async {
    final remove = await _pref!.remove(key);
    return remove;
  }
}
