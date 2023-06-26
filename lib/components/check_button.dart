import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matching_app/utile/index.dart';

class CheckButton extends StatelessWidget {
  final String? text1;
  final String? text2;
  final String? text3;
  final String? text4;
  final bool? isChecked;
  final double? fontSize;
  final Color? fontColor;

  const CheckButton(
      {Key? key,
      this.text1,
      this.text2,
      this.text3,
      this.text4,
      this.isChecked,
      this.fontSize,
      this.fontColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color grey = const Color.fromARGB(255, 124, 129, 136);
    Color sky = const Color.fromARGB(255, 106, 168, 238);
    return Padding(
        padding: EdgeInsets.only(top: getDeviceHeight(context) / 45),
        child: Align(
          alignment: Alignment.center,
          child: Row(children: [
            SvgPicture.asset(
              isChecked == true
                  ? "assets/images/svg/check_on.svg"
                  : "assets/images/svg/check_off.svg",
              width: fontSize! + 5.0,
            ),
            text1 != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(text1!,
                        style: TextStyle(fontSize: fontSize, color: sky)))
                : const Padding(padding: EdgeInsets.only(left: 5)),
            text2 != null
                ? Text(text2!,
                    style:
                        TextStyle(fontSize: fontSize, color: fontColor ?? grey))
                : Container(),
            text3 != null
                ? Text(text3!, style: TextStyle(fontSize: fontSize, color: sky))
                : Container(),
            text4 != null
                ? Text(text4!,
                    softWrap: true,
                    style: TextStyle(fontSize: fontSize, color: grey))
                : Container()
          ]),
        ));
  }
}
