import 'package:flutter/material.dart';

import '../models/task.dart';
import '../theme/app_text_styles.dart';
import '../theme/elements_color.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({Key? key, required this.isNew}) : super(key: key);
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    if (isNew) {
      return Row(
        children: [
          Icon(
            Icons.delete,
            color: TodoElementsColor.getBackSecondaryColor(context),
          ),
          Text(
            'Удалить',
            style: AppTextStyles.regylarBodyText.copyWith(
              color: TodoElementsColor.getBackSecondaryColor(context),
            ),
          )
        ],
      );
    } else {
      return GestureDetector(
        onTap: () {
          Navigator.pop(
              context,
              Task(
                  id: -2,
                  desc: '',
                  importance: Importance.basic,
                  done: false,
                  deadline: null));
        },
        child: Row(
          children: [
            Icon(
              Icons.delete,
              color: TodoElementsColor.getRedColor(context),
            ),
            Text(
              'Удалить',
              style: AppTextStyles.regylarBodyText.copyWith(
                color: TodoElementsColor.getRedColor(context),
              ),
            )
          ],
        ),
      );
    }
  }
}
