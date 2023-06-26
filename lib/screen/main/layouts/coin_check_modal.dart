import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/utile/index.dart';

class CoinCheckModal extends StatelessWidget {
  final bool isFull;

  const CoinCheckModal({super.key, required this.isFull});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        titlePadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        actions: [
          Container(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    disabledForegroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    textStyle: const TextStyle(fontSize: 15),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 13),
                    backgroundColor: BUTTON_MAIN),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  isFull == true ? '追加する' : '交換する',
                  style: const TextStyle(fontSize: 16),
                ),
              )),
          Container(
              padding: const EdgeInsets.only(bottom: 10, left: 40, right: 40),
              width: double.infinity,
              child: TextButton(
                style: ElevatedButton.styleFrom(
                    disabledForegroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    textStyle: const TextStyle(fontSize: 15),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 13),
                    backgroundColor: Colors.transparent),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'キャンセル',
                  style: TextStyle(
                      fontSize: 18,
                      color: BUTTON_MAIN,
                      letterSpacing: -2),
                ),
              ))
        ],
        shape: roundedRectangleBorder,
        content: Container(
          height: 100,
          width: vww(context, 80),
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Text(
            isFull == true ? 'コインが不足してます\n追加しますか' : '交換しても\nよろしいですか',
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: PRIMARY_FONT_COLOR, fontSize: 18, letterSpacing: -2),
          ),
        ));
  }
}
