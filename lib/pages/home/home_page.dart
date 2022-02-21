import 'package:flutter/material.dart';
import 'package:match_me/pages/explore/explore_page.dart';
import 'package:match_me/shared/Styles.dart';
import 'package:match_me/shared/app_color.dart';
import 'package:match_me/shared/strings_constant.dart';

import '../../shared/screen_with_loader.dart';
import '../chat/chat_list_page.dart';
import '../match/match_list_page.dart';
import '../profile/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedItemColor: AppColor.primarycolor,
        unselectedItemColor: AppColor.color363636,
        selectedLabelStyle: Styles.blackText(),
        selectedFontSize: 10,
        iconSize: 18,
        unselectedFontSize: 8,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        unselectedLabelStyle: Styles.semiBoldText(),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: showIndicator(selectedIndex == 0, Icons.search),
            label: StringConst.EXPLORE_TITLE,
          ),
          BottomNavigationBarItem(
            icon: showIndicator(selectedIndex == 1, Icons.favorite_rounded),
            label: StringConst.MATCHES_TITLE,
          ),
          BottomNavigationBarItem(
            icon: showIndicator(selectedIndex == 2, Icons.chat),
            label: StringConst.CHAT,
          ),
          BottomNavigationBarItem(
            icon: showIndicator(selectedIndex == 3, Icons.person),
            label: StringConst.PROFILE,
          ),
        ],
      ),
    );
  }

  Widget showIndicator(bool show, IconData iconData) {
    return Column(

      children: [
        Visibility(
          visible: show,
          child: Container(
            height: 2,
            color: AppColor.primarycolor,
          ),
        ),
        const SizedBox(height: 7,),
        Icon(iconData)
      ],
    );
  }

  int selectedIndex = 0;

  Widget getBody() {
    switch (selectedIndex) {
      case 0:
        return const ExplorePage();
      case 1:
        return const MatchListPage();
      case 2:
        return const ChatListPage();
      case 3:
        return const ProfilePage();
    }
    return Container();
  }
}
