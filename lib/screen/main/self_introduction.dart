import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/screen/main/layouts/profile_header.dart';
import 'package:matching_app/utile/index.dart';

class SelfIntroducion extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SelfIntroducion createState() => _SelfIntroducion();
}


class _SelfIntroducion extends State<SelfIntroducion> {
  String self_introduction = "";

  final RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  );

  @override
  Widget build(BuildContext context) {
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
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromARGB(255, 112, 112, 112),
                                width: 1)),
                      ),
                      child: ProfileHeader(
                          title: "自己紹介入力",
                          onPressed: () {
                            if (self_introduction.isNotEmpty) {
                              Navigator.pushNamed(
                                  context, "/profile_screen", arguments: false);
                            } else {
                              showOkAlertDialog(context, "ちょっとでも\n文章を入力してみよう");
                            }
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: vww(context, 3),
                          vertical: vhh(context, 1)),
                      child: TextField(
                          minLines: 3,
                          maxLines: 10,
                          style: const TextStyle(
                              fontSize: 16, color: PRIMARY_FONT_COLOR),
                          cursorColor: BUTTON_MAIN,
                          autofocus: true,
                          onChanged: (value) {
                            setState(() {
                              self_introduction = value;
                            });
                          },
                          decoration: InputDecoration(
                              hintText: "簡単な挨拶や趣味、休日の過ごし方、お相手の希望などを書いてみましょう。",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)))),
                    )
                  ]);
            }, childCount: 1)),
          ],
        ));
  }

  Future<void> showOkAlertDialog(BuildContext context, String title) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          shape: roundedRectangleBorder,
          title: Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, 112, 112, 112),
                        width: 1))),
              child: Text(title,
                  style: const TextStyle(fontSize: 18, color: PRIMARY_FONT_COLOR), textAlign: TextAlign.center)),
          actions: <Widget>[
            Container(
              width: double.infinity,
              child: TextButton(
                child: const Text(
                  'OK',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        );
      },
    );
  }
}
