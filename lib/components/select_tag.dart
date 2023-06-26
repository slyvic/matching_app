
import 'package:flutter/material.dart';

class SelectTag extends StatelessWidget {
  const SelectTag({
    super.key,
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;
  final Color darkAlias6 = const Color.fromRGBO(0, 202, 157, 1);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: darkAlias6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label, style: const TextStyle(fontSize: 15, color: Colors.white),),
      onDeleted: null
    );
  }
}