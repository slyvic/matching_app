// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_app/bloc/cubit.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/check_input.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/components/Header.dart';
import 'package:matching_app/utile/index.dart';

// ignore: must_be_immutable
class NickName extends StatelessWidget {
  String nickName = '';

  NickName({super.key});

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
                      child: const Text("ニックネームを教えてください",
                          style: TextStyle(
                              letterSpacing: -1.5,
                              fontSize: 24,
                              color: PRIMARY_FONT_COLOR))),
                  Padding(
                      padding: EdgeInsets.only(
                          top: vh(context, 10),
                          left: getDeviceWidth(context) / 47 * 3,
                          right: getDeviceWidth(context) / 47 * 3),
                      child: CheckInput(
                        onChanged: (value) {
                          appCubit.changeNickName(value);
                        },
                        isEnabled: true,
                        isChecked: nickName.isNotEmpty,
                        text: appCubit.nickName,
                      )),
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
                                Navigator.pushNamed(context, "/b_day");
                              },
                              isDisabled: appCubit.nickName.isEmpty,
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
