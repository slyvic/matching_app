import 'package:flutter/material.dart';
import 'package:matching_app/screen/main/layouts/profile_edit_header.dart';


// ignore: unused_element
class SettingHeaderNoBorder extends SliverPersistentHeaderDelegate {
  final String title;

  SettingHeaderNoBorder(this.title);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 120,
      padding: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: ProfileEditHeader(title: title),
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
