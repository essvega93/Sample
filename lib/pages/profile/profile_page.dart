import 'package:flutter/material.dart';
import 'package:match_me/shared/images_path.dart';

import '../../shared/Styles.dart';
import '../../shared/app_color.dart';
import '../../shared/strings_constant.dart';
import '../../widgets/common_app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: CommonAppBar.getAppBar(
          isBackVisible: false,
          context: context,
          isRightWidgetVisible: true,
          type: WhatInRight.ICON,
          title: StringConst.PROFILE),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            ImagePath.PROFILE_IMAGE,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.2,
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height / 2) - 100,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 250,
                  margin: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.whiteColor),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Anthony Howard',
                        style: Styles.extraBoldText(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '26 - Irvine, CA',
                        style: Styles.lightText(size: 12),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      getTextWithIcon(
                          text: 'Straight, Single, 5”11',
                          iconData: Icons.lightbulb),
                      const SizedBox(
                        height: 10,
                      ),
                      getTextWithIcon(
                          text: 'Tea Totaller, Loves Photography & Travel',
                          iconData: Icons.bookmark),
                      const SizedBox(
                        height: 10,
                      ),
                      getTextWithIcon(
                          text: 'Beaches, Mountains, Cafe, Movies',
                          iconData: Icons.map_outlined),
                      const SizedBox(
                        height: 10,
                      ),
                      getTextWithIcon(
                          text: 'Steaks, BBQ, Hotdogs, Salads',
                          iconData: Icons.fastfood),
                      const SizedBox(
                        height: 10,
                      ),
                      getTextWithIcon(
                          text: 'Available',
                          iconData: Icons.access_time_rounded),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getTextWithIcon({required String text, required IconData iconData}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 14,
            color: AppColor.color363636,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: Styles.regularText(textColor: AppColor.color757E90),
          ),
        ],
      ),
    );
  }
}
