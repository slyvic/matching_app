import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/screen/main/layouts/setting_header.dart';
import 'package:matching_app/utile/index.dart';

// ignore: use_key_in_widget_constructors
class AdminNotificationViewScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AdminNotificationViewScreenState createState() => _AdminNotificationViewScreenState();
}

class _AdminNotificationViewScreenState extends State<AdminNotificationViewScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
                delegate: SettingHeader('不具合の修正について'), pinned: true),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.only(
                      left: vww(context, vww(context, 1)), right: vww(context, vww(context, 1)), top: vww(context, vhh(context, 1))),
                  child: const Text("test Messagetest Message\ntest Messagetest Message", style: TextStyle(fontSize: 14, color: PRIMARY_FONT_COLOR))
                  );
            }, childCount: 1)),
          ],
        ));
  }
}
