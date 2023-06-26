import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/user_info_items.dart';
import 'package:matching_app/screen/main/layouts/bottom_nav_bar.dart';
import 'package:matching_app/utile/index.dart';

// ignore: use_key_in_widget_constructors
class FollowingUser extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _FollowingUserState createState() => _FollowingUserState();
}

class _FollowingUserState extends State<FollowingUser> {
  List<UsersObject> items = [];

  bool isFollowing = true;

  @override
  void initState() {
    super.initState();
    items = <UsersObject>[
      UsersObject(1, "サッカー", true, false, "", "Rectangle -1.png"),
      UsersObject(2, "野球", true, false, "", "Rectangle -2.png"),
      UsersObject(1, "", true, false, "", "paid_plan_users.png"),
      UsersObject(3, "バスケ", true, false, "", "Rectangle -3.png"),
      UsersObject(4, "テニス", true, false, "", "Rectangle -4.png"),
      UsersObject(5, "卓球", true, false, "", "Rectangle -5.png"),
      UsersObject(0, "", true, false, "", "unpaid_plan_users.png"),
      UsersObject(6, "ゴルフ", true, false, "", "Rectangle -6.png"),
      UsersObject(0, "趣味", false, false, "", "Rectangle -7.png"),
      UsersObject(1, "", false, false, "", "paid_plan_users.png"),
      UsersObject(7, "音楽", false, false, "", "Rectangle -8.png"),
      UsersObject(8, "映画", false, false, "", "Rectangle -9.png"),
    ];
  }

  final int _currentIndex = 2;
  final RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  );
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers

    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: vhh(context, 8),
                            left: vww(context, 5),
                            right: vww(context, 5)),
                        child: const Text("いいねをしてくれた人",
                            style: TextStyle(fontSize: 21))),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: vww(context, 5), vertical: 15),
                        decoration: isFollowing
                            ? const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey, width: 0.5)))
                            : null,
                        child: TextButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.zero),
                            ),
                            onPressed: () {
                              setState(() {
                                isFollowing = !isFollowing;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.0,
                                  style: BorderStyle.none,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromRGBO(229, 250, 245, 1),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1.0,
                                            style: BorderStyle.none,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: BUTTON_MAIN,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: const Text("25",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15)),
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(left: 7),
                                          child: Text("すべて",
                                              style: TextStyle(
                                                  color: BUTTON_MAIN)))
                                    ],
                                  ),
                                  Icon(
                                    isFollowing
                                        ? Icons.keyboard_arrow_down
                                        : Icons.keyboard_arrow_up,
                                    color: BUTTON_MAIN,
                                  )
                                ],
                              ),
                            ))),
                    !isFollowing
                        ? Container(
                            padding: EdgeInsets.only(
                                left: vww(context, 5),
                                right: vww(context, 5),
                                bottom: 15),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey, width: 0.5))),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.0,
                                  style: BorderStyle.none,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 230, 230, 230),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: const Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Icon(
                                        Icons.remove_red_eye,
                                        color:
                                            Color.fromARGB(255, 193, 192, 201),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text("住まいが同じ人",
                                          style: TextStyle(
                                              color: PRIMARY_FONT_COLOR)))
                                ],
                              ),
                            ))
                        : Container(),
                    Padding(
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
                                                if (items[index].label != "") {
                                                  Navigator.pushNamed(context,
                                                      '/users_profile_screen');
                                                }
                                              },
                                              child: UserInfoItems(
                                                  isChecked:
                                                      items[index].isChecked,
                                                  label: items[index].label,
                                                  image:
                                                      "assets/images/users/${(items[index].image)}")));
                                    },
                                  )))
                        ])))
                  ]);
            }, childCount: 1)),
          ],
        ),
        bottomNavigationBar: BottomNavBar(currentIndex: _currentIndex));
  }
}
