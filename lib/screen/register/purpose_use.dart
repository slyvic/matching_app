import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_app/bloc/cubit.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/check_button.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/components/Header.dart';
import 'package:matching_app/utile/index.dart';

// import 'package:flutter_redux/flutter_redux.dart';
// ignore: use_key_in_widget_constructors
class PurposeUse extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _PurposeUseState createState() => _PurposeUseState();
}

class _PurposeUseState extends State<PurposeUse> {
  List<bool> purpose = [false, false, false];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppCubit>(context).fetchPurposeList();
  }
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
                    child: const Text("利用目的を選択してください",
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
                Padding(
                    padding: EdgeInsets.only(
                        top: vh(context, 3),
                        left: getDeviceWidth(context) / 47 * 4,
                        right: getDeviceWidth(context) / 47 * 4),
                    child: Column(
                      children: List.generate(
                              appCubit.purposeList.length,
                              (index) {
                                return InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              appCubit.changePurpose(appCubit.purposeList[index].id);
                            },
                            child: CheckButton(
                                fontColor: PRIMARY_FONT_COLOR,
                                text2: appCubit.purposeList[index].title,
                                fontSize: 17,
                                isChecked: appCubit.purposeList[index].id == appCubit.purpose));
                              })
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
                              Navigator.pushNamed(context, "/badge_select");
                            },
                            isDisabled: appCubit.purpose == -1,
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
