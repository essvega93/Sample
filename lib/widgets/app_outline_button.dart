import 'package:flutter/material.dart';

import '../shared/app_color.dart';
import '../shared/constants.dart';

// Custom App Button
class AppOutlineButton extends StatelessWidget {
  final Function onTap;
  final bool isEnabled;
  final String title;

  const AppOutlineButton({
    this.isEnabled = true,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onTap();
      },
      height: appButtonHeight,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: AppColor.primarycolor,
            width: 2,
          )),
      color: AppColor.whiteColor,
      disabledColor: AppColor.disabledColor,
      enableFeedback: isEnabled,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColor.COLOR_DARK_BLUE,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
