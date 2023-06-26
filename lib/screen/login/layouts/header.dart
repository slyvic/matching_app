import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';

class HeaderWidget extends StatelessWidget {
  final String title1;
  final String title2;

  const HeaderWidget({Key? key, required this.title1, required this.title2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, iconColor: PRIMARY_FONT_COLOR),
              child: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              title1,
              style: const TextStyle(
                color: PRIMARY_FONT_COLOR,
                fontSize: 24,
              ),
            ),
            Text(
              title2,
              style: const TextStyle(color: PRIMARY_FONT_COLOR, fontSize: 14),
            ),
          ]),
        ),
      ],
    );
  }
}
