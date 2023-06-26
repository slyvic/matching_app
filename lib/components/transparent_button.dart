import 'package:flutter/material.dart';

class TransParentButton extends StatelessWidget {
  final String text;

  const TransParentButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 0.8,
        child: ElevatedButton(
          onPressed: () {
            print("Button pressed");
          },
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 15),
              backgroundColor: const Color.fromARGB(0, 0, 0, 0),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10)),
          child: Text(text),
        ));
  }
}
