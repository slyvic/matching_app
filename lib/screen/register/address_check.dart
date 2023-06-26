import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/check_button.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/components/Header.dart';
import 'package:matching_app/utile/index.dart';

// import 'package:flutter_redux/flutter_redux.dart';
// ignore: use_key_in_widget_constructors
class AddressCheck extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AddressCheckState createState() => _AddressCheckState();
}

class _AddressCheckState extends State<AddressCheck> {
  List<AddressObject> items = <AddressObject>[
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
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: getDeviceWidth(context) / 47 * 1,
                    right: getDeviceWidth(context) / 47 * 1),
                child: const HeaderWidget(title: "プロフィール登録"),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: vh(context, 3),
                      left: getDeviceWidth(context) / 47 * 3,
                      right: getDeviceWidth(context) / 47 * 3),
                  child: const Text("居住地を教えてください",
                      style:
                          TextStyle(fontSize: 24, color: PRIMARY_FONT_COLOR))),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: vh(context, 25),
                  bottom: vh(context, 10),
                  left: getDeviceWidth(context) / 47 * 3,
                  right: getDeviceWidth(context) / 47 * 3),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  final addressItem = items[index];
                  return InkWell(
                      onTap: () {
                        List<AddressObject> temp = items;
                        for (int i = 0; i < items.length; i++) {
                          if (index == i) {
                            items[i].isChecked = true;
                          } else {
                            items[i].isChecked = false;
                          }
                        }
                        setState(() {
                          items = temp;
                        });
                      },
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: CheckButton(
                          fontColor: PRIMARY_FONT_COLOR,
                          text1: "",
                          text2: addressItem.address,
                          text3: "",
                          text4: "",
                          fontSize: 17,
                          isChecked: addressItem.isChecked));
                },
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RadiusButton(
                          id: 0,
                          color: BUTTON_MAIN,
                          text: "つぎへ",
                          goNavigation: (id) {
                            Navigator.pushNamed(context, "/choose_community");
                          },
                          isDisabled: items
                              .where((element) => element.isChecked == true)
                              .isEmpty),
                    )),
              ))
        ]));
  }
}
