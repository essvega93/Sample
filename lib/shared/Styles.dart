import 'package:flutter/material.dart';

import 'app_color.dart';

class Styles {
  static const _MulishBold = "Mulish_Bold";
  static const _MulishBlack = "Mulish_Black";
  static const _MulishLight = "Mulish_Light";
  static const _MulishRegular = "Mulish_Regular";
  static const _MulishExtraBold = "Mulish_ExtraBold";
  static const _MulishSemiBold = "Mulish_SemiBold";

  static regularWhite({double size = 14}) {
    return TextStyle(
        fontSize: size, fontFamily: _MulishRegular, color: AppColor.WHITE);
  }

  static regularText(
      {double size = 14,
      Color textColor = AppColor.color363636,
      bool isUnderline = false}) {
    return TextStyle(
        decoration: isUnderline ? TextDecoration.underline : null,
        fontSize: size,
        fontFamily: _MulishRegular,
        color: textColor);
  }

  static semiBoldText(
      {double size = 14, Color textColor = AppColor.color363636}) {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: size,
        fontFamily: _MulishSemiBold,
        color: textColor);
  }

  static boldText({double size = 14, Color textColor = AppColor.color363636}) {
    return TextStyle(fontSize: size, fontFamily: _MulishBold, color: textColor);
  }

  static blackText({double size = 14, Color textColor = AppColor.color363636}) {
    return TextStyle(
        fontSize: size, fontFamily: _MulishBlack, color: textColor);
  }

  static extraBoldText(
      {double size = 14, Color textColor = AppColor.color363636}) {
    return TextStyle(
        fontSize: size, fontFamily: _MulishExtraBold, color: textColor);
  }

  static lightText({double size = 14, Color textColor = AppColor.color363636}) {
    return TextStyle(
        fontSize: size, fontFamily: _MulishLight, color: textColor);
  }

  static italicText(
      {double size = 14, Color textColor = AppColor.color363636}) {
    return TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: size,
        fontFamily: _MulishRegular,
        color: textColor);
  }
}
