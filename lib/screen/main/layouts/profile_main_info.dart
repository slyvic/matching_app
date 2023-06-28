import 'package:flutter/material.dart';

class ProfileMainInfo extends StatelessWidget {
  const ProfileMainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/users_profile_screen");
                },
                  child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/me.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ))),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text("TSUBASA", style: TextStyle(fontSize: 17))),
                Text("25歳 東京都", style: TextStyle(fontSize: 12)),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              ]))
        ]),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(children: [
                  Image(
                      image: AssetImage("assets/images/status/on.png"),
                      width: 20),
                  Padding(
                      padding: EdgeInsets.only(right: 50),
                      child: Text(" 本人確認済み", style: TextStyle(fontSize: 12))),
                ])),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/profile_edit_screen");
                },
                child: Container(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 10, right: 15),
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 229, 250, 245),
                    ),
                    child: const Text("プロフィール編集",
                        style: TextStyle(
                            letterSpacing: -1.5,
                            fontSize: 12,
                            color: Color.fromARGB(255, 0, 202, 157)))))
          ],
        )
      ],
    );
  }
}
