import 'dart:io';

import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/components/Header.dart';
import 'package:matching_app/utile/index.dart';

// import 'package:flutter_redux/flutter_redux.dart';
// ignore: use_key_in_widget_constructors
class ImageCheck extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ImageCheckState createState() => _ImageCheckState();
}

class _ImageCheckState extends State<ImageCheck> {
  File? imagefile;

  @override
  Widget build(BuildContext context) {
    Object? imagePath = ModalRoute.of(context)!.settings.arguments;
    imagefile = File(imagePath.toString());
    print(imagePath);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            constraints: BoxConstraints(
              minHeight: vh(context, 90), // Set the minimum height here
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: vw(context, 1)),
                  child: const HeaderWidget(title: "本人確認"),
                ),
                Center(
                  child: Padding(padding: EdgeInsets.symmetric(horizontal: vw(context, 5), vertical: vh(context, 10)), child: SizedBox(height: vh(context, 30), width: double.infinity, child: Image.file(imagefile!, fit: BoxFit.cover,),))
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: vw(context, 3)),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: Alignment.center,
                          child: RadiusButton(
                            id: 0,
                            color: BUTTON_MAIN,
                            text: "提出",
                            goNavigation: (id) {
                              Navigator.pushNamed(context, "/image_submit");
                            },
                            isDisabled: false,
                          ),
                        ))),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getDeviceWidth(context) / 47 * 3),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: InkWell(
                            onTap: () {},
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: vh(context, 2),
                                    bottom: vh(context, 3)),
                                child: const Text("撮り直す",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Color.fromARGB(
                                            255, 0, 202, 157))))))),
              ],
            )));
  }
}
