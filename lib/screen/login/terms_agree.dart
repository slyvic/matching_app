import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/check_button.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/utile/index.dart';
// import 'package:flutter_redux/flutter_redux.dart';

// ignore: use_key_in_widget_constructors
class TermsAgree extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _TermsAgreeState createState() => _TermsAgreeState();
}

class _TermsAgreeState extends State<TermsAgree> {
  List<bool> termsAgree = [false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            constraints: BoxConstraints(
              minHeight:
                  getDeviceHeight(context), // Set the minimum height here
            ),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: getDeviceHeight(context) / 7),
                  child: SizedBox(
                      height: getDeviceHeight(context) / 2.5,
                      child: const Image(
                        image: AssetImage("assets/images/login/termsagree.png"),
                      )),
                )),
                Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: getDeviceHeight(context) / 15,
                                bottom: getDeviceHeight(context) / 50),
                            child: const Text(
                              "プロフィールを設定してあと一歩！",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 63, 63, 63)),
                            ),
                          ),
                          const Text(
                              "安心してご利用いただけるように、お客様には利用規約に同意 \n していただくようにお願いしております。",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 124, 129, 136))),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  termsAgree[0] = !termsAgree[0];
                                });
                              },
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              child: CheckButton(
                                text1: "",
                                text2: "私は18歳以上で独身です。",
                                text3: "",
                                text4: "",
                                fontSize: 10,
                                isChecked: termsAgree[0],
                              )),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  termsAgree[1] = !termsAgree[1];
                                });
                              },
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              child: CheckButton(
                                  text1: "利用規約",
                                  text2: "および",
                                  text3: "プライバシーポリシー",
                                  text4: "に同意します。",
                                  fontSize: 10,
                                  isChecked: termsAgree[1]))
                        ])),
                Container(
                    constraints: BoxConstraints(
                      minHeight: getDeviceHeight(context) / 15,
                    ),
                    child: Align(
                        alignment: Alignment.center,
                        child: Padding(
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
                                    Navigator.pushNamed(context, "/nick_name");
                                  },
                                  isDisabled: termsAgree
                                      .where((element) => !element)
                                      .toList()
                                      .isNotEmpty,
                                ),
                              )),
                        )))
              ],
            ))));
  }
}
