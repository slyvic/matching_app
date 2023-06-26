import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/main_community_widget.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/screen/main/layouts/users_bottom_modal.dart';
import 'package:matching_app/utile/index.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CommunityBottomModal extends StatefulWidget {
  const CommunityBottomModal({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CommunityBottomModalState createState() => _CommunityBottomModalState();
}

class _CommunityBottomModalState extends State<CommunityBottomModal> {
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
          height: vhh(context, 45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Center(
                  child: Container(
                width: vw(context, 20),
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: PRIMARY_FONT_COLOR),
              )),
              const Text(
                "コミュニティー参加で\nもっと友達に",
                style: TextStyle(fontSize: 15, color: PRIMARY_FONT_COLOR),
                textAlign: TextAlign.center,
              ),
              const FractionallySizedBox(
                  widthFactor: 0.3,
                  child: MainCommunityWidget(
                      isChecked: false,
                      label: "ゴルフ",
                      image: "assets/images/community/c3.png")),
              Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: RadiusButton(
                      text: "参加する",
                      color: BUTTON_MAIN,
                      goNavigation: (id) {
                        Navigator.pop(context);

                        showMaterialModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            builder: (context) {
                              return const UsersBottomModal();
                            });
                      },
                      id: 0,
                      isDisabled: false))
            ],
          )),
    );
  }
}
