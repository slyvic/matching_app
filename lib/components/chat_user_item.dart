import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/utile/index.dart';

class ChatUserItem extends StatelessWidget {
  const ChatUserItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/users/Rectangle -3.png'),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1,
                            color: Color.fromARGB(255, 237, 237, 237)))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      width: vww(context, 90) - 70,
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text("たろう",
                              style: TextStyle(
                                  fontSize: 15, color: PRIMARY_FONT_COLOR)),
                          Text("12:12",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 193, 192, 201)))
                        ])),
                    const Text("サンプルテキスト!!!!!",
                    textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15,
                            color: PRIMARY_FONT_COLOR,
                            letterSpacing: -2.4))
                  ],
                ))
          ],
        );
  }
}
