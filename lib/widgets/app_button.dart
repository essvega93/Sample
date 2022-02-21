import 'package:flutter/material.dart';

import '../shared/app_color.dart';
import '../shared/constants.dart';

// Custom App Button
class AppButton extends StatelessWidget {
  final Function onTap;
  final bool isEnabled;
  final String title;
  Color color;
  double width;
  Color textColor;

  AppButton(
      {Key? key, this.isEnabled = true,
      required this.onTap,
      required this.title,
      required this.width,
      this.textColor = AppColor.whiteColor,
      this.color = AppColor.COLOR_DARK_BLUE}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: MaterialButton(
        onPressed: () {
          onTap();
        },
        height: appButtonHeight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: color,
        disabledColor: AppColor.disabledColor,
        enableFeedback: isEnabled,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
