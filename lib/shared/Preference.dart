import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static Preference? _prefHelper;
  static const DEVICE_ID = "DEVICE_ID";
  static String IS_LOGIN = "USER_TOKEN";
  static String USER_TYPE = "USER_TYPE";

  static String USER_ID = "USER_ID";

  static String PASS = "PASS";
  static String EMAIL = "EMAIL";

  static getInstance() {
    _prefHelper ??= Preference();
    return _prefHelper;
  }

  static SharedPreferences? _prefs;
  static final Map<String, dynamic> _memoryPrefs = Map<String, dynamic>();

  static Future<SharedPreferences?> load() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs;
  }

  static Future<bool> clearPref() async {
    String email = getString(Preference.EMAIL);
    String pass = getString(Preference.PASS);
    bool clear = await _prefs!.clear();
    if (clear) {
      _memoryPrefs.clear();
    }
    setString(PASS, pass);
    setString(EMAIL, email);
    return clear;
  }

  static void setString(String key, String value) {
    _prefs!.setString(key, value);
    _memoryPrefs[key] = value;
  }

  static void setListString(String key, List<String> value) {
    _prefs!.setStringList(key, value);
    _memoryPrefs[key] = value;
  }

  static void setInt(String key, int value) {
    _prefs!.setInt(key, value);
    _memoryPrefs[key] = value;
  }

  static void setDouble(String key, double value) {
    _prefs!.setDouble(key, value);
    _memoryPrefs[key] = value;
  }

  static void setBool(String key, bool value) {
    _prefs!.setBool(key, value);
    _memoryPrefs[key] = value;
  }

  static String getString(String key, {String? def}) {
    String? val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    val ??= _prefs!.getString(key);
    val ??= def;
    _memoryPrefs[key] = val;
    return val ?? '';
  }

  static bool exists(String key, {String def = ''}) {
    return _prefs!.containsKey(key);
  }

  static int getInt(String key, {int def = 0}) {
    int? val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    val ??= _prefs?.getInt(key);
    val ??= def;
    _memoryPrefs[key] = val;
    return val;
  }

  static double getDouble(String key, {double def = 0.0}) {
    double? val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    val ??= _prefs?.getDouble(key);
    val ??= def;
    _memoryPrefs[key] = val;
    return val;
  }

  static bool getBool(String key, {bool def = false}) {
    bool? val = def;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (_prefs == null) {
      return val ?? false;
    }
    val = _prefs!.getBool(key);
    val ??= def;
    _memoryPrefs[key] = val;
    return val;
  }
}
