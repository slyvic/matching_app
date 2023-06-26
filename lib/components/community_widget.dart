import 'package:flutter/material.dart';

class CommunityWidget extends StatelessWidget {
  final String? image;
  final bool? isChecked;
  final String label;

  const CommunityWidget(
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
                    image: AssetImage("assets/images/community/selected.png")
                  )
                : Container(),
          ],
        ),
        Center(
          child: Text(label),
        )
      ],
    );
  }
}
