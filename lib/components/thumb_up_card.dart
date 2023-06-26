import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/utile/index.dart';

class ThumbUpCard extends StatelessWidget {
  final int text;

  const ThumbUpCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: vww(context, 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 229, 250, 245),
      ),
      child: Column(children: [
        Container(
            height: 80,
            width: double.infinity,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text((text * 2).toString(),
                    style: const TextStyle(fontSize: 28, color: BUTTON_MAIN)),
                const SizedBox(width: 15),
                const Icon(Icons.thumb_up, color: BUTTON_MAIN, size: 28)
              ],
            )),
        Container(
          width: double.infinity,
          height: 40,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: BUTTON_MAIN,
          ),
          child: Text(
            "$textコイン",
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
        )
      ]),
    );
  }
}
