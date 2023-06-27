// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/edit_avatar_widget.dart';
import 'package:matching_app/utile/index.dart';
import 'layouts/profile_edit_header.dart';

// ignore: use_key_in_widget_constructors
class ProfileEditScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  List<dynamic> items = [];
  List<BadgeObject> badgeList = [];

  @override
  void initState() {
    super.initState();
    items = [
      "assets/images/users/user.png",
      "",
      "",
      "",
      "",
      "",
    ];
    badgeList = [
      BadgeObject("とにかく話したい", false, 1),
      BadgeObject("いつでも", false, 2),
      BadgeObject("鉄板焼き", false, 3),
    ];
  }

  @override
  Widget build(BuildContext context) {
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
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      child: ProfileEditHeader(title: "プロフィール"),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: vhh(context, 3),
                            horizontal: vww(context, 6)),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: SizedBox(
                                            width: double.infinity - 20,
                                            child: Wrap(
                                                spacing: 8,
                                                runSpacing: 15,
                                                alignment:
                                                    WrapAlignment.spaceBetween,
                                                children: List.generate(
                                                  items.length,
                                                  (index) {
                                                    return EditAvatarWidget(
                                                        item: items[index]);
                                                  },
                                                ))))
                                  ],
                                ))))
                  ]);
            }, childCount: 1)),
          ],
        ));
  }
}
