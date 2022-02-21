import 'Preference.dart';

class UserSession {
  static String deviceId = '';
  static String email = '';
  static String pass = '';
  static int userId = 0;

  static clearSession() {
    deviceId = '';
    userId = 0;
  }

  UserSession() {
    if (Preference.exists(Preference.DEVICE_ID)) {
      deviceId = Preference.getString(Preference.DEVICE_ID);
    }
    if (Preference.exists(Preference.USER_ID)) {
      userId = Preference.getInt(Preference.USER_ID);
    }
  }
}
