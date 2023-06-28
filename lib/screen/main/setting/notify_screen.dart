import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/screen/main/layouts/setting_header.dart';
import 'package:matching_app/utile/index.dart';
import 'package:permission_handler/permission_handler.dart';
// ignore: use_key_in_widget_constructors
class NotifyScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _NotifyScreenState createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
                delegate: SettingHeader('通知'), pinned: true),
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
                          Permission.notification.request();
                          AppSettings.openNotificationSettings();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 237, 237, 237)))),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("通知をオンにする",
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
