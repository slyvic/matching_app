import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/utile/index.dart';

typedef OnPressed = void Function();

class ProfileHeader extends StatelessWidget {
  final String title;
  final String? text;
  final OnPressed onPressed;
  final bool? isDisabled;

  const ProfileHeader({Key? key, required this.title, required this.onPressed, this.text, this.isDisabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: vw(context, 100),
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(padding: EdgeInsets.only(bottom: 20, left: vww(context, 2)), child: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: 80,
                  child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 28,
                  color: PRIMARY_FONT_COLOR,
                ),
              )),
              Expanded(child: Container()),
              Text(title,
                  style:
                      const TextStyle(color: PRIMARY_FONT_COLOR, fontSize: 17)),
              Expanded(child: Container()),
              SizedBox(
                  width: 80,
                  height: 35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        disabledForegroundColor: Colors.white,
                        disabledBackgroundColor: isDisabled == true ? const Color.fromARGB(255, 128, 229, 206) : BUTTON_MAIN,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        textStyle: const TextStyle(fontSize: 12),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        backgroundColor: BUTTON_MAIN),
                    onPressed: isDisabled == true ? null : () {
                      onPressed();
                    },
                    child: Text(text! == "" ? '保存' : text!, style: const TextStyle(fontSize: 12),),
                  )),
              SizedBox(width: vww(context, 6))
                  
            ],
          ))
        ]));
  }
}
