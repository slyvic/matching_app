import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/utile/index.dart';

typedef OnPressed = void Function(List<Map<String, dynamic>> values);

// ignore: must_be_immutable
class FilterBadges extends StatelessWidget {
  final String text;
  final List<Map<String, dynamic>> list;
  OnPressed onChanged;

  FilterBadges({Key? key, required this.text, required this.onChanged, required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: vww(context, 3)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text,
                style: const TextStyle(color: PRIMARY_FONT_COLOR, fontSize: 14)),
            Wrap(
                spacing: 8,
                runSpacing: -8,
                children: list.map((Map<String, dynamic> e) {
                  return FilterChip(
                      label: Text(e['text'],
                          style: TextStyle(
                              fontSize: 14,
                              color:
                                  e['isChecked'] ? Colors.white : BUTTON_MAIN)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(color: BUTTON_MAIN, width: 1.0),
                      ),
                      clipBehavior: Clip.antiAlias,
                      backgroundColor:
                          e['isChecked'] ? BUTTON_MAIN : Colors.white,
                      selectedColor: BUTTON_MAIN,
                      onSelected: (isSelected) {
                        e['isChecked'] = !e['isChecked'];
                        onChanged(list);
                        });
                }).toList()),
          ],
        ));
  }
}
