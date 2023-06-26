import 'package:flutter/material.dart';

typedef OnPressed = void Function(int id);

class RadiusButton extends StatelessWidget {
  final String text;
  final Color color;
  final OnPressed goNavigation;
  final int id;
  final bool? isDisabled;

  const RadiusButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.goNavigation,
      required this.id,
      this.isDisabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 1,
        child: Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            child: Opacity(
              opacity: isDisabled == null || isDisabled == true ? .5 : 1,
              child: ElevatedButton(
                onPressed: isDisabled == null || isDisabled == true
                    ? null
                    : () {
                        goNavigation(id);
                      },
                style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: color,
                    disabledForegroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    textStyle: const TextStyle(fontSize: 15),
                    backgroundColor: color,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 13)),
                child: Text(text),
              ),
            )));
  }
}
