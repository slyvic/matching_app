import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/utile/index.dart';

typedef OnPressed = void Function(String value);

// ignore: must_be_immutable
class CheckInput extends StatelessWidget {
  final String? text;
  final bool? isChecked;
  OnPressed onChanged;
  final bool isEnabled;

  TextEditingController _controller = TextEditingController();

  CheckInput(
      {Key? key,
      this.isChecked,
      this.text,
      required this.onChanged,
      required this.isEnabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _controller.text = text!;
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SvgPicture.asset(
            isChecked == true
                ? "assets/images/svg/check_on.svg"
                : "assets/images/svg/check_off.svg",
            width: getDeviceWidth(context) / 47 * 2.5,
          )),
      SizedBox(
        width: getDeviceWidth(context) / 47 * 38,
        child: isEnabled == true
            ? TextField(
                enabled: isEnabled,
                onChanged: onChanged,
                scrollPadding: EdgeInsets.all(0),
                style: const TextStyle(fontSize: 23, color: PRIMARY_FONT_COLOR),
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: BUTTON_MAIN, width: 2)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: BUTTON_MAIN, width: 2))),
              )
            : TextField(
                controller: _controller,
                enabled: isEnabled,
                onChanged: onChanged,
                style: const TextStyle(fontSize: 23, color: PRIMARY_FONT_COLOR),
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: BUTTON_MAIN, width: 2))),
              ),
      )
    ]);
  }
}
