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
class AddressCheck extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AddressCheckState createState() => _AddressCheckState();
}

class _AddressCheckState extends State<AddressCheck> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppCubit>(context).fetchAddressList();
  }

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(children: [
            Column(
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
                    child: const Text("居住地を教えてください",
                        style: TextStyle(
                            fontSize: 24, color: PRIMARY_FONT_COLOR))),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: vh(context, 25),
                    bottom: vh(context, 10),
                    left: getDeviceWidth(context) / 47 * 3,
                    right: getDeviceWidth(context) / 47 * 3),
                child: ListView.builder(
                  itemCount: appCubit.addressList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final addressItem = appCubit.addressList[index];
                    return InkWell(
                        onTap: () {
                          List<AddressObject> temp = appCubit.addressList;
                          for (int i = 0; i < appCubit.addressList.length; i++) {
                            if (index == i) {
                              appCubit.addressList[i].isChecked = true;
                            } else {
                              appCubit.addressList[i].isChecked = false;
                            }
                          }
                          setState(() {
                            appCubit.addressList = temp;
                          });
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: CheckButton(
                            fontColor: PRIMARY_FONT_COLOR,
                            text1: "",
                            text2: addressItem.address,
                            text3: "",
                            text4: "",
                            fontSize: 17,
                            isChecked: addressItem.isChecked));
                  },
                )),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                              Navigator.pushNamed(context, "/choose_community");
                            },
                            isDisabled: appCubit.addressList
                                .where((element) => element.isChecked == true)
                                .isEmpty),
                      )),
                ))
          ]));
    });
  }
}
