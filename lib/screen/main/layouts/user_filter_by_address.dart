import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/screen/main/layouts/user_filter_by_info.dart';
import 'package:matching_app/utile/index.dart';

class UserFilterByAddress extends StatefulWidget {
  const UserFilterByAddress({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserFilterByAddressState createState() => _UserFilterByAddressState();
}

class _UserFilterByAddressState extends State<UserFilterByAddress> {
  List<AddressObject> selectedList = [];
  List<AddressObject> badgeList = <AddressObject>[
    AddressObject(0, "北海道", false),
    AddressObject(0, "青森県", false),
    AddressObject(0, "岩手県", false),
    AddressObject(0, "宮城県", false),
    AddressObject(0, "秋田県", false),
    AddressObject(0, "山形県", false),
    AddressObject(0, "福島県", false),
    AddressObject(0, "茨城県", false),
    AddressObject(0, "栃木県", false),
    AddressObject(0, "群馬県", false),
    AddressObject(0, "埼玉県", false),
    AddressObject(0, "千葉県", false),
    AddressObject(0, "東京都", false),
    AddressObject(0, "神奈川県", false),
    AddressObject(0, "新潟県", false),
    AddressObject(0, "富山県", false),
    AddressObject(0, "石川県", false),
    AddressObject(0, "福井県", false),
    AddressObject(0, "山梨県", false),
    AddressObject(0, "長野県", false),
    AddressObject(0, "岐阜県", false),
    AddressObject(0, "静岡県", false),
    AddressObject(0, "愛知県", false),
    AddressObject(0, "三重県", false),
    AddressObject(0, "滋賀県", false),
    AddressObject(0, "京都府", false),
    AddressObject(0, "大阪府", false),
    AddressObject(0, "兵庫県", false),
    AddressObject(0, "奈良県", false),
    AddressObject(0, "和歌山県", false),
    AddressObject(0, "鳥取県", false),
    AddressObject(0, "島根県", false),
    AddressObject(0, "岡山県", false),
    AddressObject(0, "広島県", false),
    AddressObject(0, "山口県", false),
    AddressObject(0, "徳島県", false),
    AddressObject(0, "香川県", false),
    AddressObject(0, "愛媛県", false),
    AddressObject(0, "高知県", false),
    AddressObject(0, "福岡県", false),
    AddressObject(0, "佐賀県", false),
    AddressObject(0, "長崎県", false),
    AddressObject(0, "熊本県", false),
    AddressObject(0, "大分県", false),
    AddressObject(0, "宮崎県", false),
    AddressObject(0, "鹿児島県", false),
    AddressObject(0, "沖縄県", false),
  ];
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
                      Wrap(
                          spacing: 4,
                          runSpacing: -8,
                          children: badgeList.map((AddressObject e) {
                            return FilterChip(
                                label: Text(e.address,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: e.isChecked
                                            ? Colors.white
                                            : BUTTON_MAIN)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: const BorderSide(
                                      color: BUTTON_MAIN, width: 1.0),
                                ),
                                clipBehavior: Clip.antiAlias,
                                backgroundColor:
                                    e.isChecked ? BUTTON_MAIN : Colors.white,
                                selectedColor: BUTTON_MAIN,
                                onSelected: (isSelected) => setState(() {
                                      e.isChecked = !e.isChecked;
                                    }));
                          }).toList()),
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
                          return const UserFilterByInfo();
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
