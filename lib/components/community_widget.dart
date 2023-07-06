import 'package:flutter/material.dart';

class CommunityWidget extends StatelessWidget {
  final String image;
  final bool? isChecked;
  final String label;

  const CommunityWidget(
      {Key? key, this.isChecked, required this.image, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.network(image,
                loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            }, errorBuilder: (context, error, stackTrace) {
              return Text('Error loading image');
            }),
            isChecked == true
                ? const Image(
                    image: AssetImage("assets/images/community/selected.png"))
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
