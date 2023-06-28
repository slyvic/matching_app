import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/utile/index.dart';

// ignore: must_be_immutable
class IntroductionWidget extends StatelessWidget {
  bool? isEditScreen = false;
  IntroductionWidget({super.key, this.isEditScreen});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: vhh(context, 3)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("自己紹介",
                    style: TextStyle(fontSize: 16, color: PRIMARY_FONT_COLOR))),
            const Text(
                "私は、日本に住んでいる男性です。初めてアプリを利用しました。\n好きなことは登山と釣りをすることです。\n休日はよくキャンプに出かけます。いつもは一人ですが、いい人がいたら一緒に行きたいです。",
                style: TextStyle(fontSize: 13, color: PRIMARY_FONT_COLOR)),
            isEditScreen == true ? Container() : const Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                child: Text("もっとみる", style: TextStyle(fontSize: 11, color: BUTTON_MAIN),),
              ),
            )
          ],
        ));
  }
}
