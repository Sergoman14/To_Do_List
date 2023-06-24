import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';

class IconGenerator extends StatelessWidget {
  const IconGenerator({Key? key, required this.importance}) : super(key: key);
  static const List<Color> colorList = [
    Color(0xFF8E8E93),
    Color(0x008E8E93),
    Color(0xFFFF3B30)
  ];
  final Importance importance;

  @override
  Widget build(BuildContext context) {
    if (importance == Importance.basic) {
      return Container();
    } else if (importance == Importance.low) {
      return Container(
          padding: const EdgeInsets.only(top: 12),
          child: Icon(Icons.arrow_downward_rounded, color: colorList[0]));
    } else {
      return Container(
        padding: const EdgeInsets.only(top: 12, left: 7, right: 7),
        child: Text(
            style: const TextStyle(fontSize: 18, color: Color(0xFFFF3B30), fontWeight: FontWeight.bold),
            String.fromCharCodes(Runes('\u{203C}'))),
      );
    }
  }
}
