import 'package:flutter/material.dart';
import 'package:match_me/data/models/response/explore/explore_data.dart';
import 'package:match_me/shared/Styles.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../shared/app_color.dart';
import '../../shared/images_path.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<SwipeItem> _swipeItems = List.generate(
      10,
      (index) => SwipeItem(
              content: ExploreData(
            name: 'Rose ward',
            image: (index % 2 == 0)
                ? ImagePath.PLACEHOLDER_IMAGE_1
                : ImagePath.PLACEHOLDER_IMAGE_2,
            description:
                'Full-time Traveller. Globe Trotter.. Occasional Photographer. Part time Singer/Dancer.',
          )));
  MatchEngine? _matchEngine;

  @override
  void initState() {
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: getBody(),
      ),
    );
  }

  Widget getTopLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        children: [
          Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.location_pin,
                  size: 14,
                  color: AppColor.primarycolor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'New York',
                  style: Styles.boldText(textColor: AppColor.color363636),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 12,
                  color: AppColor.color363636,
                )
              ],
            ),
            decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(15)),
          ),
          const Spacer(),
          Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.filter_alt,
                  size: 14,
                  color: AppColor.primarycolor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Filter',
                  style: Styles.boldText(textColor: AppColor.color363636),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(15)),
          )
        ],
      ),
    );
  }

  Widget getBody() {
    return Column(
      children: [getTopLayout(), getSwipeCards()],
    );
  }

  Widget getSwipeCards() {
    return Expanded(
      child: SwipeCards(
        matchEngine: _matchEngine!,
        onStackFinished: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Stack Finished"),
            duration: Duration(milliseconds: 500),
          ));
        },
        itemChanged: (SwipeItem item, int index) {},
        upSwipeAllowed: true,
        itemBuilder: (BuildContext context, int index) {
          ExploreData item = _swipeItems[index].content as ExploreData;
          return rowItem(item);
        },
      ),
    );
  }

  Widget rowItem(ExploreData exploreDataList) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColor.whiteColor),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    exploreDataList.image!,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 2.2,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 150,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.favorite,
                      size: 15,
                      color: AppColor.whiteColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '87% Matches!',
                      style: Styles.boldText(textColor: AppColor.whiteColor),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(1.0, 0.0),
                    // 10% of the width, so there are ten blinds.
                    colors: <Color>[
                      AppColor.accentColor,
                      AppColor.primarycolor
                    ], // red to yellow
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                exploreDataList.name ?? '',
                style: Styles.blackText(size: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${exploreDataList.description}',
                textAlign: TextAlign.center,
                style: Styles.lightText(size: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              bottomLayout(),
              const SizedBox(
                height: 10,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget bottomLayout() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImagePath.IC_START_IMAGE, height: 60, width: 60),
          InkWell(
              onTap: () {
                _matchEngine!.currentItem!.like();
              },
              child: Image.asset(ImagePath.IC_ACCEPT_IMAGE,
                  height: 80, width: 80)),
          InkWell(
              onTap: () {
                _matchEngine!.currentItem!.nope();
              },
              child: Image.asset(ImagePath.IC_REJECT_IMAGE,
                  height: 80, width: 80)),
          Image.asset(ImagePath.IC_INSTANT_IMAGE, height: 60, width: 60)
        ],
      ),
    );
  }
}
