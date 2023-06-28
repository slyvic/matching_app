import 'package:flutter/material.dart';
import 'package:matching_app/components/check_input.dart';
import 'package:matching_app/screen/main/layouts/nick_name_edit_header.dart';
import 'package:matching_app/utile/index.dart';
// import 'package:flutter_redux/flutter_redux.dart';

// ignore: use_key_in_widget_constructors
class NickNameEdit extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _NickNameEditState createState() => _NickNameEditState();
}

class _NickNameEditState extends State<NickNameEdit> {
  String nick_name = '';

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
                  child: const NickNameEditHeader(title: "ニックネーム変更"),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: vhh(context, 22),
                        left: getDeviceWidth(context) / 47 * 3,
                        right: getDeviceWidth(context) / 47 * 3),
                    child: CheckInput(
                      onChanged: (value) {
                        setState(() {
                          nick_name = value;
                        });
                      },
                      isEnabled: true,
                      isChecked: nick_name.isNotEmpty,
                      text: nick_name,
                    )),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
              ],
            )));
  }
}
