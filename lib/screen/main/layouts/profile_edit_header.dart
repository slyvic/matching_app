import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/utile/index.dart';

class ProfileEditHeader extends StatelessWidget {
  final String title;

  const ProfileEditHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: vw(context, 100),
        height: vh(context, 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Expanded(child: Container()),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, iconColor: PRIMARY_FONT_COLOR),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 28,
                ),
              ),
              Expanded(child: Container()),
              Text(title,
                  style:
                      const TextStyle(color: PRIMARY_FONT_COLOR, fontSize: 17)),
              Expanded(child: Container()),
              const SizedBox(
                width: 70,
              )
            ],
          ),
        ]));
  }
}
