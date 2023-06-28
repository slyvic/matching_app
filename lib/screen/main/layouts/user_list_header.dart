import 'package:flutter/material.dart';
import 'package:matching_app/screen/main/layouts/profile_edit_header.dart';

typedef OnTab = void Function(int id);

// ignore: unused_element
class UserListHeader extends SliverPersistentHeaderDelegate {
  final OnTab onTab;

  UserListHeader(this.onTab);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 120,
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 2, color: Color.fromARGB(255, 237, 237, 237)))),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 0),
        child: ProfileEditHeader(title: "設定"),
      ),
    );
  }

  @override
  double get maxExtent => 100.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
