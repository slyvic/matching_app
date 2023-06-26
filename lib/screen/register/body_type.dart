import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/check_button.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/components/Header.dart';
import 'package:matching_app/utile/index.dart';

// import 'package:flutter_redux/flutter_redux.dart';
// ignore: use_key_in_widget_constructors
class BodyType extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _BodyTypeState createState() => _BodyTypeState();
}

class _BodyTypeState extends State<BodyType> {
  List<bool> body_type = [false, false, false, false];
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
                Padding(
                    padding: EdgeInsets.only(
                        top: vh(context, 3),
                        left: getDeviceWidth(context) / 47 * 3,
                        right: getDeviceWidth(context) / 47 * 3),
                    child: const Text("体型を選択してください",
                        style: TextStyle(
                            fontSize: 24, color: PRIMARY_FONT_COLOR))),
                Padding(
                  padding: EdgeInsets.only(
                      top: vh(context, 1),
                      left: getDeviceWidth(context) / 47 * 3,
                      right: getDeviceWidth(context) / 47 * 3),
                  child: const Text(
                    "絞り込み検索で発見しやすくなります",
                    style: TextStyle(fontSize: 12, color: PRIMARY_FONT_COLOR),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: vh(context, 3),
                        left: getDeviceWidth(context) / 47 * 4,
                        right: getDeviceWidth(context) / 47 * 4),
                    child: Column(
                      children: [
                        InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                body_type = [false, false, false, false];
                                body_type[0] = true;
                              });
                            },
                            child: CheckButton(
                                fontColor: PRIMARY_FONT_COLOR,
                                text2: "細め",
                                fontSize: 17,
                                isChecked: body_type[0])),
                        InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                body_type = [false, false, false, false];
                                body_type[1] = true;
                              });
                            },
                            child: CheckButton(
                                fontColor: PRIMARY_FONT_COLOR,
                                text2: "普通",
                                fontSize: 17,
                                isChecked: body_type[1])),
                        InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                body_type = [false, false, false, false];
                                body_type[2] = true;
                              });
                            },
                            child: CheckButton(
                                fontColor: PRIMARY_FONT_COLOR,
                                text2: "がっちり",
                                fontSize: 17,
                                isChecked: body_type[2])),
                        InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                body_type = [false, false, false, false];
                                body_type[3] = true;
                              });
                            },
                            child: CheckButton(
                                fontColor: PRIMARY_FONT_COLOR,
                                text2: "太め",
                                fontSize: 17,
                                isChecked: body_type[3]))
                      ],
                    )),
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
                              Navigator.pushNamed(context, "/purpose_use");
                            },
                            isDisabled:
                                body_type.where((element) => element).isEmpty,
                          ),
                        ))),
                Expanded(
                  child: Container(),
                )
              ],
            )));
  }
}
