import 'package:flutter/material.dart';

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
                  height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 190, 189, 198),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Column(children: [
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Image(
                            image: AssetImage(
                                "assets/images/identity/photo-camera-svgrepo-com.png"),
                            width: 30,
                          )),
                      Text("写真2")
                    ]),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(image: AssetImage(item), height: 100,))));
  }
}
