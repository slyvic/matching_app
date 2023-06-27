import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/chat_user_item.dart';
import 'package:matching_app/components/user_info_items.dart';
import 'package:matching_app/screen/main/layouts/bottom_nav_bar.dart';
import 'package:matching_app/screen/main/layouts/pined_header.dart';
import 'package:matching_app/utile/index.dart';

// ignore: use_key_in_widget_constructors
class ChatScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<UsersObject> items = <UsersObject>[
    UsersObject(
      1,
      "サッカー",
      true,
      true,
      "",
      "Rectangle -1.png",
    ),
    UsersObject(
      2,
      "野球",
      true,
      true,
      "",
      "Rectangle -2.png",
    ),
    UsersObject(
      3,
      "バスケ",
      false,
      true,
      "",
      "Rectangle -3.png",
    ),
    UsersObject(
      4,
      "テニス",
      false,
      false,
      "",
      "Rectangle -4.png",
    ),
    UsersObject(
      5,
      "卓球",
      false,
      false,
      "",
      "Rectangle -5.png",
    ),
    UsersObject(
      6,
      "ゴルフ",
      false,
      false,
      "",
      "Rectangle -6.png",
    ),
    UsersObject(
      7,
      "趣味",
      false,
      false,
      "",
      "Rectangle -7.png",
    ),
    UsersObject(
      8,
      "音楽",
      false,
      false,
      "",
      "Rectangle -8.png",
    ),
    UsersObject(
      9,
      "映画",
      false,
      false,
      "",
      "Rectangle -9.png",
    ),
  ];

  final int _currentIndex = 3;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void onTabTap(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
                delegate: PinedHeader(_tabController, onTabTap), pinned: true),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              return _tabController.index == 0
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: vw(context, 2), vertical: 20),
                      child: Align(
                          child: Row(children: [
                        Expanded(
                            child: Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                alignment: WrapAlignment.spaceBetween,
                                children: List.generate(
                                  items.length,
                                  (index) {
                                    return FractionallySizedBox(
                                        widthFactor: 0.45,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context, "/user_profile_chat");
                                          },
                                            child: UserInfoItems(
                                                isChecked: false,
                                                isNew: items[index].isNew,
                                                label: items[index].label,
                                                image:
                                                    "assets/images/users/${(items[index].image)}")));
                                  },
                                )))
                      ])))
                  : Column(
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
                                      Navigator.pushNamed(context, '/chatting_screen');
                                    },
                                    child: const ChatUserItem(),
                                  ),
                                ],
                              )),
                        ]);
            }, childCount: 1)),
          ],
        ),
        bottomNavigationBar: BottomNavBar(currentIndex: _currentIndex));
  }
}
