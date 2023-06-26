import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/screen/login/layouts/header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matching_app/utile/index.dart';

// ignore: use_key_in_widget_constructors
class LoginCheckCode extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoginCheckCodeState createState() => _LoginCheckCodeState();
}

class _LoginCheckCodeState extends State<LoginCheckCode> {
  String digits = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Stack(
            children: [
              Container(
                constraints:
                    BoxConstraints(minHeight: getDeviceHeight(context) - 100),
                child: Column(children: [
                  const HeaderWidget(
                    title1: "届いた認証番号を入力",
                    title2: "下記電話番号宛に届いた認証コードを入力してください。",
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(bottom: 0, left: 20),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/svg/dot.svg",
                              semanticsLabel: "dot", width: 15, height: 15),
                          const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  style: TextStyle(
                                      fontSize: 17, color: PRIMARY_FONT_COLOR),
                                  "090-1111-1111"))
                        ],
                      )),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: getDeviceWidth(context) / 47 * 3,
                        right: getDeviceWidth(context) / 47 * 3),
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 27),
                      maxLength: 6,
                      buildCounter: null,
                      onChanged: (value) {
                        setState(() {
                          digits = value;
                        });
                      },
                      decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        fillColor: PRIMARY_GREY,
                        contentPadding:
                            const EdgeInsets.only(top: 15, bottom: 15),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
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
                              Navigator.pushNamed(context, "/terms_agree");
                            },
                            isDisabled: digits.length < 6,
                          ),
                        )),
                  ),
                  Expanded(
                    child: Container(),
                  )
                ]),
              )
            ],
          ),
        ));
  }
}
