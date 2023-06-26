import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/utile/index.dart';

class BoardMessageModal extends StatefulWidget {
  const BoardMessageModal({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BoardMessageModalState createState() => _BoardMessageModalState();
}

class _BoardMessageModalState extends State<BoardMessageModal> {
  String message = "";

  final RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  );
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
          left: vww(context, 3),
          right: vww(context, 3),
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
          height: vhh(context, 35),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Image(
                          image: AssetImage("assets/images/users/Photos.png"),
                          width: 40,
                          height: 40),
                      Container(width: 5),
                      const Text("たかし",
                          style: TextStyle(
                              fontSize: 17, color: PRIMARY_FONT_COLOR))
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "23歳",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 151, 157, 170)),
                      ),
                      Container(width: 10),
                      const Text(
                        "東京都",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 151, 157, 170)),
                      ),
                      Container(width: 10),
                    ],
                  ),
                  SizedBox(
                      height: 35,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            disabledBackgroundColor:
                                const Color.fromARGB(255, 127, 228, 206),
                            disabledForegroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            textStyle: const TextStyle(fontSize: 13),
                            backgroundColor: BUTTON_MAIN,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30)),
                        onPressed: message.isEmpty ? null : () {},
                        child: const Text("送信", style: TextStyle(fontSize: 13)),
                      ))
                ],
              ),
              Expanded(
                  child: TextField(
                maxLines: 10,
                minLines: 4,
                decoration: InputDecoration(
                    hintText: "簡単な挨拶や趣味、休日の過ごし方、お相手の希望などを書いてみましょう。",
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10))),
                style: const TextStyle(
                  fontSize: 15,
                ),
                cursorColor: BUTTON_MAIN,
                onChanged: (value) {
                  setState(() {
                    message = value;
                  });
                },
              ))
            ],
          )),
    );
  }
}
