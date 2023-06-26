import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/user_info_items.dart';
import 'package:matching_app/screen/main/layouts/user_filter_by_address.dart';
import 'package:matching_app/utile/index.dart';

class UsersBottomModal extends StatefulWidget {
  const UsersBottomModal({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UsersBottomModalState createState() => _UsersBottomModalState();
}

class _UsersBottomModalState extends State<UsersBottomModal> {
  String message = "";
  List<UsersObject> items = [];

  @override
  void initState() {
    super.initState();
    items = <UsersObject>[
      UsersObject(1, "サッカー", true, false, "", "Rectangle -1.png"),
      UsersObject(2, "野球", true, false, "", "Rectangle -2.png"),
      UsersObject(3, "バスケ", true, false, "", "Rectangle -3.png"),
      UsersObject(4, "テニス", true, false, "", "Rectangle -4.png"),
      UsersObject(5, "卓球", true, false, "", "Rectangle -5.png"),
      UsersObject(6, "ゴルフ", true, false, "", "Rectangle -6.png"),
      UsersObject(7, "趣味", false, false, "", "Rectangle -7.png"),
      UsersObject(8, "音楽", false, false, "", "Rectangle -8.png"),
      UsersObject(9, "映画", false, false, "", "Rectangle -9.png"),
    ];
  }

  final RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: vww(context, 3), vertical: vhh(context, 3)),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) {
                  return Column(
                    children: [
                      Center(
                          child: Container(
                        width: vw(context, 20),
                        height: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: PRIMARY_FONT_COLOR),
                      )),
                      SizedBox(
                          width: vw(context, 100),
                          height: vhh(context, 10),
                          child: Column(children: [
                            Expanded(child: Container()),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      iconColor: PRIMARY_FONT_COLOR),
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    size: 28,
                                  ),
                                ),
                                Expanded(child: Container()),
                                const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    child: Column(
                                      children: [
                                        Text("参加中の人",
                                            style: TextStyle(
                                                color: PRIMARY_FONT_COLOR,
                                                fontSize: 14)),
                                        Text("ゴルフ",
                                            style: TextStyle(
                                                color: PRIMARY_FONT_COLOR,
                                                fontSize: 9))
                                      ],
                                    )),
                                Expanded(child: Container()),
                                const SizedBox(
                                  width: 70,
                                )
                              ],
                            ),
                          ])),
                      Wrap(
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
                                      Navigator.pushNamed(
                                          context, '/users_profile_screen');
                                    },
                                    child: UserInfoItems(
                                        isChecked: items[index].isChecked,
                                        label: items[index].label,
                                        image:
                                            "assets/images/users/${(items[index].image)}")));
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  );
                },
              ))
            ],
          ),
        ),
        floatingActionButton: Container(
            padding: EdgeInsets.only(left: vww(context, 10)),
            alignment: Alignment.bottomCenter,
            width: vww(context, 100),
            child: SizedBox(
              width: 200,
              child: TextButton(
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
                          return const UserFilterByAddress();
                        });
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(BUTTON_MAIN)),
                  child: const Text(
                    "検索条件",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  )),
            )));
  }
}
