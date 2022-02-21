import 'package:flutter/material.dart';

import '../shared/Styles.dart';
import '../shared/app_color.dart';

enum WhatInRight { ICON, TEXT, IMAGE }

class CommonAppBar {
  static getAppBar(
      {required BuildContext context,
      Color bgColor = AppColor.whiteColor,
      Color backColor = AppColor.searchcolor,
      String title = '',
      bool isRightWidgetVisible = false,
      Function()? rightWidgetClick,
      IconData? rightIcon,
      IconData backIcon = Icons.arrow_back,
      String rightText = '',
      String? rightImage,
      bool isBackVisible = true,
      double leadingWidth = 0,
      Function()? onBackPressed,
      WhatInRight type = WhatInRight.TEXT,
      List<Widget>? rightActions}) {
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      leadingWidth: leadingWidth,
      leading: Visibility(
          child: isBackVisible
              ? IconButton(
                  icon: Icon(
                    backIcon,
                    color: backColor,
                  ),
                  onPressed: () {
                    if (onBackPressed != null) {
                      onBackPressed();
                    } else {
                      Navigator.pop(context);
                    }
                  })
              : Container()),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: Styles.blackText(size: 22),
      ),
      centerTitle: false,
      actions: rightActions ??
          <Widget>[
            Visibility(
                visible: isRightWidgetVisible,
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: rightWidgetClick,
                  child: type == WhatInRight.TEXT
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              rightText,
                              textAlign: TextAlign.center,
                              style: Styles.semiBoldText(
                                  size: 16, textColor: AppColor.whiteColor),
                            ),
                          ))
                      : type == WhatInRight.IMAGE
                          ? Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: CircleAvatar(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    rightImage!,
                                    fit: BoxFit.cover,
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                rightIcon,
                                color: AppColor.color363636,
                                size: 30,
                              ),
                            ),
                ))
          ],
    );
  }
}
