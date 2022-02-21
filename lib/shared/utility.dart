import 'dart:io';
import 'dart:math' show cos, sqrt, asin;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Styles.dart';
import 'app_color.dart';

class Utility {
  static Future<bool> checkNetwork() async {
    bool isConnected = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException catch (_) {
      isConnected = false;
    }
    return isConnected;
  }

  static void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  var currentLocation;

  static void showSnackBar(
      {required String message,
      required BuildContext scaffoldContext,
      int miliSec = 1500}) {
    Scaffold.of(scaffoldContext).showSnackBar(SnackBar(
        duration: Duration(milliseconds: miliSec),
        content: Text(
          message,
          style: Styles.boldText(),
        ),
        backgroundColor: AppColor.whiteColor));
  }

  static String convertDate(String serverFormat, String date, String newFormat,
      {bool isUTC = false}) {
    DateFormat format = DateFormat(serverFormat);
    DateTime time = format.parse(date, isUTC);
    int _miliSecond = time.toLocal().millisecondsSinceEpoch;

    return DateFormat(newFormat)
        .format(DateTime.fromMicrosecondsSinceEpoch(_miliSecond * 1000));
  }

  static String convertDateFormat(DateTime date,
      {String format = 'yyyy-MM-dd'}) {
    var formatter = DateFormat(format);
    String formatted = formatter.format(date);
    return formatted;
  }

  static String getCurrentTime({String format = 'yyyy-MM-dd'}) {
    var formatter = DateFormat(format);
    String formatted = formatter.format(DateTime.now().toUtc());
    return formatted;
  }

  static String convertDateFormatMMDDYYYY(DateTime date) {
    var formatter = DateFormat("MM.dd.yyyy");
    String formatted = formatter.format(date);
    return formatted;
  }

  static int getMilliSec(String serverFormat, String date,
      {bool isUTC = false}) {
    DateFormat format = DateFormat(serverFormat);
    DateTime time = format.parse(date, isUTC);
    return time.toLocal().millisecondsSinceEpoch;
  }

  static int getDeviceType() {
    if (Platform.isAndroid) {
      return 1;
    } else {
      return 2;
    }
  }

  static Future waitFor(int seconds) async {
    await Future.delayed(Duration(seconds: seconds));
  }

  static Future waitForMili(int milli) async {
    await Future.delayed(Duration(milliseconds: milli));
  }

  /*static Future<String> getDeviceID() async {
    String deviceID;
    final DeviceInfoPlugin deviceInfoPlugin =  DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        deviceID = build.androidId; //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        deviceID = data.identifierForVendor; //UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
    return deviceID;
  }*/
  static bool isNumber(String number) {
    if (number == 'Unk') {
      return false;
    }
    return int.tryParse(number) != null;
  }

  static String getVerboseDateTimeRepresentation(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime justNow = now.subtract(const Duration(minutes: 1));
    DateTime localDateTime = dateTime.toLocal();
    if (!localDateTime.difference(justNow).isNegative) {
      return "Just now";
    }
    String roughTimeString = DateFormat('jm').format(dateTime);
    if (localDateTime.day == now.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return roughTimeString;
    }
    DateTime yesterday = now.subtract(const Duration(days: 1));
    if (localDateTime.day == yesterday.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return 'Yesterday';
    }
    if (now.difference(localDateTime).inDays < 4) {
      String weekday = DateFormat('EEEE').format(localDateTime);
      return '$weekday, $roughTimeString';
    }
    return '${DateFormat('yMd').format(dateTime)}, $roughTimeString';
  }

  static bool isExpired(int time) {
    final now = DateTime.now();
    final expirationDate = DateTime.fromMillisecondsSinceEpoch(time);
    final int days = expirationDate.difference(now).inDays;
    return days < 0;
  }

  static double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  static Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      Fluttertoast.showToast(
          msg: "Url cannot launch",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }
}
