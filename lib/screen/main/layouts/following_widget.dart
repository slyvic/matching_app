import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/screen/main/layouts/thumb_up_bottom_modal.dart';
import 'package:matching_app/utile/index.dart';

class FolloingWidget extends StatelessWidget {
  const FolloingWidget({super.key});

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
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25),
                                    ),
                                  ),
                                  builder: (context) {
                                    return const ThumbUpBottomModal();
                                  });
                            },
                            child: SizedBox(
                                width: vww(context, 40),
                                child: const Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text("残りいいね数",
                                            style: TextStyle(
                                                color: PRIMARY_FONT_COLOR,
                                                fontSize: 15))),
                                    Text("160",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 0, 202, 157),
                                            fontSize: 22)),
                                  ],
                                ))),
                        Container(
                          width: 1,
                          height: vhh(context, 7),
                          color: const Color.fromARGB(255, 245, 245, 245),
                        ),
                        SizedBox(
                            width: vww(context, 40),
                            child: const Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Text("おさそい",
                                        style: TextStyle(
                                            color: PRIMARY_FONT_COLOR,
                                            fontSize: 15))),
                                Text("5",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 202, 157),
                                        fontSize: 22)),
                              ],
                            ))
                      ],
                    )))));
  }
}
