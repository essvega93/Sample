import 'package:flutter/material.dart';
import 'package:match_me/data/models/response/chat/chat_list_data.dart';

import '../../shared/Styles.dart';
import '../../shared/app_color.dart';
import '../../shared/images_path.dart';
import '../../shared/strings_constant.dart';
import '../../widgets/common_app_bar.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  List<ChatListData> chatDataList = List.generate(
      10,
      (index) => ChatListData(
          name: 'Rose ward',
          image: (index % 2 == 0)
              ? ImagePath.PLACEHOLDER_IMAGE_1
              : ImagePath.PLACEHOLDER_IMAGE_2,
          status: 'Active now',
          message: 'That’s awesome man. How about a date ton ...'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: CommonAppBar.getAppBar(
          isBackVisible: false,
          context: context,
          isRightWidgetVisible: true,
          type: WhatInRight.ICON,
          rightIcon: Icons.more_vert,
          title: StringConst.MESSAGES_TITLE),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListView.builder(
        shrinkWrap: false,
        itemBuilder: (_, index) => rowItem(chatDataList[index]),
        itemCount: chatDataList.length,
      ),
    );
  }

  Widget rowItem(ChatListData matchDataList) {
    return ListTile(
      tileColor: AppColor.whiteColor,
      contentPadding: const EdgeInsets.only(left: 10,bottom: 5),
      minLeadingWidth: 5,
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(matchDataList.image!),
      ),
      title: Text(
        matchDataList.name ?? '',
        style: Styles.boldText(),
      ),
      subtitle: Text(
        matchDataList.message ?? '',
        style: Styles.lightText(size: 12),
      ),
    );
  }
}
