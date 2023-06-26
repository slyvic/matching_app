// ignore_for_file: unused_local_variable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/main_community_widget.dart';
import 'package:matching_app/screen/main/layouts/bottom_nav_bar.dart';
import 'package:matching_app/screen/main/layouts/community_bottom_modal.dart';
import 'package:matching_app/utile/index.dart';

// ignore: use_key_in_widget_constructors
class CommunityScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  List<dynamic> items = [];
  List<BadgeObject> badgeList = [];

  bool isModalShow = false;

  @override
  void initState() {
    super.initState();
    items = <CommunityObject>[
      CommunityObject(0, "スポーツ", false, -1, "sports"),
      CommunityObject(1, "サッカー", false, 0, "sports"),
      CommunityObject(2, "野球", false, 0, "sports"),
      CommunityObject(3, "バスケ", false, 0, "sports"),
      CommunityObject(4, "テニス", false, 0, "sports"),
      CommunityObject(5, "卓球", false, 0, "sports"),
      CommunityObject(6, "ゴルフ", false, 0, "sports"),
      CommunityObject(0, "趣味", false, -1, "hobby"),
      CommunityObject(7, "音楽", false, 0, "hobby"),
      CommunityObject(8, "映画", false, 0, "hobby"),
      CommunityObject(9, "漫画", false, 0, "hobby"),
      CommunityObject(0, "アウトドア", false, -1, "outdoor"),
      CommunityObject(10, "旅行", false, 0, "outdoor"),
      CommunityObject(11, "キャンプ", false, 0, "outdoor"),
      CommunityObject(12, "登山", false, 0, "outdoor")
    ];
    badgeList = [
      BadgeObject("とにかく話したい", false, 1),
      BadgeObject("いつでも", false, 2),
      BadgeObject("鉄板焼き", false, 3),
    ];
  }

  int _currentIndex = 1;
  final RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  );
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: vhh(context, 8),
                            left: vww(context, 5),
                            right: vww(context, 5)),
                        child: const Text("コミュニティー",
                            style: TextStyle(fontSize: 21))),
                    Padding(
                        padding: EdgeInsets.only(
                            top: vhh(context, 3),
                            left: vww(context, 5),
                            right: vww(context, 5)),
                        child: const Image(
                            image: AssetImage(
                                "assets/images/main/community-1.png"))),
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: ListView(children: [
                        CarouselSlider(
                          items: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: vww(context, 10), top: 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/main/community-2.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right: vww(context, 10), top: 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/main/community-3.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                          options: CarouselOptions(
                              enableInfiniteScroll: true, height: 150),
                        ),
                      ]),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: vw(context, 2)),
                        child: Align(
                            child: Row(children: [
                          Expanded(
                              child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  alignment: WrapAlignment.center,
                                  children: List.generate(
                                    items.length,
                                    (index) {
                                      if (items[index].parent != -1) {
                                        return FractionallySizedBox(
                                            widthFactor: 0.3,
                                            child: TextButton(
                                              style: ButtonStyle(
                                                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                                              ),
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      context: context,
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              25),
                                                        ),
                                                      ),
                                                      builder: (context) {
                                                        return const CommunityBottomModal();
                                                      });
                                                },
                                                child: MainCommunityWidget(
                                                    isChecked:
                                                        items[index].isChecked,
                                                    label: items[index].label,
                                                    image:
                                                        "assets/images/community/c${(items[index].idx)}.png")));
                                      } else {
                                        return FractionallySizedBox(
                                            widthFactor: 1,
                                            child: Row(
                                              children: [
                                                Text(items[index].label),
                                                Image(
                                                  image: AssetImage(
                                                      "assets/images/community/${(items[index].category)}.png"),
                                                  width: 20,
                                                )
                                              ],
                                            ));
                                      }
                                    },
                                  )))
                        ])))
                  ]);
            }, childCount: 1)),
          ],
        ),
        bottomNavigationBar: BottomNavBar(currentIndex: _currentIndex));
  }
}
