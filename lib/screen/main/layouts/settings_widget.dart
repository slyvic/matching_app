import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/utile/index.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: vhh(context, 1), horizontal: vww(context, 6)),
        child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 8,
                  offset: const Offset(0, 6))
            ], borderRadius: BorderRadius.circular(10)),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 17, horizontal: 15),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromARGB(255, 245, 245, 245),
                              width: 1.5,
                            ),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/like_user_profile');
                          },
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Image(
                                            image: AssetImage(
                                                "assets/images/icons/like.png"),
                                            width: 30)),
                                    Text("本日のおすすめ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: PRIMARY_FONT_COLOR))
                                  ],
                                ),
                                Icon(Icons.keyboard_arrow_right,
                                    size: 20,
                                    color: Color.fromARGB(255, 194, 196, 202))
                              ]),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 17, horizontal: 15),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromARGB(255, 245, 245, 245),
                              width: 1.5,
                            ),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/user_list_screen');
                          },
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Image(
                                            image: AssetImage(
                                                "assets/images/icons/view.png"),
                                            width: 30)),
                                    Text("足跡",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: PRIMARY_FONT_COLOR))
                                  ],
                                ),
                                Icon(Icons.keyboard_arrow_right,
                                    size: 20,
                                    color: Color.fromARGB(255, 194, 196, 202))
                              ]),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 17, horizontal: 15),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromARGB(255, 245, 245, 245),
                              width: 1.5,
                            ),
                          ),
                        ),
                        child: const InkWell(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Image(
                                            image: AssetImage(
                                                "assets/images/icons/plan.png"),
                                            width: 30)),
                                    Text("加入中プラン",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: PRIMARY_FONT_COLOR))
                                  ],
                                ),
                                Text("2023/08/15",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 194, 196, 202)))
                              ]),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 17, horizontal: 15),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromARGB(255, 245, 245, 245),
                              width: 1.5,
                            ),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/setting_screen');
                          },
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Image(
                                            image: AssetImage(
                                                "assets/images/icons/setting.png"),
                                            width: 30)),
                                    Text("設定",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: PRIMARY_FONT_COLOR))
                                  ],
                                ),
                                Icon(Icons.keyboard_arrow_right,
                                    size: 20,
                                    color: Color.fromARGB(255, 194, 196, 202))
                              ]),
                        ))
                  ],
                ))));
  }
}
