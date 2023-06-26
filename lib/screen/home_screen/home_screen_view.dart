import 'package:flutter/material.dart';
import 'package:matching_app/components/background_widget.dart';
import 'package:matching_app/components/radius_button.dart';

// ignore: use_key_in_widget_constructors
class HomeScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void goNavigation(int id) {
      switch (id) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          Navigator.pushNamed(context, "/phone_login");
          break;
        case 3:
          break;
      }
    }

    // ignore: unused_local_variable
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          const Positioned.fill(
              child: BackgroundWidget(src: "assets/images/mainbg.png")),
          const Positioned.fill(
              child: BackgroundWidget(src: "assets/images/bg-white.png")),
          const Center(
              child: Padding(
            padding: EdgeInsets.only(bottom: 100),
            child: Image(image: AssetImage("assets/images/match-text.png")),
          )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 30, right: 30),
                    child: RadiusButton(
                        text: "Appleでサインイン",
                        color: const Color.fromARGB(255, 0, 0, 0),
                        goNavigation: goNavigation,
                        id: 0,
                        isDisabled: false)),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 30, right: 30),
                  child: RadiusButton(
                      text: "LINEでログイン",
                      color: const Color.fromARGB(255, 2, 158, 0),
                      goNavigation: goNavigation,
                      id: 1,
                      isDisabled: false),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 5, left: 30, right: 30),
                  child: RadiusButton(
                      text: "電話番号でサインイン",
                      color: const Color.fromARGB(255, 66, 165, 245),
                      goNavigation: goNavigation,
                      id: 2,
                      isDisabled: false),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 30, right: 30),
                  child: RadiusButton(
                      text: "お問い合わせ",
                      color: const Color.fromARGB(0, 0, 0, 0),
                      goNavigation: goNavigation,
                      id: 3,
                      isDisabled: false),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
