import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/components/user_list_item.dart';
import 'package:matching_app/screen/main/layouts/setting_header.dart';
import 'package:matching_app/utile/index.dart';

// ignore: use_key_in_widget_constructors
class BlockedUsersScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _BlockedUsersScreenState createState() => _BlockedUsersScreenState();
}

class _BlockedUsersScreenState extends State<BlockedUsersScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
                delegate: SettingHeader("ブロックしたユーザー"), pinned: true),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: vww(context, vww(context, 1))),
                        child: Column(
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(EdgeInsets.zero),
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => CupertinoAlertDialog(
                                          content: const Text(
                                              'ブロックをしても\nよろしいですか？',
                                              style: TextStyle(fontSize: 16)),
                                          actions: <Widget>[
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('キャンセル',
                                                    style: TextStyle(
                                                        fontSize: 15))),
                                            TextButton(
                                              onPressed: () {
                                              },
                                              child: const Text('OK',
                                                  style:
                                                      TextStyle(fontSize: 15)),
                                            )
                                          ],
                                        ));
                              },
                              child: const UserListItem(isBlockedUser: true),
                            ),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: vww(context, vww(context, 1))),
                        child: Column(
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(EdgeInsets.zero),
                              ),
                              onPressed: () {},
                              child: const UserListItem(isBlockedUser: true),
                            ),
                          ],
                        )),
                  ]);
            }, childCount: 1)),
          ],
        ));
  }
}
