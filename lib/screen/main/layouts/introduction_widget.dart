import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/utile/index.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: vww(context, 6), right: vww(context, 6), bottom: vhh(context, 3)),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("自己紹介",
                    style: TextStyle(fontSize: 16, color: PRIMARY_FONT_COLOR))),
            Text(
                "私は、日本に住んでいる男性です。初めてアプリを利用しました。\n好きなことは登山と釣りをすることです。\n休日はよくキャンプに出かけます。いつもは一人ですが、いい人がいたら一緒に行きたいです。",
                style: TextStyle(fontSize: 13, color: PRIMARY_FONT_COLOR)),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                child: Text("もっとみる", style: TextStyle(fontSize: 11, color: BUTTON_MAIN),),
              ),
            )
          ],
        ));
  }
}
