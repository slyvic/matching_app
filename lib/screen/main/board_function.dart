import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/screen/main/layouts/board_card.dart';
import 'package:matching_app/screen/main/layouts/board_message_modal.dart';
import 'package:matching_app/screen/main/layouts/bottom_nav_bar.dart';
import 'package:matching_app/screen/main/layouts/date_select_widget.dart';
import 'package:matching_app/utile/index.dart';
// import 'package:matching_app/screen/main/layouts/paid_plan_modal.dart';

// ignore: use_key_in_widget_constructors
class BoardFunction extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _BoardFunctionState createState() => _BoardFunctionState();
}

class _BoardFunctionState extends State<BoardFunction> {
  List<UsersObject> items = [];
  List<BadgeObject> badgeList = [];

  bool isModalShow = false;

  @override
  void initState() {
    super.initState();
  }

  final int _currentIndex = 0;
  final RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  );
  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(milliseconds: 1000), () {
    //   showDialog(context: context, builder: (context) => PaidPlanModal());
    // });
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
                        child: const Text("ボード機能",
                            style: TextStyle(fontSize: 21))),
                    DateSelectWidget(),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            builder: (context) {
                              return const BoardMessageModal();
                            });
                      },
                      child: BoardCard(),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            builder: (context) {
                              return const BoardMessageModal();
                            });
                      },
                      child: BoardCard(),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            builder: (context) {
                              return const BoardMessageModal();
                            });
                      },
                      child: BoardCard(),
                    ),
                  ]);
            }, childCount: 1)),
          ],
        ),
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              disabledBackgroundColor: BUTTON_MAIN,
              disabledForegroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              textStyle: const TextStyle(fontSize: 15),
              backgroundColor: BUTTON_MAIN,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 13)),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                ),
                builder: (context) {
                  return const BoardMessageModal();
                });
          },
          child: const Text("投稿する"),
        ),
        bottomNavigationBar: BottomNavBar(currentIndex: _currentIndex));
  }
}
