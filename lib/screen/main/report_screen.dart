// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/Header.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/utile/index.dart';

// ignore: use_key_in_widget_constructors
class ReportScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const HeaderWidget(title: "違反報告"),
            Padding(
                padding: EdgeInsets.only(top: vhh(context, 8)),
                child: const Text("下記のユーザーを違反報告しますか？",
                    style: TextStyle(fontSize: 14, color: PRIMARY_FONT_COLOR))),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                      image: AssetImage("assets/images/users/user.png"),
                      height: 120,
                      width: 120,
                    ))),
            const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text("TestNameA",
                    style: TextStyle(fontSize: 16, color: PRIMARY_FONT_COLOR))),
            const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text("東京都　27歳",
                    style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 151, 157, 170)))),
            Padding(
                padding: EdgeInsets.only(top: vhh(context, 8)),
                child: const Text("報告後に運営サポートにより\nユーザー調査を行います",
                    style: TextStyle(fontSize: 14, color: PRIMARY_FONT_COLOR))),
            Expanded(child: Container()),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: vww(context, 5)),
                child: RadiusButton(
                    isDisabled: false,
                    text: "通報する",
                    color: BUTTON_MAIN,
                    goNavigation: (id) {},
                    id: 0)),
            Expanded(child: Container()),
          ],
        ));
  }
}
