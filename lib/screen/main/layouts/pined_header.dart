
import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/utile/index.dart';  
typedef OnTabTap = void Function(int id);
// ignore: unused_element
class PinedHeader extends SliverPersistentHeaderDelegate {
  final TabController _tabController;
  final _selectedColor = BUTTON_MAIN;
  final _unselectedColor = const Color(0xff5f6368);
  final _tabs = [
    const Tab(text: 'マッチング中'),
    const Tab(text: 'メッセージ'),
  ];

  final OnTabTap onTabTap;

  PinedHeader(this._tabController, this.onTabTap);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
          border: Border(
              bottom: BorderSide(
                  width: 1, color: Color.fromARGB(255, 237, 237, 237)))),
      child: Padding(
        padding: EdgeInsets.only(
            top: vhh(context, 8),
            left: vww(context, 5),
            right: vww(context, 5)),
        child: TabBar(
          controller: _tabController,
          tabs: _tabs,
          labelColor: _selectedColor,
          indicatorColor: _selectedColor,
          unselectedLabelColor: _unselectedColor,
          onTap: (value) {
            onTabTap(value);
          },
        ),
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
