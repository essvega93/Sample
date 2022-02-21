import 'package:flutter/material.dart';
import 'package:match_me/data/models/response/matches/matches_data.dart';
import 'package:match_me/shared/Styles.dart';
import 'package:match_me/shared/app_color.dart';
import 'package:match_me/shared/images_path.dart';
import 'package:match_me/shared/strings_constant.dart';
import 'package:match_me/widgets/common_app_bar.dart';

class MatchListPage extends StatefulWidget {
  const MatchListPage({Key? key}) : super(key: key);

  @override
  _MatchListPageState createState() => _MatchListPageState();
}

class _MatchListPageState extends State<MatchListPage> {
  List<MatchesData> matchDataList = List.generate(
      10,
      (index) => MatchesData(
          name: 'Rose ward',
          image: (index % 2 == 0)
              ? ImagePath.PLACEHOLDER_IMAGE_1
              : ImagePath.PLACEHOLDER_IMAGE_2,
          status: 'Active now'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: CommonAppBar.getAppBar(
          isBackVisible: false,
          context: context,
          isRightWidgetVisible: true,
          type: WhatInRight.ICON,
          title: StringConst.MATCHES_TITLE),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: GridView.builder(
        shrinkWrap: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.62,
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemBuilder: (_, index) => rowItem(matchDataList[index]),
        itemCount: matchDataList.length,
      ),
    );
  }

  Widget rowItem(MatchesData matchDataList) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.asset(matchDataList.image!),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              matchDataList.name ?? '',
              style: Styles.extraBoldText(),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.circle,
                  size: 10,
                  color: Colors.green,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  matchDataList.status ?? '',
                  style: Styles.lightText(size: 12),
                ),
              ],
            )
          ],
        ),
        decoration: const BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
