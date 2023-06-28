import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/screen/main/layouts/setting_header.dart';
import 'package:matching_app/utile/index.dart';

// ignore: use_key_in_widget_constructors
class AdminNotificationListScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AdminNotificationListScreenState createState() => _AdminNotificationListScreenState();
}

class _AdminNotificationListScreenState extends State<AdminNotificationListScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
                delegate: SettingHeader('運営からのメッセージ'), pinned: true),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: vww(context, vww(context, 1))),
                  child: Column(
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.zero),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, '/admin_notification_view_screen');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 237, 237, 237)))),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("本人確認の結果について",
                                  style: TextStyle(
                                      color: PRIMARY_FONT_COLOR)),
                              Icon(Icons.keyboard_arrow_right,
                                  color: Color.fromARGB(255, 191, 193, 199))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ));
            }, childCount: 1)),
          ],
        ));
  }
}
