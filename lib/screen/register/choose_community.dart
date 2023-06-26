import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/community_widget.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/components/Header.dart';
import 'package:matching_app/utile/index.dart';

// import 'package:flutter_redux/flutter_redux.dart';
// ignore: use_key_in_widget_constructors
class ChooseCommunity extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ChooseCommunityState createState() => _ChooseCommunityState();
}

class _ChooseCommunityState extends State<ChooseCommunity> {
  List<CommunityObject> items = <CommunityObject>[
    CommunityObject(0, "スポーツ", false, -1, "sports"),
    CommunityObject(1, "サッカー", false, 0, "sports"),
    CommunityObject(2, "野球", false, 0, "sports"),
    CommunityObject(3, "バスケ", false, 0, "sports"),
    CommunityObject(4, "テニス", false, 0, "sports"),
    CommunityObject(5, "卓球", false, 0, "sports"),
    CommunityObject(6, "ゴルフ", false, 0, "sports"),
    CommunityObject(0, "趣味", false, -1, "hobby"),
    CommunityObject(7, "音楽", false, 0, "hobby"),
    CommunityObject(8, "映画", false, 0, "hobby"),
    CommunityObject(9, "漫画", false, 0, "hobby"),
    CommunityObject(0, "アウトドア", false, -1, "outdoor"),
    CommunityObject(10, "旅行", false, 0, "outdoor"),
    CommunityObject(11, "キャンプ", false, 0, "outdoor"),
    CommunityObject(12, "登山", false, 0, "outdoor")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                  height: vh(context, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: getDeviceWidth(context) / 47 * 1,
                            right: getDeviceWidth(context) / 47 * 1),
                        child: const HeaderWidget(title: "プロフィール登録"),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              top: vh(context, 3),
                              left: getDeviceWidth(context) / 47 * 3,
                              right: getDeviceWidth(context) / 47 * 3),
                          child: const Text("興味のあるコミュニティーを",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: PRIMARY_FONT_COLOR,
                                  letterSpacing: -2))),
                      Padding(
                          padding: EdgeInsets.only(
                              top: vh(context, 4),
                              left: getDeviceWidth(context) / 47 * 3,
                              right: getDeviceWidth(context) / 47 * 3),
                          child: const Text("同じコミュニティに所属する気の合う人が見つかります",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: PRIMARY_FONT_COLOR,
                                  letterSpacing: -2))),
                    ],
                  ))),
          Padding(
              padding: EdgeInsets.only(bottom: vh(context, 10)),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      height: vh(context, 70),
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: vw(context, 2)),
                              child: Align(
                                  child: Row(children: [
                                Expanded(
                                    child: Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        alignment: WrapAlignment.center,
                                        children: List.generate(
                                          items.length,
                                          (index) {
                                            if (items[index].parent != -1) {
                                              return FractionallySizedBox(
                                                  widthFactor: 0.3,
                                                  child: InkWell(
                                                      onTap: () {
                                                        if (items[index]
                                                                    .isChecked ==
                                                                false &&
                                                            items
                                                                    .where((element) =>
                                                                        element
                                                                            .isChecked)
                                                                    .length <
                                                                3) {
                                                          setState(() {
                                                            items[index]
                                                                    .isChecked =
                                                                !items[index]
                                                                    .isChecked;
                                                          });
                                                        } else if (items[index]
                                                                .isChecked ==
                                                            true) {
                                                          setState(() {
                                                            items[index]
                                                                    .isChecked =
                                                                !items[index]
                                                                    .isChecked;
                                                          });
                                                        }
                                                      },
                                                      child: CommunityWidget(
                                                          isChecked:
                                                              items[index]
                                                                  .isChecked,
                                                          label: items[index]
                                                              .label,
                                                          image:
                                                              "assets/images/community/c${(items[index].idx)}.png")));
                                            } else {
                                              return FractionallySizedBox(
                                                  widthFactor: 1,
                                                  child: Row(
                                                    children: [
                                                      Text(items[index].label),
                                                      Image(
                                                          image: AssetImage(
                                                              "assets/images/community/${(items[index].category)}.png"), width: 20,)
                                                    ],
                                                  ));
                                            }
                                          },
                                        )))
                              ]))))))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: SizedBox(
                    height: vh(context, 10),
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RadiusButton(
                          id: 0,
                          color: BUTTON_MAIN,
                          text: "つぎへ",
                          goNavigation: (id) {
                            Navigator.pushNamed(context, "/height_select");
                          },
                          isDisabled: items
                              .where((element) => element.isChecked == true)
                              .isEmpty),
                    )),
              ))
        ]));
  }
}
