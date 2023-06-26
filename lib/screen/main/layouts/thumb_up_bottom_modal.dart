import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/thumb_up_card.dart';
import 'package:matching_app/screen/main/layouts/coin_check_modal.dart';
import 'package:matching_app/utile/index.dart';

class ThumbUpBottomModal extends StatefulWidget {
  const ThumbUpBottomModal({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ThumbUpBottomModalState createState() => _ThumbUpBottomModalState();
}

class _ThumbUpBottomModalState extends State<ThumbUpBottomModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: vww(context, 6), right: vww(context, 6), top: 50),
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text('いいね交換', style: TextStyle(fontSize: 17)),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(255, 229, 250, 245),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: BUTTON_MAIN,
                        ),
                        child: const Text(
                          "C",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                      const Text(
                        "0",
                        style: TextStyle(fontSize: 17, color: BUTTON_MAIN),
                      )
                    ],
                  ))
            ]),
            const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "コイン1枚といいねを2つ交換できます\n多くのいいねを送ることでチャンスが増えます",
                  style: TextStyle(fontSize: 12),
                )),
            Container(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.zero),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  const CoinCheckModal(isFull: false));
                        },
                        child: const ThumbUpCard(text: 10)),
                    TextButton(
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.zero),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  const CoinCheckModal(isFull: true));
                        },
                        child: const ThumbUpCard(text: 30)),
                    TextButton(
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.zero),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  const CoinCheckModal(isFull: false));
                        },
                        child: const ThumbUpCard(text: 50)),
                  ],
                ))
          ],
        ));
  }
}
