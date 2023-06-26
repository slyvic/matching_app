import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/check_input.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/components/Header.dart';
import 'package:matching_app/utile/index.dart';
// import 'package:flutter_redux/flutter_redux.dart';

// ignore: use_key_in_widget_constructors
class NickName extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _NickNameState createState() => _NickNameState();
}

class _NickNameState extends State<NickName> {
  String nick_name = '';

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
                    child: const Text("ニックネームを教えてください",
                        style: TextStyle(
                            letterSpacing: -1.5,
                            fontSize: 24,
                            color: PRIMARY_FONT_COLOR))),
                Padding(
                    padding: EdgeInsets.only(
                        top: vh(context, 10),
                        left: getDeviceWidth(context) / 47 * 3,
                        right: getDeviceWidth(context) / 47 * 3),
                    child: CheckInput(
                      onChanged: (value) {
                        setState(() {
                          nick_name = value;
                        });
                      },
                      isEnabled: true,
                      isChecked: nick_name.isNotEmpty,
                      text: nick_name,
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
                              Navigator.pushNamed(context, "/b_day");
                            },
                            isDisabled: nick_name.isEmpty,
                          ),
                        ))),
                Expanded(
                  child: Container(),
                )
              ],
            )));
  }
}
