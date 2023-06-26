import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/utile/index.dart';

class BasicInfo extends StatelessWidget {
  const BasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: vww(context, 6),
            right: vww(context, 6),
            bottom: 30),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 17),
                child: Text("プロフィール",
                    style: TextStyle(fontSize: 16, color: PRIMARY_FONT_COLOR))),
            Padding(
                padding: EdgeInsets.only(
                  bottom: 15,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "身長",
                        style:
                            TextStyle(fontSize: 14, color: PRIMARY_FONT_COLOR),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "162cm",
                        style:
                            TextStyle(fontSize: 14, color: Color.fromARGB(255, 155, 155, 155)),
                      ),
                    )
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                  bottom: 15,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "体型",
                        style:
                            TextStyle(fontSize: 14, color: PRIMARY_FONT_COLOR),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "普通",
                        style:
                            TextStyle(fontSize: 14, color: Color.fromARGB(255, 155, 155, 155)),
                      ),
                    )
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                  bottom: 15,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "血液型",
                        style:
                            TextStyle(fontSize: 14, color: PRIMARY_FONT_COLOR),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "B型",
                        style:
                            TextStyle(fontSize: 14, color: Color.fromARGB(255, 155, 155, 155)),
                      ),
                    )
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                  bottom: 15,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "利用目的",
                        style:
                            TextStyle(fontSize: 14, color: PRIMARY_FONT_COLOR),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "真剣",
                        style:
                            TextStyle(fontSize: 14, color: Color.fromARGB(255, 155, 155, 155)),
                      ),
                    )
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                  bottom: 15,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "年収",
                        style:
                            TextStyle(fontSize: 14, color: PRIMARY_FONT_COLOR),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "200万円〜400万円",
                        style:
                            TextStyle(fontSize: 14, color: Color.fromARGB(255, 155, 155, 155)),
                      ),
                    )
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                  bottom: 15,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "タバコ",
                        style:
                            TextStyle(fontSize: 14, color: PRIMARY_FONT_COLOR),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "吸わない",
                        style:
                            TextStyle(fontSize: 14, color: Color.fromARGB(255, 155, 155, 155)),
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}
