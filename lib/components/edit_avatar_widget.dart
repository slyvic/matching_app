import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';

class EditAvatarWidget extends StatelessWidget {
  final dynamic item;

  const EditAvatarWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 0.3,
        child: InkWell(
            child: item == ""
                ? Container(
                    height: 110,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 190, 189, 198),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Column(children: [
                      Padding(
                          padding: EdgeInsets.only(top: 22),
                          child: Image(
                            image: AssetImage(
                                "assets/images/main/icons-tabbar-discover.png"),
                            width: 50,
                          )),
                      Text("写真2",
                          style: TextStyle(
                              fontSize: 11, color: PRIMARY_FONT_COLOR))
                    ]),
                  )
                : Container(
                    width: 100,
                    height: 110,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 190, 189, 198),
                        width: 1.0,
                      ),
                      color: PRIMARY_FONT_COLOR,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage(item),
                        fit: BoxFit.cover,
                      ),
                    ))));
  }
}
