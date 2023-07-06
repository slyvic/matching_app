import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_app/bloc/cubit.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/components/Header.dart';
import 'package:matching_app/utile/index.dart';

// import 'package:flutter_redux/flutter_redux.dart';
// ignore: use_key_in_widget_constructors
class BadgeSelect extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _BadgeSelectState createState() => _BadgeSelectState();
}

class _BadgeSelectState extends State<BadgeSelect> {
  List<BadgeObject> selectedList = [];
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
  void initState() {
    super.initState();
    BlocProvider.of<AppCubit>(context).fetchBadgeList();
  }
  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
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
                Padding(
                    padding: EdgeInsets.only(
                        top: vh(context, 3),
                        left: getDeviceWidth(context) / 47 * 3,
                        right: getDeviceWidth(context) / 47 * 3),
                    child: const Text("あなたをあらわすバッジを3つ選んでみましょう",
                        style: TextStyle(
                            fontSize: 24, color: PRIMARY_FONT_COLOR))),
                Padding(
                  padding: EdgeInsets.only(
                      top: vh(context, 1),
                      left: getDeviceWidth(context) / 47 * 3,
                      right: getDeviceWidth(context) / 47 * 3),
                  child: const Text(
                    "バッジを設定することで、同じバッジを設定しているお相手\nとマッチングしやすくなります。",
                    style: TextStyle(fontSize: 12, color: PRIMARY_FONT_COLOR),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: vw(context, 3), vertical: vh(context, 5)),
                    child: Wrap(
                        spacing: 8,
                        runSpacing: -8,
                        children: List.generate(
                                            appCubit.badgeList.length,
                                            (index) {
                          if (appCubit.badgeList[index].id == -1) {
                            return Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container());
                          }
                          return FilterChip(
                              label: Text(appCubit.badgeList[index].title,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: appCubit.badgeList[index].isChecked
                                          ? Colors.white
                                          : Color(int.parse(
                                                  appCubit.badgeList[index].color.substring(1, 7),
                                                  radix: 16) +
                                              0xFF000000))),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                    color: Color(int.parse(
                                            appCubit.badgeList[index].color.substring(1, 7),
                                            radix: 16) +
                                        0xFF000000),
                                    width: 1.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              backgroundColor: appCubit.badgeList[index].isChecked
                                  ? Color(int.parse(appCubit.badgeList[index].color.substring(1, 7),
                                          radix: 16) +
                                      0xFF000000)
                                  : Color(int.parse(appCubit.badgeList[index].color.substring(1, 7),
                                          radix: 16) +
                                      0x33000000),
                              selectedColor: Color(
                                  int.parse(appCubit.badgeList[index].color.substring(1, 7), radix: 16) + 0xFF000000),
                              onSelected: (isSelected) => appCubit.changeBadge(index));
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
                              Navigator.pushNamed(context, "/profile_image");
                            },
                            isDisabled: appCubit.selectedBadgeList.length < 3,
                          ),
                        ))),
                Expanded(
                  child: Container(),
                )
              ],
            )));
    });
  }
}
