import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/screen/main/layouts/pined_chatting_header.dart';
import 'package:matching_app/utile/index.dart';

// ignore: use_key_in_widget_constructors
class ChattingScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ChattingScreenState createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              flexibleSpace:
                  FlexibleSpaceBar(background: PinedChattingHeader()))),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: 1,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                  padding: EdgeInsets.symmetric(horizontal: vww(context, 5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 1,
                                    color: const Color.fromARGB(
                                        255, 252, 124, 44)),
                                color:
                                    const Color.fromARGB(255, 250, 229, 229)),
                            child: const Text(
                              "フレンチ",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 252, 124, 44)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 7),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 1,
                                    color:
                                        const Color.fromARGB(255, 0, 171, 202)),
                                color:
                                    const Color.fromARGB(255, 229, 239, 250)),
                            child: const Text(
                              "アニソン",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 0, 171, 202)),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                          alignment: Alignment.topCenter,
                          child: const Text("ボード機能でマッチングしました",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: BUTTON_MAIN)))
                    ],
                  ));
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: Color.fromARGB(255, 193, 192, 201),
                          width: 0.5)),
                  color: Color.fromARGB(255, 230, 231, 234)),
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              constraints: BoxConstraints(
                minHeight: 50,
                maxHeight: vhh(context, 30),
              ),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 1),
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt_rounded),
                            onPressed: () {},
                            color: const Color.fromARGB(255, 193, 192, 201),
                          )),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child:TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "メッセージを入力",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 193, 192, 201)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 193, 192, 201))),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 193, 192, 201)),
                        ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  )),
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {},
                      color: BUTTON_MAIN,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
