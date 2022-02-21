import 'package:flutter/material.dart';

import 'app_color.dart';

const textInputDecoration = InputDecoration(
  hintStyle: TextStyle(
    color: Color(0x3040454B),
    fontSize: 16,
  ),
  filled: true,
  labelStyle: TextStyle(
    color: Color(0xFF40454B),
    fontSize: 16,
  ),
  fillColor: AppColor.COLOR_DARK_WHITE,
  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.COLOR_DARK_WHITE,
      width: 1,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.COLOR_DARK_WHITE,
      width: 1,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  focusColor: AppColor.COLOR_DARK_WHITE,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.COLOR_DARK_WHITE,
      width: 1,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.COLOR_DARK_WHITE,
      width: 1,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.COLOR_DARK_WHITE,
      width: 1,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const double appButtonHeight = 40.0;
