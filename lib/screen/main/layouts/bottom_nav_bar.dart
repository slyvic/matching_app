import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    void onTabTapped(int index) {
      switch (index) {
        case 0:
          Navigator.pushNamed(context, "/board_function");
          break;
        case 1:
          Navigator.pushNamed(context, "/community_screen");
          break;
        case 2:
          Navigator.pushNamed(context, "/following_users");
          break;
        case 3:
          Navigator.pushNamed(context, "/chat_screen");
          break;
        case 4:
          Navigator.pushNamed(context, "/profile_screen");
          break;
        default:
          break;
      }
    }

    return Container(
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: PRIMARY_FONT_COLOR,
          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
                icon: Image(
                    image: currentIndex == 0
                        ? const AssetImage("assets/images/main/board-icon1.png")
                        : const AssetImage(
                            "assets/images/main/board-icon2.png"),
                    width: 24),
                label: "ボード"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 8, top: 5),
                  child: Image(
                      image: currentIndex == 1
                          ? const AssetImage(
                              "assets/images/main/community-icon1.png")
                          : const AssetImage(
                              "assets/images/main/community-icon2.png"),
                      width: 24),
                ),
                label: "コミュニティ"),
            BottomNavigationBarItem(
                icon: currentIndex == 2
                    ? const Image(
                        image: AssetImage("assets/images/main/like-icon1.png"),
                        width: 24)
                    : const Image(
                        image: AssetImage("assets/images/main/like-icon2.png"),
                        width: 24),
                label: "いいね"),
            BottomNavigationBarItem(
                icon: Image(
                    image: currentIndex == 3
                        ? const AssetImage(
                            "assets/images/main/Message-icon1.png")
                        : const AssetImage(
                            "assets/images/main/Message-icon2.png"),
                    width: 24),
                label: "メッセージ"),
            BottomNavigationBarItem(
                icon: Image(
                    image: currentIndex == 4
                        ? const AssetImage("assets/images/main/my-icon1.png")
                        : const AssetImage("assets/images/main/my-icon2.png"),
                    width: 24),
                label: "マイページ"),
          ],
        ));
  }
}
