// ignore_for_file: unused_local_variable
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/screen/main/layouts/basic_info.dart';
import 'package:matching_app/screen/main/layouts/introduction_widget.dart';
import 'package:matching_app/screen/main/layouts/introductory_badge_widget.dart';
import 'package:matching_app/screen/main/layouts/my_community_widget.dart';
import 'package:matching_app/screen/main/layouts/thumb_up_modal.dart';
import 'package:matching_app/utile/index.dart';

// ignore: use_key_in_widget_constructors
class LikeUserProfile extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LikeUserProfileState createState() => _LikeUserProfileState();
}

class _LikeUserProfileState extends State<LikeUserProfile> {
  List<dynamic> items = [];
  List<BadgeObject> badgeList = [];

  // ignore: unused_field
  late int _current = 0;
  bool isModalShow = false;

  @override
  void initState() {
    super.initState();
    items = [
      CommunityObject(1, "サッカー", false, 0, 1, ""),
      CommunityObject(2, "野球", false, 0, 1, ""),
      CommunityObject(8, "映画", false, 0, 2, ""),
      CommunityObject(11, "キャンプ", false, 0, 3, ""),
    ];
    badgeList = [
      BadgeObject("とにかく話したい", false, 1),
      BadgeObject("いつでも", false, 2),
      BadgeObject("鉄板焼き", false, 3),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Object? state = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: vhh(context, 55),
                        width: vww(context, 100),
                        child: ListView(children: [
                          CarouselSlider(
                            items: [
                              Container(
                                height: double.infinity,
                                width: double.infinity,
                                margin: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft:
                                          Radius.circular(vww(context, 10)),
                                      bottomRight:
                                          Radius.circular(vww(context, 10))),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/main/user1.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height: double.infinity,
                                width: double.infinity,
                                margin: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft:
                                          Radius.circular(vww(context, 10)),
                                      bottomRight:
                                          Radius.circular(vww(context, 10))),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/main/user1.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                            options: CarouselOptions(
                                enableInfiniteScroll: true,
                                height: vhh(context, 52),
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                },
                                viewportFraction: 1),
                          ),
                        ]),
                      ),
                      Positioned(
                          bottom: 30,
                          child: CarouselIndicator(
                            count: 2,
                            index: _current,
                            activeColor: BUTTON_MAIN,
                            color: const Color.fromARGB(255, 131, 131, 131),
                            height: 10,
                            width: 10,
                          )),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                                width: vww(context, 100),
                                height: vhh(context, 10),
                                alignment: Alignment.bottomCenter,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                  color: BUTTON_MAIN,
                                ),
                                child: const Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      "無料でいいね！",
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.white),
                                    ))),
                            Padding(
                                padding:
                                    EdgeInsets.only(right: vww(context, 3), top: vww(context, 3)),
                                child: Container(
                                    width: 45,
                                    height: 45,
                                    alignment: Alignment.centerRight,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: const Color.fromARGB(100, 0, 0, 0),
                                    ),
                                    child: TextButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.zero),
                                        ),
                                        child: const Icon(Icons.more_horiz,
                                            color: Colors.white))))
                          ])
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: vhh(context, 2),
                          horizontal: vww(context, 6)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Column(children: [
                            const Row(children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 5, bottom: 5, right: 20),
                                  child: Text("TSUBASA",
                                      style: TextStyle(fontSize: 17))),
                              Image(
                                  image:
                                      AssetImage("assets/images/status/on.png"),
                                  width: 20),
                              Padding(
                                  padding: EdgeInsets.only(right: 50),
                                  child: Text(" 本人確認済み",
                                      style: TextStyle(fontSize: 12))),
                            ]),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(children: [
                                  const Text("東京都",
                                      style: TextStyle(fontSize: 15)),
                                  Container(width: 20),
                                  const Text("25歳",
                                      style: TextStyle(fontSize: 15)),
                                ])),
                          ]))),
                  IntroductionWidget(),
                  MyCommunityWidget(communityObjects: items),
                  IntroductoryBadgeWidget(badges: badgeList),
                  const BasicInfo(),
                ]);
          }, childCount: 1)),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: vww(context, 60),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    child: const Icon(Icons.close,
                        color: Color.fromARGB(255, 193, 192, 201), size: 35),
                  )),
              Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => const ThumbUpModal());
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    child: const Icon(Icons.thumb_up,
                        color: BUTTON_MAIN, size: 35),
                  )),
            ]),
      ),
    );
  }
}
