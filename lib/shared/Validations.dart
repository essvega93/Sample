
import 'package:match_me/shared/strings_constant.dart';

enum Validations {
  EMAIL,
  PASSWORD,
}

String? validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,3}))$';
  RegExp regExp = RegExp(pattern);
  if (value.trim().isEmpty) {
    return "Email is required";
  } else if (!regExp.hasMatch(value)) {
    return "Please enter a valid email";
  } else {
    return null;
  }
}

String? validatePassword(String value) {
  if (value.isEmpty) {
    return StringConst.ENTER_PASSWORD;
  } else if (value.trim().length < 8) {
    return StringConst.MIN_PASS_LENGHT_TEXT;
  } else {
    return null;
  }
}

String? validateConfirmPassword(String value, {String? password}) {
  if (value.isEmpty) {
    return StringConst.ENTER_CONFRIM_PASSWORD;
  } else if (value.trim().length < 6) {
    return StringConst.MIN_PASS_LENGHT_TEXT;
  } else if (value != password) {
    return "Confirm password should match the password";
  } else {
    return null;
  }
}

String? validatePhone(String value, {bool isRequired = true}) {
  Pattern pattern = r'(^(?:[+0]9)?[0-9]{8,14}$)';
  if (isRequired && (value.trim().isEmpty)) {
    return "Phone number required";
  } else if (value.length < 14) {
    return "Please enter the valid number";
  } else {
    return null;
  }
}
