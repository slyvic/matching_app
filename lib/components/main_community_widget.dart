import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';

class MainCommunityWidget extends StatelessWidget {
  final String? image;
  final bool? isChecked;
  final String label;

  const MainCommunityWidget(
      {Key? key, this.isChecked, this.image, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image(
              image: AssetImage(image!),
            ),
            isChecked == true
                ? const Image(
                    image: AssetImage("assets/images/community/selected.png",),
                  )
                : Container(),
          ],
        ),
        Center(
          child: Text(label, style: const TextStyle(fontSize: 13, color: PRIMARY_FONT_COLOR),),
        ),
        const Center(
          child: Text("6342人", style: TextStyle(fontSize: 11, color: Color.fromARGB(255, 151, 158, 171)),),
        )
      ],
    );
  }
}
