import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';

class UserInfoItems extends StatelessWidget {
  final String? image;
  final bool? isChecked;
  final bool? isNew;
  final String label;

  const UserInfoItems(
      {Key? key, this.isChecked, this.image, required this.label, this.isNew})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image(
              image: AssetImage(image!),
            )
          ],
        ),
        label != ""
            ? Row(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(
                          left: 10, top: 5, right: 10, bottom: 5),
                      child: Text(
                        "34歳",
                        style:
                            TextStyle(fontSize: 12, color: PRIMARY_FONT_COLOR),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        label,
                        style: const TextStyle(
                            fontSize: 12, color: PRIMARY_FONT_COLOR),
                        textAlign: TextAlign.start,
                      )),
                  isNew == true
                      ? Container(
                          width: 30,
                          padding: EdgeInsets.symmetric(vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color.fromARGB(255, 255, 157, 0)),
                          child: const Text("New", style: TextStyle(fontSize: 8, color: Colors.white), textAlign: TextAlign.center,),
                        )
                      : Container(),
                      isChecked == true ? const Image(
                          image: AssetImage("assets/images/status/on.png"),
                          width: 15) : Container(),
                ],
              )
            : Container(),
        label != ""
            ? Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10),
                child: Row(
                  children: [
                    Container(
                        height: 20.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 252, 188, 44),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(6),
                            color: const Color.fromARGB(255, 250, 240, 229)),
                        child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 8),
                            child: Text("フレンチ",
                                style: TextStyle(
                                    fontSize: 9,
                                    color:
                                        Color.fromARGB(255, 252, 188, 44))))),
                    const SizedBox(width: 5),
                    Container(
                        height: 20.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 0, 171, 202),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(6),
                            color: const Color.fromARGB(255, 229, 239, 250)),
                        child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 8),
                            child: Text("J-POP",
                                style: TextStyle(
                                    fontSize: 9,
                                    color: Color.fromARGB(255, 0, 171, 202)))))
                  ],
                ))
            : Container()
      ],
    );
  }
}
