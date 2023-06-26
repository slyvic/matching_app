import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/screen/login/layouts/header.dart';
import 'package:matching_app/utile/index.dart';
// import 'package:flutter_redux/flutter_redux.dart';

// ignore: use_key_in_widget_constructors
class LoginView extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String phone_number = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Stack(children: [
            Container(
                constraints:
                    BoxConstraints(minHeight: getDeviceHeight(context) - 100),
                child: Column(children: [
                  const HeaderWidget(
                    title1: "電話番号を入力",
                    title2: "入力した電話番号に６桁の認証番号が届きます。",
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 27),
                      // , letterSpacing: 5
                      maxLength: 11,
                      buildCounter: null,
                      onChanged: (value) {
                        setState(() {
                          phone_number = value;
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                Navigator.pushNamed(context, "/check_code");
                              },
                              isDisabled: phone_number.length < 11,
                            ),
                          ))),
                  Expanded(
                    child: Container(),
                  )
                ]))
          ]),
        ));
  }
}
