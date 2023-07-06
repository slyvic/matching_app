// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_app/bloc/cubit.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/community_widget.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/components/Header.dart';
import 'package:matching_app/utile/index.dart';

// import 'package:flutter_redux/flutter_redux.dart';
// ignore: use_key_in_widget_constructors
class ChooseCommunity extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ChooseCommunityState createState() => _ChooseCommunityState();
}

class _ChooseCommunityState extends State<ChooseCommunity> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppCubit>(context).fetchCommunityList();
  }

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(children: [
            Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                    height: vh(context, 30),
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
                            child: const Text("興味のあるコミュニティーを",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: PRIMARY_FONT_COLOR,
                                    letterSpacing: -2))),
                        Padding(
                            padding: EdgeInsets.only(
                                top: vh(context, 4),
                                left: getDeviceWidth(context) / 47 * 3,
                                right: getDeviceWidth(context) / 47 * 3),
                            child: const Text("同じコミュニティに所属する気の合う人が見つかります",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: PRIMARY_FONT_COLOR,
                                    letterSpacing: -2))),
                      ],
                    ))),
            Padding(
                padding: EdgeInsets.only(bottom: vh(context, 10)),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        height: vh(context, 70),
                        child: SingleChildScrollView(
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: vw(context, 2)),
                                child: Align(
                                    child: Row(children: [
                                  Expanded(
                                      child: Wrap(
                                          spacing: 8,
                                          runSpacing: 8,
                                          alignment: WrapAlignment.center,
                                          children: List.generate(
                                            appCubit.communityList.length,
                                            (index) {
                                              if (appCubit.communityList[index]
                                                      .parent !=
                                                  -1) {
                                                return FractionallySizedBox(
                                                    widthFactor: 0.3,
                                                    child: InkWell(
                                                        onTap: () {
                                                          if (appCubit.communityList[index].isChecked ==false && appCubit.communityList
                                                                      .where((element) =>element.isChecked).length < 3) {
                                                                        setState(() {
                                                                          appCubit.communityList[index].isChecked = !appCubit.communityList[index].isChecked;
                                                                        });
                                                          } else if (appCubit.communityList[index].isChecked == true) {
                                                            setState(() {
                                                              appCubit.communityList[index].isChecked = !appCubit.communityList[index].isChecked;
                                                            });
                                                          }
                                                        },
                                                        child: CommunityWidget(
                                                            isChecked: appCubit
                                                                .communityList[
                                                                    index]
                                                                .isChecked,
                                                            label: appCubit
                                                                .communityList[
                                                                    index]
                                                                .label,
                                                            image: appCubit
                                                                .communityList[
                                                                    index]
                                                                .image)));
                                              } else {
                                                return FractionallySizedBox(
                                                    widthFactor: 1,
                                                    child: Row(
                                                      children: [
                                                        Text(appCubit
                                                            .communityList[
                                                                index]
                                                            .label),
                                                        Image.network(
                                                          appCubit
                                                              .communityList[
                                                                  index]
                                                              .image,
                                                          loadingBuilder: (context,
                                                              child,
                                                              loadingProgress) {
                                                            if (loadingProgress ==
                                                                null) {
                                                              return child;
                                                            }
                                                            return Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                                value: loadingProgress
                                                                            .expectedTotalBytes !=
                                                                        null
                                                                    ? loadingProgress
                                                                            .cumulativeBytesLoaded /
                                                                        loadingProgress
                                                                            .expectedTotalBytes!
                                                                    : null,
                                                              ),
                                                            );
                                                          },
                                                          errorBuilder:
                                                              (context, error,
                                                                  stackTrace) {
                                                            return const Text(
                                                                'Error loading image');
                                                          },
                                                          height: 25,
                                                        )
                                                      ],
                                                    ));
                                              }
                                            },
                                          )))
                                ]))))))),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SizedBox(
                      height: vh(context, 10),
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: RadiusButton(
                            id: 0,
                            color: BUTTON_MAIN,
                            text: "つぎへ",
                            goNavigation: (id) {
                              Navigator.pushNamed(context, "/height_select");
                            },
                            isDisabled: appCubit.communityList
                                .where((element) => element.isChecked == true)
                                .isEmpty),
                      )),
                ))
          ]));
    });
  }
}
