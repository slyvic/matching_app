// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/Header.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/utile/index.dart';

// ignore: use_key_in_widget_constructors
class ReportSuccess extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ReportSuccessState createState() => _ReportSuccessState();
}

class _ReportSuccessState extends State<ReportSuccess> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const HeaderWidget(title: "違反報告"),
            Expanded(child: Container()),
            const Image(
                      image: AssetImage("assets/images/main/thumb_up.png"),
                      height: 80,
                      width: 80,
                    ),
            const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 100),
                child: Text("通報を受け付けました",
                    style: TextStyle(fontSize: 14, color: PRIMARY_FONT_COLOR))),
            Expanded(child: Container()),
            Padding(
                padding: EdgeInsets.only(left: vww(context, 5), right: vww(context, 5), bottom: vhh(context, 10)),
                child: RadiusButton(
                    isDisabled: false,
                    text: "通報する",
                    color: BUTTON_MAIN,
                    goNavigation: (id) {
                      Navigator.pushNamed(context, "/chat_screen");
                    },
                    id: 0)),
          ],
        ));
  }
}
