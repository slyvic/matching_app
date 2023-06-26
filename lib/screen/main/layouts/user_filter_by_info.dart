import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/filter_badges.dart';
import 'package:matching_app/screen/main/layouts/users_bottom_modal.dart';
import 'package:matching_app/utile/index.dart';

class UserFilterByInfo extends StatefulWidget {
  const UserFilterByInfo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserFilterByInfoState createState() => _UserFilterByInfoState();
}

class _UserFilterByInfoState extends State<UserFilterByInfo> {
  // ignore: constant_identifier_names
  static const double MIN_AGE = 18,
      // ignore: constant_identifier_names
      MAX_AGE = 25,
      // ignore: constant_identifier_names
      MIN_HEIGHT = 130,
      // ignore: constant_identifier_names
      MAX_HEIGHT = 210;
  double sliderValue = 18;
  // ignore: non_constant_identifier_names
  RangeValues _age_values = const RangeValues(18, 25);
  // ignore: non_constant_identifier_names
  RangeValues _height_values = const RangeValues(130, 210);

  List<Map<String, dynamic>> bodyTypes = [
    {"isChecked": false, "text": "細め"},
    {"isChecked": false, "text": "普通"},
    {"isChecked": false, "text": "がっちり"},
    {"isChecked": false, "text": "太め"},
  ];

  List<Map<String, dynamic>> holidays = [
    {"isChecked": false, "text": "真剣"},
    {"isChecked": false, "text": "休日"},
    {"isChecked": false, "text": "不定期"},
  ];

  List<Map<String, dynamic>> purpose = [
    {"isChecked": false, "text": "平日"},
    {"isChecked": false, "text": "気軽"},
    {"isChecked": false, "text": "相手次第"},
  ];

  List<Map<String, dynamic>> cigarettes = [
    {"isChecked": false, "text": "吸わない"},
    {"isChecked": false, "text": "たまに"},
    {"isChecked": false, "text": "吸う"},
  ];

  List<Map<String, dynamic>> sake = [
    {"isChecked": false, "text": "飲まない"},
    {"isChecked": false, "text": "たまに"},
    {"isChecked": false, "text": "飲む"},
  ];

  bool _isVerifyChecked = false;

  @override
  void initState() {
    super.initState();
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
                      SizedBox(
                          width: vw(context, 100),
                          height: vhh(context, 10),
                          child: Column(children: [
                            Expanded(child: Container()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    alignment: Alignment.centerLeft,
                                    width: 100,
                                    child: TextButton(
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
                                    )),
                                const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    child: Column(
                                      children: [
                                        Text("検索条件",
                                            style: TextStyle(
                                                color: PRIMARY_FONT_COLOR,
                                                fontSize: 14))
                                      ],
                                    )),
                                const SizedBox(
                                  width: 100,
                                  child: Text("条件をリセット",
                                      style: TextStyle(
                                          fontSize: 14, color: BUTTON_MAIN)),
                                )
                              ],
                            ),
                          ])),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: vww(context, 3)),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("年齢",
                                      style: TextStyle(
                                          color: PRIMARY_FONT_COLOR,
                                          fontSize: 14)),
                                  Text("18-25",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 155, 155, 155),
                                          fontSize: 17))
                                ],
                              )),
                          RangeSlider(
                            min: MIN_AGE,
                            max: MAX_AGE,
                            activeColor: const Color.fromARGB(255, 0, 199, 155),
                            inactiveColor:
                                const Color.fromARGB(255, 239, 239, 239),
                            values: _age_values,
                            onChanged: (RangeValues value) {
                              setState(() {
                                _age_values = value;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: vww(context, 3)),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("身長",
                                      style: TextStyle(
                                          color: PRIMARY_FONT_COLOR,
                                          fontSize: 14)),
                                  Text("~210",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 155, 155, 155),
                                          fontSize: 17))
                                ],
                              )),
                          RangeSlider(
                            min: MIN_HEIGHT,
                            max: MAX_HEIGHT,
                            activeColor: const Color.fromARGB(255, 0, 199, 155),
                            inactiveColor:
                                const Color.fromARGB(255, 239, 239, 239),
                            values: _height_values,
                            onChanged: (RangeValues value) {
                              setState(() {
                                _height_values = value;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: vww(context, 3)),
                              child: const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("居住地",
                                      style: TextStyle(
                                          color: PRIMARY_FONT_COLOR,
                                          fontSize: 14)),
                                  SizedBox(
                                    width: 150,
                                    child: Text(
                                      "北海道,東京,富山,福井,長野,兵庫,熊本",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(
                                              255, 155, 155, 155)),
                                    ),
                                  )
                                ],
                              )),
                          const SizedBox(height: 10),
                          FilterBadges(
                              text: "体型",
                              onChanged: (List<Map<String, dynamic>> list) {
                                setState(() {
                                  bodyTypes = list;
                                });
                              },
                              list: bodyTypes),
                          const SizedBox(height: 10),
                          FilterBadges(
                              text: "休日",
                              onChanged: (List<Map<String, dynamic>> list) {
                                setState(() {
                                  holidays = list;
                                });
                              },
                              list: holidays),
                          const SizedBox(height: 10),
                          FilterBadges(
                              text: "利用目的",
                              onChanged: (List<Map<String, dynamic>> list) {
                                setState(() {
                                  purpose = list;
                                });
                              },
                              list: purpose),
                          const SizedBox(height: 10),
                          FilterBadges(
                              text: "タバコ",
                              onChanged: (List<Map<String, dynamic>> list) {
                                setState(() {
                                  cigarettes = list;
                                });
                              },
                              list: cigarettes),
                          const SizedBox(height: 10),
                          FilterBadges(
                              text: "お酒",
                              onChanged: (List<Map<String, dynamic>> list) {
                                setState(() {
                                  sake = list;
                                });
                              },
                              list: sake),
                          const SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: vww(context, 3)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "本人確認しているユーザーのみ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: PRIMARY_FONT_COLOR),
                                  ),
                                  Switch(
                                    value: _isVerifyChecked,
                                    activeColor: Colors.green,
                                    onChanged: (value) {
                                      setState(() {
                                        _isVerifyChecked = value;
                                        // Perform some action based on whether the switch is on or off
                                      });
                                    },
                                  )
                                ],
                              ))
                        ],
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
                          return const UsersBottomModal();
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
                    "検索",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  )),
            )));
  }
}
