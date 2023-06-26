import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/check_input.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/components/Header.dart';
import 'package:matching_app/utile/index.dart';

// import 'package:flutter_redux/flutter_redux.dart';
// ignore: use_key_in_widget_constructors
class BDay extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _BDayState createState() => _BDayState();
}

class _BDayState extends State<BDay> {
  String b_day = '';

  DateTime? _selectedDate;

  void _selectDate(BuildContext context) {
    _selectedDate = _selectedDate ?? DateTime.now();
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 260,
          color: const Color.fromARGB(255, 240, 240, 241),
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                    child: const Text('消去'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: const Text('完了'),
                    onPressed: () {
                      setState(() {
                        b_day = b_day;
                      });
                      Navigator.of(context).pop(_selectedDate);
                    },
                  ),
                ],
              ),
              Container(
                height: 200.0,
                child: CupertinoDatePicker(
                  // backgroundColor: Color.fromARGB(255, 209, 212, 217),
                  backgroundColor: const Color.fromARGB(255, 240, 240, 241),
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: _selectedDate,
                  minimumDate: DateTime(1900),
                  maximumDate: DateTime(2030),
                  onDateTimeChanged: (DateTime newDateTime) {
                    _selectedDate = newDateTime;
                    b_day =
                        '${newDateTime.year}/${newDateTime.month}/${newDateTime.day}';
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            constraints: BoxConstraints(
              minHeight: vh(context, 90), // Set the minimum height here
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: getDeviceWidth(context) / 47 * 1,
                      right: getDeviceWidth(context) / 47 * 1),
                  child: const HeaderWidget(title: "プロフィール登録"),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: vh(context, 3),
                        left: getDeviceWidth(context) / 47 * 3,
                        right: getDeviceWidth(context) / 47 * 3),
                    child: const Text("生年月日を教えてください",
                        style: TextStyle(
                            fontSize: 24, color: PRIMARY_FONT_COLOR))),
                Padding(
                  padding: EdgeInsets.only(
                      top: vh(context, 1),
                      left: getDeviceWidth(context) / 47 * 3,
                      right: getDeviceWidth(context) / 47 * 3),
                  child: const Text(
                    "後から変更することはできません\n本人確認の際に照合するため、正しく入力してください",
                    style: TextStyle(fontSize: 12, color: PRIMARY_FONT_COLOR),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: vh(context, 4),
                        left: getDeviceWidth(context) / 47 * 3,
                        right: getDeviceWidth(context) / 47 * 3),
                    child: InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: CheckInput(
                          isEnabled: false,
                          onChanged: (String value) {},
                          isChecked: b_day.isNotEmpty,
                          text: b_day,
                        ))),
                Expanded(
                  child: Container(),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getDeviceWidth(context) / 47 * 3),
                    child: SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: RadiusButton(
                            id: 0,
                            color: BUTTON_MAIN,
                            text: "つぎへ",
                            goNavigation: (id) {
                              Navigator.pushNamed(context, "/address_check");
                            },
                            isDisabled: b_day.isEmpty,
                          ),
                        ))),
                Expanded(
                  child: Container(),
                )
              ],
            )));
  }
}
