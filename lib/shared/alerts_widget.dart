import 'package:flutter/material.dart';
import 'package:match_me/shared/strings_constant.dart';

import 'Styles.dart';
import 'app_color.dart';

class AlertsWidget {
  static Future alertWithCustomBtn(
      {required BuildContext context,
      String title = "Payment",
      String text = "",
      Function? onOkClick,
      Function? onCancelClick,
      String buttonText1 = StringConst.CANCEL_TITLE,
      String buttonText2 = StringConst.OK_TITLE}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return WillPopScope(
          onWillPop: () async => false,
          child: Theme(
            data: ThemeData(dialogBackgroundColor: AppColor.whiteColor),
            child: AlertDialog(
              title: Text(
                title,
                style: Styles.regularText(size: 18),
                textAlign: TextAlign.start,
              ),
              content: Text(
                text,
                style: Styles.regularText(size: 14),
                textAlign: TextAlign.start,
              ),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                FlatButton(
                  minWidth: 10,
                  child: Text(
                    buttonText1,
                    style: Styles.regularText(size: 18),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (onCancelClick != null) onCancelClick();
                  },
                ),
                FlatButton(
                  minWidth: 10,
                  child: Text(
                    buttonText2,
                    style: Styles.regularText(size: 18),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (onOkClick != null) onOkClick();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future alertWithYesNoBtn(
      {required BuildContext context,
      String title = "",
      String text = "",
      Function? onOkClick,
      Function? onCancelClick}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return WillPopScope(
          onWillPop: () async => false,
          child: Theme(
            data: ThemeData(dialogBackgroundColor: AppColor.whiteColor),
            child: AlertDialog(
              title: Text(
                title,
                style: Styles.regularText(size: 18),
                textAlign: TextAlign.start,
              ),
              content: Text(
                text,
                style: Styles.regularText(size: 14),
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                FlatButton(
                  minWidth: 10,
                  child: Text(
                    StringConst.NO_TITLE,
                    style: Styles.regularText(size: 18),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (onCancelClick != null) onCancelClick();
                  },
                ),
                FlatButton(
                  minWidth: 10,
                  child: Text(
                    StringConst.YES_TITLE,
                    style: Styles.regularText(size: 18),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      Navigator.pop(context);
                    });
                    if (onOkClick != null) onOkClick();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future alertWithOkBtn(
      {required BuildContext context,
      String text = "",
      String title = "Alert",
      Function? onOkClick}) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        // return object of type Dialog
        return WillPopScope(
          onWillPop: () async => true,
          child: Theme(
            data: ThemeData(dialogBackgroundColor: AppColor.whiteColor),
            child: AlertDialog(
              title: Text(title, style: Styles.regularText(size: 18)),
              content: Text(text, style: Styles.regularText(size: 16)),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                FlatButton(
                  child: Text(StringConst.OK_TITLE,
                      style: Styles.regularText(size: 14)),
                  onPressed: () {
                    Navigator.pop(context);
                    if (onOkClick != null) onOkClick();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
