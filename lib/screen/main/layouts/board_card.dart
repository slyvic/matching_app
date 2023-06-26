import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/utile/index.dart';

// ignore: use_key_in_widget_constructors
class BoardCard extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _BoardCardState createState() => _BoardCardState();
}

// ignore: must_be_immutable
class _BoardCardState extends State<BoardCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: vhh(context, 2), horizontal: vww(context, 6)),
        child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 8,
                  offset: const Offset(0, 6))
            ], borderRadius: BorderRadius.circular(10)),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: PRIMARY_GREY, width: 1))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Image(
                                        image: AssetImage(
                                            "assets/images/users/Photos.png"),
                                        width: 40,
                                        height: 40),
                                    Container(width: 5),
                                    const Text("TAKA",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: PRIMARY_FONT_COLOR))
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "23歳",
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Color.fromARGB(
                                              255, 151, 157, 170)),
                                    ),
                                    Container(width: 10),
                                    const Text(
                                      "東京都",
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Color.fromARGB(
                                              255, 151, 157, 170)),
                                    ),
                                    Container(width: 10),
                                  ],
                                )
                              ])),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: const Text(
                          "今週の週末に山登りしませんか？\nまずは、チャットで話して仲良くなって気が合うかだけ試したいです",
                          style: TextStyle(
                              fontSize: 13, color: PRIMARY_FONT_COLOR),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                alignment: Alignment.bottomRight,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 229, 250, 245),
                                    border: Border.all(style: BorderStyle.none),
                                    borderRadius: BorderRadius.circular(5)),
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Image(
                                        image: AssetImage(
                                            "assets/images/icons/time.png"),
                                        width: 20),
                                    Container(width: 10),
                                    const Text("4/11",
                                        style: TextStyle(
                                            color: BUTTON_MAIN, fontSize: 12))
                                  ],
                                ),
                              )
                            ],
                          )),
                          
                    ]))));
  }
}
