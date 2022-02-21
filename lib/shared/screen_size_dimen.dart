import 'package:flutter/material.dart';

class ScreenSizeDimen {
  bool isLargeScreen = false;

  ScreenSizeDimen(BuildContext context) {
    isLargeScreen = MediaQuery.of(context).size.width > 600;
  }

  get PIXEL_10 => !isLargeScreen ? 10.0 : 14.0;

  get PIXEL_5 => !isLargeScreen ? 5.0 : 10.0;

  get PIXEL_12 => !isLargeScreen ? 12.0 : 16.0;

  get PIXEL_14 => !isLargeScreen ? 14.0 : 18.0;

  get PIXEL_15 => !isLargeScreen ? 15.0 : 20.0;

  get PIXEL_16 => !isLargeScreen ? 16.0 : 20.0;

  get PIXEL_18 => !isLargeScreen ? 18.0 : 22.0;

  get PIXEL_20 => !isLargeScreen ? 20.0 : 24.0;

  get PIXEL_22 => !isLargeScreen ? 22.0 : 26.0;

  get PIXEL_24 => !isLargeScreen ? 24.0 : 28.0;

  get PIXEL_40 => !isLargeScreen ? 40.0 : 70.0;

  get PIXEL_32 => !isLargeScreen ? 32.0 : 40.0;

  get PIXEL_30 => !isLargeScreen ? 30.0 : 34.0;

  get PIXEL_50 => !isLargeScreen ? 50.0 : 80.0;

  get PIXEL_34 => !isLargeScreen ? 34.0 : 38.0;

  get PIXEL_100 => !isLargeScreen ? 100.0 : 150.0;

  get PIXEL_25 => !isLargeScreen ? 25.0 : 50.0;
}
