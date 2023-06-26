import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final String src;

  const BackgroundWidget({Key? key, required this.src}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(src),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
