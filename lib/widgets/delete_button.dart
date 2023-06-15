import 'package:flutter/material.dart';

import '../models/task.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({Key? key, required this.isNew}) : super(key: key);
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    if (isNew) {
      return Row(
        children: const [
          Icon(
            Icons.delete,
            color: Color(0x26000000),
          ),
          Text(
            'Удалить',
            style:
                TextStyle(color: Color(0x26000000), height: 1.25, fontSize: 16),
          )
        ],
      );
    } else {
      return GestureDetector(
        onTap: () {
          Navigator.pop(
              context,
              Task(
                  id: -2, desc: '', importance: Importance.none, done: false, deadline: ""));
        },
        child: Row(
          children: const [
            Icon(
              Icons.delete,
              color: Color(0xFFFF3B30),
            ),
            Text(
              'Удалить',
              style: TextStyle(
                  color: Color(0xFFFF3B30), height: 1.25, fontSize: 16),
            )
          ],
        ),
      );
    }
  }
}
