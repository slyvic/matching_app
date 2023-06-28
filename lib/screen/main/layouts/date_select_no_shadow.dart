import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/utile/index.dart';

// ignore: use_key_in_widget_constructors
class DateSelectNoShadow extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _DateSelectNoShadowState createState() => _DateSelectNoShadowState();
}
// ignore: must_be_immutable
class _DateSelectNoShadowState extends State<DateSelectNoShadow> {

  List<Map<String, dynamic>> dateList = [
    {"isSelected": false, "date": "4/10"},
    {"isSelected": false, "date": "4/11"},
    {"isSelected": false, "date": "4/12"},
    {"isSelected": false, "date": "4/13"},
    {"isSelected": false, "date": "4/14"},
    {"isSelected": false, "date": "4/15"}
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            bottom: vhh(context, 1), left: vww(context, 3), right: vww(context, 3)),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "日付を選択してください",
                        style: TextStyle(
                            fontSize: 12, color: PRIMARY_FONT_COLOR),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: dateList.map((e) {
                          return Container(
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(
                                            e["isSelected"] ? const Color.fromARGB(
                                                255, 248, 248, 249) : BUTTON_MAIN),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.zero),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      e["isSelected"] =!e["isSelected"];
                                    });
                                  },
                                  child: Text(
                                    e["date"],
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: e["isSelected"] ? const Color.fromARGB(
                                            255, 134, 142, 157) : Colors.white),
                                  )));
                        }).toList())
                  ],
                ))));
  }
}
