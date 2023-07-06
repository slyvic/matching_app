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
class BodyType extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _BodyTypeState createState() => _BodyTypeState();
}

class _BodyTypeState extends State<BodyType> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppCubit>(context).fetchBodyTypeList();
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
                      child: const Text("体型を選択してください",
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
                              appCubit.bodyTypeList.length,
                              (index) {
                                return 
                          InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                appCubit.changeBodyType(appCubit.bodyTypeList[index].id);
                              },
                              child: CheckButton(
                                  fontColor: PRIMARY_FONT_COLOR,
                                  text2: appCubit.bodyTypeList[index].title,
                                  fontSize: 17,
                                  isChecked: appCubit.bodyTypeList[index].id == appCubit.bodyType));
                              }),
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
                              text: "つぎへ${appCubit.bodyType}",
                              goNavigation: (id) {
                                Navigator.pushNamed(context, "/purpose_use");
                              },
                              isDisabled:
                                  appCubit.bodyType == -1,
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
