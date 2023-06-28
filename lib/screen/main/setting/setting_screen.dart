import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/screen/main/layouts/user_list_header.dart';
import 'package:matching_app/utile/index.dart';

// ignore: use_key_in_widget_constructors
class SettingScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    with SingleTickerProviderStateMixin {
  List settingList = [
    {"title": "運営からのメッセージ", "screen": "/admin_notification_screen"},
    {"title": "通知", "screen": "/notify_screen"},
    {"title": "ブロックしたユーザー", "screen": "/blocked_users_screen"},
    {"title": "プライバシー設定", "screen": "/privacy_setting_screen"},
    {"title": "ヘルプ", "screen": "/"},
    {"title": "お問い合わせ", "screen": "/"},
    {"title": "利用規約", "screen": "/"},
    {"title": "特定商取引法に基づく表示", "screen": "/"},
    {"title": "退会", "screen": "/account_close_screen"},
    {"title": "ログアウト", "screen": "logout"}
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
                delegate: UserListHeader((id) {}), pinned: true),
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
                          print(settingList[index]);
                          if (settingList[index]['screen'] == 'logout') {
                            showDialog(
                                context: context,
                                builder: (context) => CupertinoAlertDialog(
                                      content: const Text('ログアウトしますか？',
                                          style: TextStyle(fontSize: 16)),
                                      actions: <Widget>[
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context, "/");
                                            },
                                            child: const Text('ログアウト',
                                                style:
                                                    TextStyle(fontSize: 15))),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('キャンセル',
                                              style: TextStyle(fontSize: 15)),
                                        )
                                      ],
                                    ));
                          } else {
                            Navigator.pushNamed(
                                context, settingList[index]['screen']);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 237, 237, 237)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(settingList[index]['title'],
                                  style: const TextStyle(
                                      color: PRIMARY_FONT_COLOR)),
                              const Icon(Icons.keyboard_arrow_right,
                                  color: Color.fromARGB(255, 191, 193, 199))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ));
            }, childCount: settingList.length)),
          ],
        ));
  }
}
