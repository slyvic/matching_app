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
                      height: 80,
                      width: 80,
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
                padding: EdgeInsets.only(left: vww(context, 5), right: vww(context, 5), bottom: vhh(context, 10)),
                child: RadiusButton(
                    isDisabled: false,
                    text: "通報する",
                    color: BUTTON_MAIN,
                    goNavigation: (id) {
                      Navigator.pushNamed(context, "/report_success");
                    },
                    id: 0)),
          ],
        ));
  }
}
