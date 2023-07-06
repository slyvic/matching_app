// ignore_for_file: unused_local_variable
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/screen/main/layouts/basic_info.dart';
import 'package:matching_app/screen/main/layouts/introduction_widget.dart';
import 'package:matching_app/screen/main/layouts/introductory_badge_widget.dart';
import 'package:matching_app/screen/main/layouts/my_community_widget.dart';
import 'package:matching_app/screen/main/layouts/unidentified_modal.dart';
import 'package:matching_app/utile/index.dart';

// ignore: use_key_in_widget_constructors
class UsersProfileChatScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _UsersProfileChatScreenState createState() => _UsersProfileChatScreenState();
}

class _UsersProfileChatScreenState extends State<UsersProfileChatScreen> {
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
        body: Stack(
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            SizedBox(
                              height: vhh(context, 49),
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
                                            bottomLeft: Radius.circular(
                                                vww(context, 10)),
                                            bottomRight: Radius.circular(
                                                vww(context, 10))),
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
                                            bottomLeft: Radius.circular(
                                                vww(context, 10)),
                                            bottomRight: Radius.circular(
                                                vww(context, 10))),
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
                                      height: vhh(context, 46),
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
                                  color:
                                      const Color.fromARGB(255, 131, 131, 131),
                                  height: 10,
                                  width: 10,
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 30,
                                    left: vww(context, 4),
                                    right: vww(context, 4)),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          width: 45,
                                          height: 45,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: const Color.fromARGB(
                                                50, 255, 255, 255),
                                          ),
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ButtonStyle(
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.zero),
                                            ),
                                            child: const Icon(Icons.close,
                                                color: Colors.white),
                                          )),
                                      Container(
                                          width: 45,
                                          height: 45,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: const Color.fromARGB(
                                                100, 0, 0, 0),
                                          ),
                                          child: TextButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                padding:
                                                    MaterialStateProperty.all(
                                                        EdgeInsets.zero),
                                              ),
                                              child: const Icon(
                                                  Icons.more_horiz,
                                                  color: Colors.white)))
                                    ]))
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: vhh(context, 2),
                                horizontal: vww(context, 6)),
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Column(children: [
                                  const Row(children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 5, bottom: 5, right: 20),
                                        child: Text("TSUBASA",
                                            style: TextStyle(fontSize: 17))),
                                    Image(
                                        image: AssetImage(
                                            "assets/images/status/on.png"),
                                        width: 20),
                                    Padding(
                                        padding: EdgeInsets.only(right: 50),
                                        child: Text(" 本人確認済み",
                                            style: TextStyle(fontSize: 12))),
                                  ]),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
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
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 193, 192, 201),
                            width: 0.5)),
                    color: Color.fromARGB(255, 230, 231, 234)),
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                constraints: BoxConstraints(
                  minHeight: 50,
                  maxHeight: vhh(context, 30),
                ),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 1),
                            child: IconButton(
                              icon: const Icon(Icons.camera_alt_rounded),
                              onPressed: () {},
                              color: const Color.fromARGB(255, 193, 192, 201),
                            )),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => UnidentifiedModal());
                        },
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "メッセージを入力",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 193, 192, 201)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 193, 192, 201))),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 193, 192, 201)),
                          ),
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                    )),
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {},
                        color: BUTTON_MAIN,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
