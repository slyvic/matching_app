import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/utile/index.dart';

class UnidentifiedModal extends StatelessWidget {
  UnidentifiedModal({super.key});

  final RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: vww(context, 5)),
        child: AlertDialog(
            contentPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.zero,
            actionsPadding: EdgeInsets.zero,
            actions: [
              Container(
                  padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        disabledForegroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        textStyle: const TextStyle(fontSize: 15),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 13),
                        backgroundColor: BUTTON_MAIN),
                    onPressed: () {},
                    child: const Text('本人確認する'),
                  )),
              Container(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 20, left: 50, right: 50),
                  width: double.infinity,
                  child: TextButton(
                    style: ElevatedButton.styleFrom(
                        disabledForegroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        textStyle: const TextStyle(fontSize: 15),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 13),
                        backgroundColor: Colors.transparent),
                    onPressed: () {},
                    child: const Text('まだしない',
                        style: TextStyle(color: BUTTON_MAIN)),
                  ))
            ],
            shape: roundedRectangleBorder,
            content: Container(
                padding: const EdgeInsets.only(
                    top: 20),
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "安心安全のため\n本人確認をしてください",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: PRIMARY_FONT_COLOR,
                          fontSize: 18,
                          letterSpacing: -2),
                    ),
                    Image(
                        width: vww(context, 40),
                        image: const AssetImage(
                            "assets/images/main/unidentified.png"))
                  ],
                ))));
  }
}
