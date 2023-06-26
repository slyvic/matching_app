import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/screen/main/layouts/thumb_up_bottom_modal.dart';
import 'package:matching_app/utile/index.dart';

class ThumbUpModal extends StatefulWidget {
  const ThumbUpModal({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ThumbUpModalState createState() => _ThumbUpModalState();
}

class _ThumbUpModalState extends State<ThumbUpModal> {
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
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      shape:
                          const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius
                                .vertical(
                          top: Radius.circular(
                              25),
                        ),
                      ),
                      builder: (context) {
                        return const ThumbUpBottomModal();
                      });
                },
                child: const Text(
                  '追加する',
                  style: TextStyle(fontSize: 16),
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
                  '追加する',
                  style: TextStyle(fontSize: 16, color: BUTTON_MAIN),
                ),
              ))
        ],
        shape: roundedRectangleBorder,
        content: Container(
            height: 80,
            width: vww(context, 80),
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "いいねが不足しています。",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: PRIMARY_FONT_COLOR,
                      fontSize: 18,
                      letterSpacing: -2),
                ),
              ],
            )));
  }
}
