import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/Header.dart';
import 'package:matching_app/screen/main/layouts/basic_info.dart';
import 'package:matching_app/screen/main/layouts/bottom_nav_bar.dart';
import 'package:matching_app/screen/main/layouts/introduction_widget.dart';
import 'package:matching_app/screen/main/layouts/introductory_badge_widget.dart';
import 'package:matching_app/screen/main/layouts/my_community_widget.dart';
import 'package:matching_app/screen/main/layouts/following_widget.dart';
import 'package:matching_app/screen/main/layouts/profile_main_info.dart';
import 'package:matching_app/screen/main/layouts/settings_widget.dart';
import 'package:matching_app/utile/index.dart';

// ignore: use_key_in_widget_constructors
class ProfileScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<dynamic> items = [];
  List<BadgeObject> badgeList = [];

  bool isModalShow = false;

  @override
  void initState() {
    super.initState();
    items = [
      CommunityObject(1, "サッカー", false, 0, "sports"),
      CommunityObject(2, "野球", false, 0, "sports"),
      CommunityObject(8, "映画", false, 0, "game"),
      CommunityObject(11, "キャンプ", false, 0, "outdoor"),
    ];
    badgeList = [
      BadgeObject("とにかく話したい", false, 1),
      BadgeObject("いつでも", false, 2),
      BadgeObject("鉄板焼き", false, 3),
    ];
  }

  final int _currentIndex = 4;
  @override
  Widget build(BuildContext context) {
    Object? state = ModalRoute.of(context)!.settings.arguments;

    if (state == true) {
      // final AlertDialog dialog = AlertDialog(
      //     contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      //     titlePadding: EdgeInsets.zero,
      //     insetPadding: EdgeInsets.zero,
      //     actionsPadding: EdgeInsets.zero,
      //     actions: [
      //       Container(
      //           padding: const EdgeInsets.only(
      //               top: 10, bottom: 40, left: 40, right: 40),
      //           width: double.infinity,
      //           child: ElevatedButton(
      //             style: ElevatedButton.styleFrom(
      //                 disabledForegroundColor: Colors.white,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(50.0),
      //                 ),
      //                 textStyle: const TextStyle(fontSize: 15),
      //                 padding: const EdgeInsets.symmetric(
      //                     horizontal: 0, vertical: 13),
      //                 backgroundColor: BUTTON_MAIN),
      //             onPressed: () {
      //               Navigator.pushNamed(context, "/self_introduction");
      //             },
      //             child: const Text('つぎへ'),
      //           ))
      //     ],
      //     shape: roundedRectangleBorder,
      //     content: Container(
      //         height: 300,
      //         padding: const EdgeInsets.only(
      //             top: 30, bottom: 20, left: 20, right: 20),
      //         child: const Column(
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text(
      //               "自己紹介文を記入して\n魅力的なプロフィールにしてみましょう",
      //               textAlign: TextAlign.center,
      //               style: TextStyle(
      //                   color: PRIMARY_FONT_COLOR,
      //                   fontSize: 18,
      //                   letterSpacing: -2),
      //             ),
      //             Image(
      //                 image: AssetImage("assets/images/main/tutorial.png"),
      //                 height: 160)
      //           ],
      //         )));
      // Future.delayed(const Duration(milliseconds: 1000), () {
      //   showDialog(context: context, builder: (context) => dialog);
      // });
    }
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
                      padding: EdgeInsets.symmetric(vertical: vww(context, 2)),
                      child: const HeaderWidget(title: "マイページ"),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: vhh(context, 2),
                            horizontal: vww(context, 6)),
                        child: const ProfileMainInfo()),
                    const FolloingWidget(),
                    state == false
                        ? Container()
                        : TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, "/identity_verify");
                            },
                            child: Padding(
                                padding: EdgeInsets.all(vww(context, 4)),
                                child: const Image(
                                    image: AssetImage(
                                        "assets/images/main/set-introduction.png")))),
                    const SettingsWidget(),
                    MyCommunityWidget(communityObjects: items),
                    IntroductionWidget(),
                    IntroductoryBadgeWidget(badges: badgeList),
                    const BasicInfo(),
                  ]);
            }, childCount: 1)),
          ],
        ),
        bottomNavigationBar: BottomNavBar(currentIndex: _currentIndex));
  }
}
