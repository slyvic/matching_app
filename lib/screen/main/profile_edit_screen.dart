import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/edit_avatar_widget.dart';
import 'package:matching_app/components/profile_info_item.dart';
import 'package:matching_app/screen/main/layouts/introduction_widget.dart';
import 'package:matching_app/utile/index.dart';
import 'layouts/profile_edit_header.dart';

// ignore: use_key_in_widget_constructors
class ProfileEditScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  List<dynamic> items = [];
  List<BadgeObject> badgeList = [];
  List<bool> baseInfo = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  void initState() {
    super.initState();
    items = [
      "assets/images/users/user.png",
      "",
      "",
      "",
      "",
      "",
    ];
    badgeList = [
      BadgeObject("とにかく話したい", false, 1),
      BadgeObject("いつでも", false, 2),
      BadgeObject("鉄板焼き", false, 3),
    ];
  }

  void initStateItems() {
    setState(() {
      baseInfo = [
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false
      ];
    });
  }

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
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      child: ProfileEditHeader(title: "プロフィール"),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: vhh(context, 3)),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: double.infinity - 20,
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: vww(context, 6)),
                                            child: Wrap(
                                                spacing: 8,
                                                runSpacing: 15,
                                                alignment:
                                                    WrapAlignment.spaceBetween,
                                                children: List.generate(
                                                  items.length,
                                                  (index) {
                                                    return EditAvatarWidget(
                                                        item: items[index]);
                                                  },
                                                )))),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, "/self_introduction");
                                        },
                                        child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 30),
                                            child: IntroductionWidget(
                                                isEditScreen: true))),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: vww(context, 6)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 17),
                                              child: Text("プロフィール",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color:
                                                          PRIMARY_FONT_COLOR))),
                                          ProfileInfoItem(
                                              title: "ニックネーム",
                                              value: "TSUBASA",
                                              onPressed: (state) {
                                                Navigator.pushNamed(
                                                    context, "/nick_name_edit");
                                              },
                                              isShowWheel: false),
                                          ProfileInfoItem(
                                              onPressed: (state) {
                                                initStateItems();
                                                setState(() {
                                                  baseInfo[0] = state;
                                                });
                                              },
                                              title: "居住地",
                                              value: "東京都",
                                              isShowWheel: baseInfo[0]),
                                          ProfileInfoItem(
                                              onPressed: (state) {
                                                initStateItems();
                                                setState(() {
                                                  baseInfo[1] = state;
                                                });
                                              },
                                              title: "身長",
                                              value: "162cm",
                                              isShowWheel: baseInfo[1]),
                                          ProfileInfoItem(
                                              onPressed: (state) {
                                                initStateItems();
                                                setState(() {
                                                  baseInfo[2] = state;
                                                });
                                              },
                                              title: "体型",
                                              value: "普通",
                                              isShowWheel: baseInfo[2]),
                                          ProfileInfoItem(
                                              onPressed: (state) {
                                                initStateItems();
                                                setState(() {
                                                  baseInfo[3] = state;
                                                });
                                              },
                                              title: "血液型",
                                              value: "",
                                              isShowWheel: baseInfo[3]),
                                          ProfileInfoItem(
                                              onPressed: (state) {
                                                initStateItems();
                                                setState(() {
                                                  baseInfo[4] = state;
                                                });
                                              },
                                              title: "学歴",
                                              value: "",
                                              isShowWheel: baseInfo[4]),
                                          ProfileInfoItem(
                                              onPressed: (state) {
                                                initStateItems();
                                                setState(() {
                                                  baseInfo[5] = state;
                                                });
                                              },
                                              title: "利用目的",
                                              value: "真剣",
                                              isShowWheel: baseInfo[5]),
                                          ProfileInfoItem(
                                              onPressed: (state) {
                                                initStateItems();
                                                setState(() {
                                                  baseInfo[6] = state;
                                                });
                                              },
                                              title: "年収",
                                              value: "",
                                              isShowWheel: baseInfo[6]),
                                          ProfileInfoItem(
                                              onPressed: (state) {
                                                initStateItems();
                                                setState(() {
                                                  baseInfo[7] = state;
                                                });
                                              },
                                              title: "休日",
                                              value: "",
                                              isShowWheel: baseInfo[7]),
                                          ProfileInfoItem(
                                              onPressed: (state) {
                                                initStateItems();
                                                setState(() {
                                                  baseInfo[8] = state;
                                                });
                                              },
                                              title: "タバコ",
                                              value: "",
                                              isShowWheel: baseInfo[8]),
                                          ProfileInfoItem(
                                              onPressed: (state) {
                                                initStateItems();
                                                setState(() {
                                                  baseInfo[9] = state;
                                                });
                                              },
                                              title: "お酒",
                                              value: "",
                                              isShowWheel: baseInfo[9]),
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 20, bottom: 5),
                                              child: Text(
                                                "紹介バッジ",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: PRIMARY_FONT_COLOR),
                                              )),
                                          Wrap(
                                              spacing: 8,
                                              runSpacing: -8,
                                              children: badgeList
                                                  .map((BadgeObject e) {
                                                String textColor = e.color == 1
                                                    ? "#00CA9D"
                                                    : e.color == 2
                                                        ? "#FCBC2C"
                                                        : e.color == 3
                                                            ? "#FC7C2C"
                                                            : "#20B07E";
                                                if (e.color == 0) {
                                                  return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20),
                                                      child: Container());
                                                }
                                                return FilterChip(
                                                  label: Text(e.title,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: e.isChecked
                                                              ? Colors.white
                                                              : Color(int.parse(
                                                                      textColor
                                                                          .substring(
                                                                              1,
                                                                              7),
                                                                      radix:
                                                                          16) +
                                                                  0xFF000000))),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    side: BorderSide(
                                                        color: Color(int.parse(
                                                                textColor
                                                                    .substring(
                                                                        1, 7),
                                                                radix: 16) +
                                                            0xFF000000),
                                                        width: 1.0),
                                                  ),
                                                  clipBehavior: Clip.antiAlias,
                                                  backgroundColor: e.isChecked
                                                      ? Color(int.parse(
                                                              textColor
                                                                  .substring(
                                                                      1, 7),
                                                              radix: 16) +
                                                          0xFF000000)
                                                      : Color(int.parse(
                                                              textColor
                                                                  .substring(
                                                                      1, 7),
                                                              radix: 16) +
                                                          0x33000000),
                                                  selectedColor: Color(
                                                      int.parse(
                                                              textColor
                                                                  .substring(
                                                                      1, 7),
                                                              radix: 16) +
                                                          0xFF000000),
                                                  onSelected: (bool value) {},
                                                );
                                              }).toList()),
                                          Align(
                                              alignment: Alignment.bottomRight,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.pushNamed(context,
                                                      '/profile_badge_screen');
                                                },
                                                child: const Text(
                                                  "編集",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromARGB(
                                                          255, 193, 192, 201)),
                                                ),
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ))))
                  ]);
            }, childCount: 1)),
          ],
        ));
  }
}
