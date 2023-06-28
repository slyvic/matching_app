import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/screen/main/layouts/setting_header_no_border.dart';
import 'package:matching_app/utile/index.dart';

class AccountCloseScreen extends StatefulWidget {
  const AccountCloseScreen({super.key});

  @override
  AccountCloseScreenState createState() => AccountCloseScreenState();
}

class AccountCloseScreenState extends State<AccountCloseScreen>
    with SingleTickerProviderStateMixin {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
              delegate: SettingHeaderNoBorder("退会"), pinned: true),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: vww(context, vww(context, 1))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 3,
                                    blurRadius: 8,
                                    offset: const Offset(0, 6))
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Text("退会の前に以下の\n注意事項に同意する必要があります。",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 255, 70, 70)))),
                      const Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Text(
                            "1.退会することで以下の情報が削除されるこ\nとになります。",
                            style: TextStyle(
                                fontSize: 16, color: PRIMARY_FONT_COLOR),
                          )),
                      const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "・会員情報\n・マッチング情報\n・メッセージ履歴\n・その他のすべてのデータ",
                            style: TextStyle(
                                fontSize: 13, color: PRIMARY_FONT_COLOR),
                          )),
                      const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text(
                            "2.再度登録時に前回のデータを引き継ぐこ\nとはできません。",
                            style: TextStyle(
                                fontSize: 16, color: PRIMARY_FONT_COLOR),
                          )),
                      const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            "引き継ぎたい場合は、ログアウトを選択してください。",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 255, 70, 70)),
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              _isChecked = !_isChecked;
                            });
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 15,
                                  child: Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    value: _isChecked,
                                    activeColor: BUTTON_MAIN,
                                    checkColor: Colors.white,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  )),
                              const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "上記に同意します。",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color.fromARGB(255, 93, 93, 93)),
                                  ))
                            ],
                          )),
                    ]));
          }, childCount: 1)),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: vww(context, 3)),
              child: SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  RadiusButton(
                    id: 0,
                    color: BUTTON_MAIN,
                    text: "退会する",
                    goNavigation: (id) {
                      Navigator.pushNamed(context, "/");
                    },
                    isDisabled: !_isChecked,
                  )
                ]),
              ))),
    );
  }
}
