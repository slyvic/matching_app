import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_app/bloc/cubit.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/components/Header.dart';
import 'package:matching_app/utile/index.dart';

// import 'package:flutter_redux/flutter_redux.dart';
// ignore: use_key_in_widget_constructors
class HeightSelect extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HeightSelectState createState() => _HeightSelectState();
}

class _HeightSelectState extends State<HeightSelect> {
  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
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
                    padding: EdgeInsets.only(
                        left: getDeviceWidth(context) / 47 * 1,
                        right: getDeviceWidth(context) / 47 * 1),
                    child: const HeaderWidget(title: "プロフィール登録"),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: vh(context, 3),
                          left: getDeviceWidth(context) / 47 * 3,
                          right: getDeviceWidth(context) / 47 * 3),
                      child: const Text("身長を選択してください",
                          style: TextStyle(
                              fontSize: 24, color: PRIMARY_FONT_COLOR))),
                  Padding(
                    padding: EdgeInsets.only(
                        top: vh(context, 1),
                        left: getDeviceWidth(context) / 47 * 3,
                        right: getDeviceWidth(context) / 47 * 3),
                    child: const Text(
                      "絞り込み検索で発見しやすくなります",
                      style: TextStyle(fontSize: 12, color: PRIMARY_FONT_COLOR),
                    ),
                  ),
                  Center(
                      child: Padding(
                          padding: EdgeInsets.only(top: vh(context, 10)),
                          child: Text("${appCubit.height.floor()}cm",
                              style: const TextStyle(
                                  fontSize: 27, color: PRIMARY_FONT_COLOR)))),
                  Padding(
                    padding: EdgeInsets.only(
                        top: vh(context, 4),
                        left: getDeviceWidth(context) / 47 * 2,
                        right: getDeviceWidth(context) / 47 * 3),
                    child: Slider(
                      min: MIN_HEIGHT,
                      max: MAX_HEIGHT,
                      value: appCubit.height,
                      onChanged: (double value) {
                        setState(() {
                          appCubit.height = value;
                        });
                      },
                      activeColor: const Color.fromARGB(255, 0, 199, 155),
                      inactiveColor: const Color.fromARGB(255, 239, 239, 239),
                      thumbColor: const Color.fromARGB(255, 0, 199, 155),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getDeviceWidth(context) / 47 * 3),
                      child: SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: RadiusButton(
                              id: 0,
                              color: BUTTON_MAIN,
                              text: "つぎへ",
                              goNavigation: (id) {
                                Navigator.pushNamed(context, "/body_type");
                              },
                              isDisabled: false,
                            ),
                          ))),
                  Expanded(
                    child: Container(),
                  )
                ],
              )));
    });
  }
}
