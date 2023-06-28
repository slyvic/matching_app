import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/components/Header.dart';
import 'package:matching_app/utile/index.dart';

// import 'package:flutter_redux/flutter_redux.dart';
// ignore: use_key_in_widget_constructors
class ProfileBadgeSelect extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ProfileBadgeSelectState createState() => _ProfileBadgeSelectState();
}

class _ProfileBadgeSelectState extends State<ProfileBadgeSelect> {
  List<BadgeObject> selectedList = [
    BadgeObject("お相手に合わせる", true, 1),
    BadgeObject("いつでも", true, 2),
    BadgeObject("鉄板焼き", true, 3),
  ];
  List<BadgeObject> badgeList = [
    BadgeObject("とにかく話したい", false, 1),
    BadgeObject("メッセージ苦手", false, 1),
    BadgeObject("電話派", false, 1),
    BadgeObject("まずは会いたい", false, 1),
    BadgeObject("ビデオ電話派", false, 1),
    BadgeObject("ちょっとずつ", false, 1),
    BadgeObject("お相手に合わせる", false, 1),
    BadgeObject("", false, 0),
    BadgeObject("いつでも", false, 2),
    BadgeObject("夜会いたい", false, 2),
    BadgeObject("時間ある時に", false, 2),
    BadgeObject("お昼に会いたい", false, 2),
    BadgeObject("", false, 0),
    BadgeObject("鉄板焼き", false, 3),
    BadgeObject("お寿司", false, 3)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            constraints: BoxConstraints(
              minHeight: vh(context, 90), // Set the minimum height here
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: getDeviceWidth(context) / 47 * 1,
                      right: getDeviceWidth(context) / 47 * 1),
                  child: const HeaderWidget(title: "プロフィール登録"),
                ),
                Container(
                  width: vww(context, 100),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: vww(context, 6)),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(255, 218, 217, 226),
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: 
                 Wrap(
                        spacing: 8,
                        runSpacing: -8,
                        children: selectedList.map((BadgeObject e) {
                          String textColor = e.color == 1
                              ? "#00CA9D"
                              : e.color == 2
                                  ? "#FCBC2C"
                                  : e.color == 3
                                      ? "#FC7C2C"
                                      : "#20B07E";
                          if (e.color == 0) {
                            return Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container());
                          }
                          return FilterChip(
                              label: Text(e.title,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: e.isChecked
                                          ? Colors.white
                                          : Color(int.parse(
                                                  textColor.substring(1, 7),
                                                  radix: 16) +
                                              0xFF000000))),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                    color: Color(int.parse(
                                            textColor.substring(1, 7),
                                            radix: 16) +
                                        0xFF000000),
                                    width: 1.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              backgroundColor: e.isChecked
                                  ? Color(int.parse(textColor.substring(1, 7),
                                          radix: 16) +
                                      0xFF000000)
                                  : Color(int.parse(textColor.substring(1, 7),
                                          radix: 16) +
                                      0x33000000),
                              selectedColor: Color(
                                  int.parse(textColor.substring(1, 7), radix: 16) + 0xFF000000),
                              onSelected: (isSelected) {});
                        }).toList())
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: vw(context, 3), vertical: vh(context, 3)),
                    child: Wrap(
                        spacing: 8,
                        runSpacing: -8,
                        children: badgeList.map((BadgeObject e) {
                          String textColor = e.color == 1
                              ? "#00CA9D"
                              : e.color == 2
                                  ? "#FCBC2C"
                                  : e.color == 3
                                      ? "#FC7C2C"
                                      : "#20B07E";
                          if (e.color == 0) {
                            return Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container());
                          }
                          return FilterChip(
                              label: Text(e.title,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: e.isChecked
                                          ? Colors.white
                                          : Color(int.parse(
                                                  textColor.substring(1, 7),
                                                  radix: 16) +
                                              0xFF000000))),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                    color: Color(int.parse(
                                            textColor.substring(1, 7),
                                            radix: 16) +
                                        0xFF000000),
                                    width: 1.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              backgroundColor: e.isChecked
                                  ? Color(int.parse(textColor.substring(1, 7),
                                          radix: 16) +
                                      0xFF000000)
                                  : Color(int.parse(textColor.substring(1, 7),
                                          radix: 16) +
                                      0x33000000),
                              selectedColor: Color(
                                  int.parse(textColor.substring(1, 7), radix: 16) + 0xFF000000),
                              onSelected: (isSelected) => selectBadge(e));
                        }).toList())),
                Expanded(
                  child: Container(),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getDeviceWidth(context) / 47 * 3),
                    child: SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: RadiusButton(
                            id: 0,
                            color: BUTTON_MAIN,
                            text: "つぎへ",
                            goNavigation: (id) {
                              Navigator.pushNamed(context, "/profile_screen");
                            },
                            isDisabled: false,
                          ),
                        ))),
                Expanded(
                  child: Container(),
                )
              ],
            )));
  }

  void selectBadge(e) {
    // if (!e.isChecked) {
    //   selectedList.add(e);
    //   if (selectedList.length > 5) {
    //     setState(() {
    //       badgeList
    //           .where((element) => element == selectedList.elementAt(0))
    //           .first
    //           .isChecked = false;
    //     });
    //     selectedList.removeAt(0);
    //   }
    // } else {
    //   selectedList.remove(e);
    // }
    setState(() {
      e.isChecked = !e.isChecked;
    });
  }
}
