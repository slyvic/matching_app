import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/utile/index.dart';

// ignore: unused_element
class PinedChattingHeader extends StatelessWidget {
  const PinedChattingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Padding(
          padding: EdgeInsets.only(top: vhh(context, 6)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.keyboard_arrow_left,
                          color: PRIMARY_FONT_COLOR, size: 35)),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: const Image(
                        image: AssetImage("assets/images/users/user.png"),
                        height: 60,
                      )),
                  const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("TestNameA", style: TextStyle(fontSize: 17)))
                ],
              ),
              TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {
                    showAdaptiveActionSheet(
                      context: context,
                      androidBorderRadius: 30,
                      actions: <BottomSheetAction>[
                        BottomSheetAction(
                            title: const Text('違反報告する',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 54, 137, 232))),
                            onPressed: (context) {Navigator.pushNamed(context, "/report_screen");}),
                        BottomSheetAction(
                            title: const Text('ブロックする',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 70, 70))),
                            onPressed: (context) {
                              Navigator.pop(context);
                              showDialog(
                                  context: context,
                                  builder: (context) => CupertinoAlertDialog(
                                        content: const Text(
                                            'ブロックをしても\nよろしいですか？', style: TextStyle(fontSize: 16)),
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: () {
                                              Navigator.pop(
                                                  context);
                                              },
                                              child: const Text('キャンセル', style: TextStyle(fontSize: 15))),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context, "/chat_screen");
                                            },
                                            child: const Text('OK', style: TextStyle(fontSize: 15)),
                                          )
                                        ],
                                      ));
                            }),
                      ],
                      cancelAction: CancelAction(
                          title: const Text('キャンセル',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 54, 137, 232)))),
                    );
                  },
                  child: const Icon(
                    Icons.more_horiz,
                    color: BUTTON_MAIN,
                    size: 35,
                  ))
            ],
          )),
    );
  }
}
