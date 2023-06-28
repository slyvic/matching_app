import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/utile/index.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({super.key, this.isBlockedUser});

  final bool? isBlockedUser;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Color.fromARGB(255, 237, 237, 237)))),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/users/Rectangle -3.png'),
                ),
              ),
            ),
            Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(top: 15, left: 10, bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        width: vww(context, 90) - 70,
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Test2",
                                  style: TextStyle(
                                      fontSize: 16, color: PRIMARY_FONT_COLOR))
                            ])),
                    SizedBox(
                        width: vww(context, 90) - 70,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text("群馬県　19歳",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 151, 157, 170),
                                      letterSpacing: -2.4)),
                              Container(
                                  height: 25.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: isBlockedUser == true ? const Color.fromARGB(255, 255, 70, 70) : BUTTON_MAIN,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                      color: isBlockedUser == true ? const Color.fromARGB(255, 255, 70, 70) : BUTTON_MAIN),
                                  child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Text("いいね",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white))))
                            ])),
                  ],
                ))
          ],
        ));
  }
}
