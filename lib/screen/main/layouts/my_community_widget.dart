import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/community_widget.dart';
import 'package:matching_app/utile/index.dart';

class MyCommunityWidget extends StatelessWidget {
  final List<dynamic> communityObjects;

  const MyCommunityWidget({Key? key, required this.communityObjects})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: vhh(context, 3), horizontal: vww(context, 6)),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text("参加コミュニティー",
                            style: TextStyle(
                                fontSize: 16, color: PRIMARY_FONT_COLOR),
                            textAlign: TextAlign.left)),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                            width: double.infinity - 20,
                            child: Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                alignment: WrapAlignment.spaceBetween,
                                children: List.generate(
                                  communityObjects.length,
                                  (index) {
                                    return FractionallySizedBox(
                                        widthFactor: 0.3,
                                        child: InkWell(
                                            child: CommunityWidget(
                                                isChecked: false,
                                                label: communityObjects[index]
                                                    .label,
                                                image:
                                                    "assets/images/community/c${(communityObjects[index].idx)}.png")));
                                  },
                                ))))
                  ],
                ))));
  }
}
